#!/bin/bash

Source  common.sh

HEAD "Installing Nginx"
yum install ngnix -y &>>/tmp/roboshop.log
echo-e"\e[32mdone\e[0m"