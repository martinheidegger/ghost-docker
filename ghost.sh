#!/bin/bash
echo "*:*:*:*:$POSTGRES_ENV_POSTGRES_PASSWORD" > ~/.pgpass

chmod 600 ~/.pgpass

pm2 start index.js --name "ghost"
cd /cron
pm2 start index.js --name "cron"

pm2 logs