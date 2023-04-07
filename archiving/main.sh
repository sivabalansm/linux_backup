#! /bin/bash

name=$(hostname)
date_time=$(date '+%F_%T')
file_name="backup_${name}_${date_time}.tar.gz"
default_path=$HOME/Documents/backups/system_backup
mkdir -p $default_path
backup() {
	printf "Backing up $name on $(date '+%F') at $(date '+%T')\n"
	sleep 10
	tar --xattrs --acls --exclude='/dev/*' --exclude='/proc/*' --exclude='/tmp/*' --exclude='/run/*' --exclude='/mnt/*' --exclude='/lost+found' --exclude='/sys/*' --exclude=$1/* -c -p -z -v -f $1/$file_name /
}
if [ -n "$1" -a -d $1 ];then
	printf "Backup path: $1\n"
	sleep 10s
	backup $1
elif [ -d $default_path ];then
	printf "Default path found: $default_path\n"
	sleep 10s
	backup $default_path
else
	printf "Backup path not found or not specified...\nCreate folder or 'y' for creating $default_path: "
	read answer
	if [ "$answer" = "y" ];then
		mkdir -p $default_path && sleep 10s;backup $default_path
	elif [ -n "$answer" ];then
		mkdir -p $answer && sleep 10s;backup $answer 
	else
		printf "\nAbort"
		exit 1
	fi
fi


