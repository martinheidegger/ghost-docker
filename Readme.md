# Postgres-connected auto-s3-backing-up docker setup of Ghost

This docker image is connectable to a [Postgres](https://registry.hub.docker.com/_/postgres/) database and can automatically backup itself to [S3](http://aws.amazon.com/s3/). 

It is based on the [official GHOST Docker image](https://registry.hub.docker.com/_/ghost/) and adds configuration for linked postgres db.

## GHOST_DOMAIN

Domain for the Ghost setup

## GHOST_USE_HTTPS

Set this to anything to enable `https` urls.

## GHOST_MAILGUN_USER

[Mailgun](http://www.mailgun.com/) user like `postmaster@mg.<yourdomain>`

## GHOST_MAILGUN_PASSWORD

Password for the mailgun user.

## GHOST_DB

Database that this 