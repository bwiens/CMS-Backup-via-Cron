mysqldump-files-email
=====================

Simple bashscript that creates a backup of mysqldump and files, in this case wordpress. After compressing and
copying the mysqldump and files, the script sends a status email about success/failure.


The following has to be configured:

1) backup.sh the main script (included)
2) target folder for the backups (see 2)
3) cron job  (see 3)

1) For the mysqldump, --single-transaction will only guarantee data integrity with InnoDB tables.
To find out what tables are being used, connect to mysql and do "show create table tbl/G" to see what's
behind ENGINE=.

Set secure permissions for the script and the folder that you store your files and mysqlbackup in, 
as it contains your logins. Chmod 600 and chown root:root is recommended. 

2) Here's an example of what my configuration looks like:

[root@klnpa scripts]# pwd
/scripts
[root@klnpa scripts]# ls -la
total 20
drw-------  3 root root 4096 Oct  1 09:20 .
drwxr-xr-x 27 root root 4096 Sep 30 16:40 ..
-rwx--x--x  1 root root 1058 Oct  1 09:20 backup.sh
drw-------  2 root root 4096 Nov  1 00:00 klnpaorg_backups


3) crontab -e
0 0 1 * * /bin/bash /scripts/backup.sh


Here's a Crontab Code Generator if you're not familiar with cron.
http://www.openjs.com/scripts/jslibrary/demos/crontab.php

Sample output:

[root@klnpa klnpaorg_backups]# pwd
/scripts/klnpaorg_backups
[root@klnpa klnpaorg_backups]# ls -la
total 20680
drw------- 2 root root     4096 Nov  1 00:00 .
drw------- 3 root root     4096 Oct  1 09:20 ..
-rw-r--r-- 1 root root 20903374 Nov  1 00:00 wordpress.files.11-01-13-0000.tar.gz
-rw-r--r-- 1 root root   231315 Nov  1 00:00 wordpress.sql.11-01-13-0000.tar.gz


