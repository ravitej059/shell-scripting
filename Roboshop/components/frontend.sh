#!/bin/bash

source components/common.sh

HEAD "Installing  Nginx"
yum install  ngnix -y &>>/tmp/roboshop.log
echo -e "\e[32m done\e[0m"
STAT $?

HEAD "Start Nginx\t"
systemctl start nginx &>>/tmp/roboshop.log
systemctl  enable nginx &>>/tmp/roboshop.log
STAT $?

HEAD  "Download from Github"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>/tmp/roboshop.log
STAT $?
