var CronJob = require('cron').CronJob,
	exec = require("child_process").exec;
new CronJob('00 00 00 * * *', exec.bind(null, "/s3_backup.sh"), null, true, 'Japan');