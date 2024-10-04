#!/bin/bash

# Variables
APPPATH=/opt/containers/parsedmarc-docker
FILE=.env


echo "Check if the file .env already exist.";
if [ ! -f $APPPATH/$FILE ]; then
    echo "File $FILE was created successfully.";
    /bin/cp $APPPATH/.env.example $APPPATH/$FILE
else
    echo "File $FILE already exist. Script is terminated!";
    exit 0
fi


echo "Set random password for the user elastic.";
password=$(/bin/tr -dc 'A-Za-z0-9!?%=' < /dev/urandom | /bin/head -c 20)
/bin/sed -i 's/<your-elastic-password>/'$password'/g' /$APPPATH/$FILE

echo "Set random password for the user kibana_system.";
password=$(/bin/tr -dc 'A-Za-z0-9!?%=' < /dev/urandom | /bin/head -c 20)
/bin/sed -i 's/<your-kibana-password>/'$password'/g' /$APPPATH/$FILE

echo "Set random password for the user parsedmarc.";
password=$(/bin/tr -dc 'A-Za-z0-9!?=' < /dev/urandom | /bin/head -c 20)
/bin/sed -i 's/<your-parsedmarc-password>/'$password'/g' /$APPPATH/$FILE
/bin/sed -i 's/<your-parsedmarc-password>/'$password'/g' /$APPPATH/parsedmarc/conf/parsedmarc.ini

echo
echo "The script has reached the end.";
