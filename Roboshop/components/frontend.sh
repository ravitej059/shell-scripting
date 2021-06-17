#!/bin/bash

source components/common.sh

HEAD "Installing  Nginx"
yum install  ngnix -y &>>/tmp/Roboshop.log
echo -e "\e[32m done\e[0m"
STAT $?

HEAD "Start Nginx"
systemctl start nginx &>>/tmp/Roboshop.log
systemctl  enable nginx &>>.tmp/Roboshop.log
STAT $?