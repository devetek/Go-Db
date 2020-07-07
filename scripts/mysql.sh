#!/bin/sh
# wait for mysql

set -e

HOST="$1"
shift
CMD="$@"

until mysql -h $HOST -u $DB_USER -p$DB_PASSWORD -e ";"; do
  >&2 echo "MySQL is unavailable - sleeping"
  sleep 1
done

>&2 echo "MySQL is up - executing command"

exec $CMD
