#!/bin/bash

#
# Setup up location
DEST="/home/hello/Desktop/test/"

#
# Should use key management and dynamic key like Vault
USERNAME='testuser' 
PASSWORD='Nono1234$$'
DBNAME='localhost'

#
# check if destination exist, if not create it
#
if [ ! -d "$DEST" ]; then
	echo "Creating backup directory"
	mkdir -p "$DEST"
	chmod 744 "$DEST"
	
fi

#
# Creating backup name with absolute path
#
BACKUPNAME=$(date +"DATE%Y%m%d-TIME%H%M%S")
BCKUPPATH="$DEST$BACKUPNAME.sql"

#
# check Database connection
#
 if [ ! -n 'mysql --host=$DBNAME --user=$USERNAME --password=$PASSWORD' ]
then

	#
	# Should change to email and alert Administrator, but okay for now.  
	# Since 
	echo "Cannot connect to database"
else

	#
	# Backup all databases in MySQL
	#
	mysqldump --all-databases --host=$DBNAME --user=$USERNAME --password=$PASSWORD > $BCKUPPATH

fi

# transfer file to Archive 
# Archieve, encrypt, 

# mysql -h localhost -u root -p