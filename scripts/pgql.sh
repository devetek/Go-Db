#!/bin/sh
# wait for pgql

set -e

HOST="$1"
shift
CMD="$@"

until PGPASSWORD=$DB_PASSWORD psql -h "$HOST" -U "$DB_USER" -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command"

exec $CMD
