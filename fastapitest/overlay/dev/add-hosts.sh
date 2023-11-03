#!/bin/bash

correct_host_record="$(minikube ip) fastapi.dev.test"
existing_host_record=$(cat /etc/hosts | grep "fastapi")

# Clean up old record
sed -i '/fastapi.dev.test/d' /etc/hosts

sleep 1

# Add new record
echo "$(minikube ip) fastapi.dev.test" >> sudo tee -a /etc/hosts

# echo $correct_host_record
# echo $existing_host_record

# # Clean up old record
# if [ "$existing_host_record" = "$correct_host_record" ]
# then
#     sudo sed '/astapi.dev.test/d' /etc/host
# else
#     echo "notmatches"
# fi


# # Add if not exists
# if [ -z "$existing_host_record" ]
# then
#     echo " is empty"
# else
#     echo "already exists"
# fi

