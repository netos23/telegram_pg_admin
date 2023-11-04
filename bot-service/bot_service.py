import os
import urllib.parse
import uuid
from collections import defaultdict
from datetime import datetime, timedelta
from decimal import Decimal
from typing import Optional

import clickhouse_connect
from dateutil import parser
from dotenv import load_dotenv
from flask import Flask, jsonify, Response
from flask import request
from flask_apscheduler import APScheduler
from flask_cors import CORS, cross_origin
from flask_pydantic import validate
from pydantic import BaseModel

from ext_http_client import send_post, send_get
from models import UrlConnection
from models import db
from telegram_sender import TelegramSender

app = Flask(__name__)
db_path = os.path.join(os.path.dirname(__file__), 'app.db')
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///{}'.format(db_path)
app.config['CORS_HEADERS'] = 'Content-Type'
scheduler = APScheduler()


class RequestCreateModel(BaseModel):
    name: str
    tg_user_id: str
    url: Optional[str]


@app.errorhandler(500)
def internal_error(error):
    api_key = request.json.get('api_key')
    if api_key:
        connection = UrlConnection.query.filter_by(api_key=api_key).one()
        TelegramSender().send_message(f"Connection: {connection.name}. Error", connection.tg_user_id)
    return error


@app.route("/create/", methods=["POST"])
@validate()
@cross_origin()
def post(body: RequestCreateModel):
    api_key = str(uuid.uuid4())
    connection = UrlConnection(**body.model_dump(), api_key=api_key)
    db.session.add(connection)
    db.session.commit()
    return {'api_key': api_key}


@app.route("/list_keys/", methods=["GET"])
@cross_origin()
def list_keys():
    tg_user_id = request.args.get('tg_user_id')
    connections = UrlConnection.query.filter_by(tg_user_id=tg_user_id).all()
    return jsonify(connections)


class RequestCommandModel(BaseModel):
    command: str
    parameter: Optional[str]


@app.route("/exec/", methods=["POST"])
@validate()
@cross_origin()
def exec_command(body: RequestCommandModel):
    api_key = request.json.get('api_key')
    if not api_key:
        return {}, 401
    connection = UrlConnection.query.filter_by(api_key=api_key).one()
    error, status = send_post(connection.url + "/exec", api_key, body.model_dump())
    return {}, status


class ResponseMetricModel(BaseModel):
    name: str
    value: Decimal
    aggregation: str
    timestamp: datetime


# @app.route("/get_metrics/", methods=["POST"])
# @cross_origin()
#@scheduler.task('interval', id='my_job', seconds=15)
def get_metrics():
    print('This job is executed every 15 seconds.')
    with app.app_context():
        connections = UrlConnection.query.all()
        for connection in connections:
            try:
                api_key = connection.api_key
                cur_time = datetime.now()
                res, status = send_get(urllib.parse.urljoin(connection.url, "/get_metrics"), api_key, {})
                column_names = ['timestamp', 'name', 'value', 'aggregation']
                rows = []
                if status != 200:
                    TelegramSender().send_message(f"Connection: {connection.name}. {res}",
                                                  connection.tg_user_id)
                    metrics_name = client.query('SELECT DISTINCT name FROM metrics WHERE api_key= %s ',
                                                parameters=(api_key,))
                    for name in metrics_name.result_rows:
                        rows.append([cur_time, name[0], None, None, api_key])

                for r in res or []:
                    row = []
                    for col in column_names:
                        if col != 'timestamp':
                            row.append(r.get(col))
                        else:
                            datetime_obj = parser.parse(r.get(col))
                            row.append(datetime_obj)
                    row.append(api_key)
                    rows.append(row)
                client.insert('metrics', rows, column_names=[*column_names, 'api_key'])
            except Exception as e:
                TelegramSender().send_message(f"Connection: {connection.name}. Error: {str(e)}", connection.tg_user_id)
    return


@app.route("/dashboard/", methods=["POST"])
@cross_origin()
def dashboard():
    api_key = request.json.get('api_key')
    if not api_key:
        return {}, 401

    default = datetime.today() - timedelta(hours=0, minutes=15)
    date_from = request.json.get('date_from') or default.timestamp()
    date_to = request.json.get('date_to') or 1000000000000000
    result = client.query(
        'SELECT timestamp, name, value FROM metrics WHERE api_key= %s and timestamp>=toDateTime(%s) and timestamp<=toDateTime(%s) order by timestamp, name',
        parameters=(api_key, date_from, date_to))
    ans = defaultdict(list)
    for row in result.result_rows:
        ans[row[1]].append(
            {"value": float(row[2]) if row[2] is not None else row[2],
             "timestamp": int(row[0].timestamp())})
        # strftime("%d.%m.%Y %H:%M:%S")})

    return [{'name': k, 'units': v} for k, v in ans.items()], 200


@app.route("/dumps/", methods=["POST"])
@cross_origin()
def dumps():
    api_key = request.json.get('api_key')
    if not api_key:
        return {}, 401
    connection = UrlConnection.query.filter_by(api_key=api_key).one()
    data, status = send_get(connection.url + "/dumps", api_key, {})
    return data or '', status


@app.before_request
def before_request():
    if request.method.lower() == 'options':
        return Response()


if __name__ == "__main__":
    abspath = os.path.abspath(__file__)
    dname = os.path.dirname(abspath)
    dotenv_path = os.path.join(dname, '.env')
    load_dotenv(dotenv_path)
    CLICKHOUSE_DB = os.environ.get("CLICKHOUSE_DB")
    CLICKHOUSE_USER = os.environ.get("CLICKHOUSE_USER")
    CLICKHOUSE_PASSWORD = os.environ.get("CLICKHOUSE_PASSWORD")
    CLICKHOUSE_HOST = os.environ.get("CLICKHOUSE_HOST")

    client = clickhouse_connect.get_client(host=CLICKHOUSE_HOST, database=CLICKHOUSE_DB, username=CLICKHOUSE_USER,
                                           password=CLICKHOUSE_PASSWORD)
    db.init_app(app)

    scheduler.init_app(app)
    scheduler.start()

    cors = CORS(app, resource={
        r"/*": {
            "origins": "*"
        }
    })

    with app.app_context():
        db.create_all()

    app.run(host='0.0.0.0', port=5000, debug=True, use_reloader=False)
