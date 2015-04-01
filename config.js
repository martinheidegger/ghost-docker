var path = require('path'),
    domain = process.env.GHOST_DOMAIN,
    production = {
        url: 'http://' + domain,
        server: {
            host: '0.0.0.0',
            port: '2368'
        }
    };


if (process.env.GHOST_USE_HTTPS) {
    production.urlSSL = 'https://' + domain;
}

if (process.env.GHOST_MAILGUN_USER) {
    production.mail = {
        transport: 'SMTP',
        options: {
            service: 'Mailgun',
            auth: {
                user: process.env.GHOST_MAILGUN_USER,
                pass: process.env.GHOST_MAILGUN_PASSWORD
            }
        }
    };
}

if (process.env.POSTGRES_PORT_5432_TCP_ADDR) {
    production.database = {
        client: 'pg',
        connection: {
            host     : process.env.POSTGRES_PORT_5432_TCP_ADDR,
            password : process.env.POSTGRES_ENV_POSTGRES_PASSWORD,
            user     : process.env.GHOST_USER || 'postgres',
            database : process.env.GHOST_DB,
            charset  : 'utf8'
        },
        debug: false
    };
}

module.exports = {
    production: production
};