#!/bin/bash

# table-backup.sh
# Descr: Dump MySQL table data into separate SQL file for a specified database and table.
# Usage: Run without args for usage info.
# Author: @Urgodfather
# Notes:
#  * Script will use the arguments as described below.
#  * Output files are compressed with table name and date, then saved in the current working dir, unless DIR is
#    specified on command-line.
#  * Script will truncate table after.

[ $# -lt 3 ] && echo "Usage: $(basename $0) <DB_NAME> [<DIR>] <t>" && exit 1

#DB_host=$1
#DB_user=$2
DB=$1
DIR=$2
t=$3

[ -n "$DIR" ] || DIR=.
test -d $DIR || mkdir -p $DIR

tbl_count=0

mysqldump  $DB $t | gzip > $DIR/$DB.$t.`date +"\%Y-\%m-\%d"`.sql.gz & BACK_PID=$!
wait $BACK_PID
mysql -NBA -D $DB -e 'truncate table '"$t;"''

tbl_count=$(( tbl_count + 1 ))

exit 1
