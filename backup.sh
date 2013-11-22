
#!/bin/bash

TIMESTAMP=`date +%m-%d-%y-%H%M`
HOST="localhost"
DBNAME="wordpress_db"
USER="wordpress_user"
PASSWORD="wordpress_password"
#Variables for mysqldump



/usr/bin/mysqldump --all-databases --single-transaction --triggers --routines --host="$HOST" --user="$USER" --password="$PASSWORD" > "$DBNAME".sql
#--Singe-transaction can only guarantee data integrity with InnoDB tables -- do show create table tbl/G to see the ENGINE=

if

        [ "$?" -eq 0 ];

                then

                        echo "Backup of `hostname` mysqldump and files was completed at "$TIMESTAMP"." | mail -s 'klnpa.org backup completed' email1@email.edu optional2ndemail@email.edu
                        #Successful Status Email

                        tar czpf /scripts/klnpaorg_backups/"$DBNAME".sql."$TIMESTAMP".tar.gz "$DBNAME".sql

                        rm -rf "$DBNAME".sql

                        tar czf /scripts/klnpaorg_backups/"$DBNAME".files."$TIMESTAMP".tar.gz /var/www/html/klnpa

                else

                        echo "Backup of `hostname` mysqldump and files failed at "$TIMESTAMP"."  | mail -s 'klnpa.org backup failed' email1@email.edu optional2ndemail@email.edu
                        #Failed Status Email

fi
