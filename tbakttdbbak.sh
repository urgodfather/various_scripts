#!/bin/bash

# tbakttdbbak.sh
# Descr: Dumps MySQL table data into separate SQL file for a specified database and table. After completed does full database backup.
# Usage: Run without args for usage info.
# Author: @Urgodfather
# Notes:
#  * Script will use the arguments as described below.
#  * Output files are compressed with table name and date, then saved in the current working dir, unless DIR is
#    specified on command-line.
#  * Script will truncate table after.
#  * Script will backup database after.

[ $# -lt 3 ] && echo "Usage: $(basename $0) <DB_NAME> [<DIR>] <t>" && exit 1

DB=$1
DIR=$2
t=$3

/bin/bash ./table_backup.sh $DB $DIR $t & $BACK_PID20=$1

wait $BACK_PID20

mysqldump  $DB $t | gzip > $DIR/$DB.`date +"\%Y-\%m-\%d"`.sql.gz & BACK_PID=$! 
