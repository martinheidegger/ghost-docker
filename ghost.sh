#!/bin/bash
echo "*:*:*:*:$POSTGRES_ENV_POSTGRES_PASSWORD" > ~/.pgpass

chmod 600 ~/.pgpass

pm2 start . --name "ghost"
pm2 start /cron --name "cron"

pm2 logs