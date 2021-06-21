#!/bin/bash

COMPONENT=$1

if [ -z "${COMPONENT}" ];  then
  echo "Component Input is Needed"
  exit 1
fi

LID=lt-08c82b1b813a01076
LVer=1

aws ec2 run-instances     --launch-template LaunchTemplateId=${LTD},Version=${LVR} --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${COMPONENT}}]"