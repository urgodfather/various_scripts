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

[ $# -lt 3 ] && echo "Usage: $(basename $0) <DB_HOST> <DB_USER> <DB_NAME> [<DIR>] <t>" && exit 1

DB_host=$1
#DB_user=$2
DB=$2
DIR=$3
t=$4

[ -n "$DIR" ] || DIR=.
test -d $DIR || mkdir -p $DIR

tbl_count=0

mysqldump -h $DB_host $DB $t | gzip > $DIR/$DB.$t.`date +"\%Y-\%m-\%d"`.sql.gz
mysql -NBA -h $DB_host -D $DB -e 'truncate table '"$t;"'

tbl_count=$(( tbl_count + 1 ))

exit 1
