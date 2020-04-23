#!/bin/bash
pwd
echo "#####################"
ls -al
echo "#####################"
cd /app
wget https://github.com/traccar/traccar/releases/download/v4.8/traccar-other-4.8.zip
unzip -d /app traccar-other-4.8.zip
rm traccar-other-4.8.zip

CON="<?xml version='1.0' encoding='utf-8'?><!DOCTYPE properties SYSTEM 'http://java.sun.com/dtd/properties.dtd'><properties><entry key='config.default'>./conf/default.xml</entry><entry key='web.port'>$PORT</entry><entry key='database.driver'>org.postgresql.Driver</entry><entry key='database.url'>$JDBC_DATABASE_URL</entry><entry key='database.user'>$JDBC_DATABASE_USERNAME</entry><entry key='database.password'>$JDBC_DATABASE_PASSWORD</entry><entry key='database.maxPoolSize'>10</entry></properties>"
CON_ESCAPED=${CON//&/&amp;}
echo $CON_ESCAPED > ./conf/traccar.xml

java -jar tracker-server.jar ./conf/traccar.xml
