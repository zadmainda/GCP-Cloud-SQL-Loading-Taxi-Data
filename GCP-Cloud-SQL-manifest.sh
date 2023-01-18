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