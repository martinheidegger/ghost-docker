#!/bin/bash
TMP=/restore_tmp
LATEST=backup.tar.gz

rm -rf $TMP
mkdir -p $TMP

s3cmd get s3://$S3_BUCKET/$LATEST $TMP/$LATEST --access_key=$S3_ACCESS_KEY --secret_key=$S3_SECRECT_KEY

cd $TMP
tar -zxvf $LATEST
tar -C / -zxvf backup_tmp/content.tar.gz
gzip -d backup_tmp/db.tar.gz -c | psql -h $POSTGRES_PORT_5432_TCP_ADDR -U postgres