import psycopg2

from telegram_sender import TelegramSender

host = "92.53.127.18"
port = "5432"
username = "postgres"
password = "hCImjO&&k6N$"

sqlItem = {
    'Alive': "select 1;",  # monitor survival
    'Uptime': "SELECT current_timestamp - pg_postmaster_start_time();",
    'Size': "SELECT pg_size_pretty(pg_database_size(datname)), datname AS size FROM pg_database;",
    'Cache hit ratio': "SELECT sum(heap_blks_hit) / (sum(heap_blks_hit) + sum(heap_blks_read)) as ratio FROM pg_statio_user_tables;",
    'Active_connections': "select count (*) from pg_stat_activity where state = 'active';",
    'Server_connections': "select count (*) from pg_stat_activity where backend_type = 'client backend'",
    'Idle_connections': "select count (*) from pg_stat_activity where state = 'idle'",
    'Idle_tx_connections': "select count (*) from pg_stat_activity where state = 'idle in transaction'",
    'Locks_waiting': "select count (*) from pg_stat_activity where backend_type = 'client backend' and wait_event_type like '% Lock%'",
    'Server_maxcon': "select setting :: int from pg_settings where name = 'max_connections'",
    'Tx_commited': "select sum (xact_commit) from pg_stat_database",
    'Tx_rollbacked': "select sum (xact_rollback) from pg_stat_database",
    'qps': "SELECT sum(xact_commit+xact_rollback) FROM pg_stat_database;",
    'scan_full_tables': "select sum(tup_returned) from pg_stat_database",
    'scan_index_rows': "select sum(tup_fetched) from pg_stat_database",
    'tup_inserted': "select sum(tup_inserted) from pg_stat_database",
    'tup_updated': "select sum(tup_updated) from pg_stat_database",
    'tup_deleted': "select sum(tup_deleted) from pg_stat_database",
    'Deadlocks': "select sum (deadlocks) from pg_stat_database",
    'Rep_write_delay': "select pg_size_pretty (pg_wal_lsn_diff (pg_current_wal_lsn (), write_lsn)) from pg_stat_replication",
    'Rep_flush_delay': "select pg_size_pretty (pg_wal_lsn_diff (pg_current_wal_lsn (), flush_lsn)) from pg_stat_replication",
    'Rep_replay_delay': "select pg_size_pretty (pg_wal_lsn_diff (pg_current_wal_lsn (), replay_lsn)) from pg_stat_replication",
    'Idle_transaction_5': "select count (*) from pg_stat_activity where state = 'idle in transaction' and now () - state_change> interval '5 second'",
    'Long_query_5': "select count (*) from pg_stat_activity where state = 'active' and now () - query_start> interval '5 second'",
    'Long_transaction_5': "select count (*) from pg_stat_activity where now () - xact_start> interval '5 second'",
    'long_lock_waiting_5': "select count(*) from pg_stat_activity where wait_event_type is not null and now()-state_change > interval '5 second'"
}


def get_item(item_key):
    connection = None
    result = None
    cursor = None
    try:
        sql_text = sqlItem[item_key]
        connection = psycopg2.connect(
            user=username,
            password=password,
            host=host,
            port=port
        )
        cursor = connection.cursor()
        cursor.execute(sql_text)
        rows = cursor.fetchall()
        if len(rows) >= 1:
            result = rows[0][0]
        else:
            result = None

    except Exception as e:
        print(e)
    finally:
        cursor.close()
        connection.close()
    return result


def get_stat_activity():
    connection = None
    cursor = None
    try:
        connection = psycopg2.connect(
            user=username,
            password=password,
            host=host,
            port=port
        )
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM pg_stat_activity")
        rows = cursor.fetchall()
        columns = [desc[0] for desc in cursor.description]
        return [dict(zip(columns, row)) for row in rows]
    except Exception as e:
        print(e)
    finally:
        cursor.close()
        connection.close()


if __name__ == '__main__':
    metrics = {}
    telegram_sender = TelegramSender()
    for key in sqlItem.keys():
        value = get_item(key)
        metrics[key] = value
    telegram_sender.send_dict_message("PostgreSql metrics", metrics, chat_id=-4035313120)
    stats = get_stat_activity()
    for stat in stats:
        telegram_sender.send_dict_message("Activity stats", stat, chat_id=-4035313120)
