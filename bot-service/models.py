from dataclasses import dataclass

from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


@dataclass
class UrlConnection(db.Model):
    id: int = db.Column(db.Integer, primary_key=True)
    name: str = db.Column(db.String(80), nullable=False)
    tg_user_id: str = db.Column(db.String(80), nullable=False)
    url: str = db.Column(db.String(120), nullable=False)
    api_key: str = db.Column(db.String(120), unique=True, nullable=True)
    is_active: bool = db.Column(db.Boolean, nullable=True)
