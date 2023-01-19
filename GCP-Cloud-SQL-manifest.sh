#!/bin/bash

#list active acc name
gcloud auth list

#print out Project ID
gcloud config list project

#intialize environment variables 
export PROJECT_ID=$(gcloud info --format='value(config.project)')
export BUCKET=${PROJECT_ID}-ml

#Create Cloud SQL instance from CLI
gcloud sql instances create taxi \
    --tier=db-n1-standard-1 --activation-policy=ALWAYS

#set a password for the CLoud SQL instance root access
# gcloud sql users set-password root --host % --instance taxi \
#  --password Passw0rd
gcloud sql users set-password root --host % --instance taxi-2 \
 --password Passw0rd

#retrieve the cloud shell IP adress
export ADDRESS=$(wget -qO - http://ipecho.net/plain)/32

#Whitelist Cloud Instance 
gcloud sql instances patch taxi --authorized-networks $ADDRESS

#When prompted press Y to accept the change.

#Retrieve the Cloud SQL Instance IP adress 
MYSQLIP=$(gcloud sql instances describe \
taxi --format="value(ipAddresses.ipAddress)")

#Confirm contents of the MYSQLIP -- Should output IP adress
echo $MYSQLIP

#Log into the mysql instance using your password
mysql --host=$MYSQLIP --user=root \
      --password --verbose

#Run SQL file code after logging into mysL to create db and table

#Run GCP-Cloud-SQL-manidfest-2 after creating db and table