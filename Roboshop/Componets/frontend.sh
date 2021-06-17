#!/bin/bash

echo installing Frontend
yum install nginx -y
systemctl start nginx