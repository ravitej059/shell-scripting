#!/bin/bash

source components/common.sh

HEAD "Installing  Nginx"
yum install  ngnix -y &>>/tmp/roboshop.log
echo -e "\e[32m done\e[0m"
STAT $?

HEAD "Start Nginx"
systemctl start nginx &>>/tmp/roboshop.log
systemctl start enable nginx &>>.tmp/roboshop.log
STAT $?