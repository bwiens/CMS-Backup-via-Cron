mysqldump-files-email
=====================

Simple bash script that creates a backup of mysqldump and files;
script will notify via email about success/failure of the backup.


For mysqldump, --single-transaction will only guarantee data integrity with InnoDB tables.
To find out what tables are being used, do show create table tbl/G to see what's behind ENGINE=.

Set secure permissions for the script and the folder that you store your files and mysqlbackup in, 
as it contains your logins. Chmod 600 and chown root:root is recommended. 
