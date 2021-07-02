#!/bin/bash

source components/common.sh
rm -f /tmp/roboshop.log

HEAD "Install Nodejs"
yum install nodejs make gcc-c++ -y &>>/tmp/roboshop.log
STAT $?

HEAD "Add Roboshop App User"
id roboshop &>>/tmp/roboshop.log
if [ $? -eq 0 ]; then
echo user is already is there, So Skipping the user creation &>>/tmp/roboshop.log
STAT $?
else

useradd roboshop &>>/tmp/roboshop.log
 STAT $?
 fi
 HEAD " Download  App From Github"
 curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip"
STAT $?

HEAD "Extract  the Downloaded Archive"
cd /home/roboshop && rm-rf catalogue && unzip /tmp/catalogue.zip &>>/tmp/roboshop.log &&mv catalogue-main catalogue
STAT $?

HEAD "Install Nodejs Dependencies"
 unzip /tmp/catalogue.zip && npm install --unsafe-perm &>>/tmp/roboshop.log
 STAT $?

HEAD "Fix Permission to the App Contenet"
Chown roboshop:roboshop /home/roboshop  -R
STAT $?

