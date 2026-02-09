#!/bin/bash

COPIEDFILES=0

######

APPPATH=/opt/containers/parsedmarc-docker/data/parsedmarc
FILE=parsedmarc.ini

echo "Check if the file $FILE already exist.";
if [ ! -f $APPPATH/$FILE ]; then
    echo "File $FILE was created successfully.";
    echo
    /bin/cp $APPPATH/parsedmarc.ini.example $APPPATH/$FILE

    COPIEDFILES=$((COPIEDFILES + 1))
else
    echo "File $FILE already exist!";
    echo
fi

######

APPPATH=/opt/containers/parsedmarc-docker
FILE=docker-compose.yml

echo "Check if the file docker-compose.yml already exist.";
if [ ! -f $APPPATH/$FILE ]; then
    echo "File $FILE was created successfully.";
    /bin/cp $APPPATH/docker-compose.yml.example $APPPATH/$FILE

    COPIEDFILES=$((COPIEDFILES + 1))
else
    echo "File $FILE already exist.";
fi

echo
######

APPPATH=/opt/containers/parsedmarc-docker
FILE=.env

echo "Check if the file .env already exist.";
if [ ! -f $APPPATH/$FILE ]; then
    echo "File $FILE was created successfully.";
    /bin/cp $APPPATH/.env.example $APPPATH/$FILE

    COPIEDFILES=$((COPIEDFILES + 1))
else
    echo "File $FILE already exist.";
fi

echo
######

if [[ "$COPIEDFILES" -eq "3" ]]; then
    echo "Set random password for the user elastic.";
    password=$(/bin/tr -dc 'A-Za-z0-9!?%=' < /dev/urandom | /bin/head -c 20)
    /bin/sed -i 's/<your-elastic-password>/'$password'/g' /$APPPATH/$FILE

    echo "Set random password for the user kibana_system.";
    password=$(/bin/tr -dc 'A-Za-z0-9!?%=' < /dev/urandom | /bin/head -c 20)
    /bin/sed -i 's/<your-kibana-password>/'$password'/g' /$APPPATH/$FILE

    echo "Set random password for the user parsedmarc.";
    password=$(/bin/tr -dc 'A-Za-z0-9!?=' < /dev/urandom | /bin/head -c 20)
    /bin/sed -i 's/<your-parsedmarc-password>/'$password'/g' /$APPPATH/$FILE
    /bin/sed -i 's/<your-parsedmarc-password>/'$password'/g' /$APPPATH/data/parsedmarc/parsedmarc.ini
fi

######
echo "Create logrotate config file.";
cat << \EOF > /etc/logrotate.d/parsedmarc
/opt/containers/parsedmarc-docker/data/parsedmarc/logs/*.log {
    rotate 31
    daily
    compress
    missingok
    delaycompress
    dateext
    sharedscripts
    postrotate
      cd /opt/containers/parsedmarc-docker \
        && /usr/bin/docker compose restart parsedmarc
    endscript
}
EOF


echo
echo "The script has reached the end.";
