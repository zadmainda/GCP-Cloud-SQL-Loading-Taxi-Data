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
gcloud sql users set-password root --host % --instance taxi \
 --password Passw0rd

#retrieve the cloud shell IP adress
export ADDRESS=$(wget -qO - http://ipecho.net/plain)/32

#Whitelist Cloud Instance 
gcloud sql instances patch taxi --authorized-networks $ADDRESS

