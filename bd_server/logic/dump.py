import os
import time
import pexpect

from logic.bd_utils import execute_command


def get_last_dumps():
    dumps = get_dumps()
    dumps.sort(key=get_datetime,reverse=True)
    return dumps[0] if dumps else None


def get_datetime(item):
    return item["datetime"]


def get_dumps():
    # заменить на .env
    path = './backups'
    result = []
    for filename in os.listdir(path):
        file_path = os.path.join(path, filename)
        file_stat = os.stat(file_path)
        file_size = file_stat.st_size
        file_datetime = int(file_stat.st_ctime)
        file_info = {"name": filename, "datetime": file_datetime, "size": file_size}
        result.append(file_info)
    return result


def dump_schema(path="test.sql"):
    _dump_schema(
        os.environ['PGHOSTNAME'],
        os.environ['PGDATABASE'],
        os.environ['PGUSERNAME'],
        os.environ['PGPASSWORD'],
        path
    )


def restore_schema(path="test.sql"):
    _restore_schema(
        os.environ['PGHOSTNAME'],
        os.environ['PGDATABASE'],
        os.environ['PGUSERNAME'],
        os.environ['PGPASSWORD'],
        path
    )


def _dump_schema(host, dbname, user, password, path, **kwargs):
    # subprocess.call(['sh', './test.sh'])
    bd_docker_name = os.environ['DBDOCKERDBNAME']
    bd_docker_compose = os.environ['DBDOCKERLOCATION']
    print('Создание бекапа')
    os.makedirs('./backups', exist_ok=True)
    execute_command(f'docker compose -f {bd_docker_compose} exec {bd_docker_name} mkdir -p backups')

    command = f'docker compose -f {bd_docker_compose} ' \
              f'exec {bd_docker_name} ' \
              f'pg_dump -U {user} ' \
              f'-h {host} --clean ' \
              f' -Ft {dbname} ' \
              f' -f backups/{path}'
    print(command, "\n")
    child = pexpect.spawn(command)
    time.sleep(1)
    password += "\n"
    child.sendline(password)
    child.wait()

    command = f'docker compose -f {bd_docker_compose} cp {bd_docker_name}:/backups/{path} ./backups'
    print(command)
    execute_command(command)
    # execute_command(f'docker compose -f {bd_docker_compose} exec {bd_docker_name}  backups/{path}')
    print('Бекап создан', f'backups/{path}')


def _restore_schema(host, dbname, user, password, path, **kwargs):
    bd_docker_name = os.environ['DBDOCKERDBNAME']
    bd_docker_compose = os.environ['DBDOCKERLOCATION']
    print(f'Восстановление бекапа {path}')
    command = f'docker compose -f {bd_docker_compose} cp ./backups/{path} {bd_docker_name}:/backups'
    execute_command(command)

    command = f'docker compose -f {bd_docker_compose} ' \
              f'exec {bd_docker_name} ' \
              f'pg_restore -U {user} ' \
              f'-h {host} ' \
              f'-d {dbname} --clean ' \
              f' backups/{path}'
    print(command, "\n")
    child = pexpect.spawn(command)
    time.sleep(1)
    password += "\n"
    child.sendline(password)
    child.wait()
    print(f'Бекап {path} восстановлен')
