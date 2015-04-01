#!/bin/bash

TMP=/backup_tmp
TMP_DB_BACKUP=$TMP/db.tar.gz
TMP_CONTENT_BACKUP=$TMP/content.tar.gz
TMP_LATEST_BACKUP=$TMP/backup_latest.tar.gz
TMP_TIME_BACKUP=$TMP/$(date +"backup_stories_%Y-%m-%d_%H-%M-%S.tar.gz")

rm -rf $TMP
mkdir -p $TMP
pg_dump -h $POSTGRES_PORT_5432_TCP_ADDR -U postgres | gzip > $TMP_DB_BACKUP
tar cvzf $TMP_CONTENT_BACKUP $GHOST_CONTENT
tar cvzf $TMP_LATEST_BACKUP $TMP_CONTENT_BACKUP $TMP_DB_BACKUP
rm $TMP_DB_BACKUP
rm $TMP_CONTENT_BACKUP

cp $TMP_LATEST_BACKUP $TMP_TIME_BACKUP

s3cmd put $TMP_LATEST_BACKUP $TMP_TIME_BACKUP s3://$S3_BUCKET --access_key=$S3_ACCESS_KEY --secret_key=$S3_SECRECT_KEY