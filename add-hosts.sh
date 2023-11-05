#!/bin/bash

# sudo bash add-hosts.sh

dns_records=(
  "hello1.test"
  "hello2.test"
  "fastapi.dev.test"
  "argocd.test"
)

mk_ip="192.168.49.2"

for value in "${dns_records[@]}"
do
  myrecord="$mk_ip $value"

  echo "Removing $value"
  sed -i "/${value}/d" /etc/hosts

  echo "Adding $myrecord"
  echo "$myrecord" >> /etc/hosts
done


cat /etc/hosts
