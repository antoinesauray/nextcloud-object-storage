#!/bin/bash
mkdir /var/www/html/data
chown -R www-data /var/www/html/data
/usr/src/nextcloud/occ maintenance:install --database "pgsql" --database-name=$POSTGRES_DB --database-host=$POSTGRES_HOST --database-user=$POSTGRES_USER --database-pass=$POSTGRES_PASSWORD --database-port=$POSTGRES_PORT --admin-user test --admin-pass=test --data-dir /var/www/html/data/
/usr/src/nextcloud/occ config:app:set --value "1 GB" files default_quota
/usr/src/nextcloud/occ user:add --password-from-env --display-name "$USER_DISPLAY_NAME" "$USER_NAME"
chown -R www-data /var/www/html/data
/entrypoint.sh $@
