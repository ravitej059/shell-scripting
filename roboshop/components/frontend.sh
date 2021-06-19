#!/bin/bash

source components/common.sh

HEAD "Installing  Nginx\t"
yum install  ngnix -y &>>/tmp/roboshop.log
echo -e "\e[1;32m done\e[0m"
STAT $?

HEAD "Start Nginx\t\t"
systemctl start nginx &>>/tmp/roboshop.log
systemctl  enable nginx &>>/tmp/roboshop.log
STAT $?

HEAD  "Download from Github\t"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>/tmp/roboshop.log
STAT $?

HEAD "Delete old HTML Docs\t"
rm -rf /usr/share/ngix/html/*
STAT $?

HEAD "Extract Downloaded Content"
unzip -d /usr/share/nginx/html /tmp/frontend.zip-o &>>/tmp/roboshop.log
mv /usr/share/nginx/html/frontend-main/* /usr/share/nginx/html/. &>>/tmp/roboshop.log
mv /usr/share/nginx/html/static/* /usr/share/nginx/html/. &>>/tmp/roboshop.log
STAT $?
