#!/bin/bash

COMPONENT=$1

if [ -z "${COMPONENT}" ];  then
  echo "Component Input is Needed"
  exit 1
fi

LID=lt-0d3d6c2696389f95f
LVER=1



 INSTANCE_STATE=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=${COMPONENT}"  | jq .Reservations[].Instances[].State.Name | xargs -n1)
  if [ "${INSTANCE_STATE}" = "running" ]; then
    echo "${COMPONENT} Instance already exists!!"

    return 0
  fi

  if [ "${INSTANCE_STATE}" = "stopped" ]; then
    echo "${COMPONENT} Instance already exists!!"
    exit 0
  fi

  aws ec2 run-instances --launch-template LaunchTemplateId=${LID},Version=${LVER}  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${COMPONENT}}]" | jq
  sleep 10

