#!/bin/bash

CLICKHOUSE_DB="${CLICKHOUSE_DB:-database}";
CLICKHOUSE_USER="${CLICKHOUSE_USER:-user}";
CLICKHOUSE_PASSWORD="${CLICKHOUSE_PASSWORD:-password}";

cat <<EOT > /etc/clickhouse-server/users.d/user.xml
<yandex>
  <!-- Docs: <https://clickhouse.tech/docs/en/operations/settings/settings_users/> -->
  <users>
    <${CLICKHOUSE_USER}>
      <profile>default</profile>
      <networks>
        <ip>::/0</ip>
      </networks>
      <password>${CLICKHOUSE_PASSWORD}</password>
      <quota>default</quota>
    </${CLICKHOUSE_USER}>
  </users>
</yandex>
EOT

clickhouse-client --query "CREATE DATABASE IF NOT EXISTS ${CLICKHOUSE_DB}";

echo -n '
CREATE TABLE IF NOT EXISTS metrics.metrics
(
  `timestamp` DateTime64(3),
	`name` String,
	`aggregation` Nullable(String),
  `value` Nullable(Decimal64(10)),
  `api_key` String
)
Engine = MergeTree
Partition by toYYYYMM(timestamp)
Order by (toStartOfHour(timestamp))
;' | clickhouse-client
