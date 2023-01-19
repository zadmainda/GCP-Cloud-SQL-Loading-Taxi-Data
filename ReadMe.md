## Loading Taxi Data into Google Cloud SQL

### Overview

This project focuses on loading data from a CSV file in a Google Cloud Storage bucket into a cloud SQL instance

#### Objectives

Create Cloud SQL instance

Create a Cloud SQL database

Import text data into Cloud SQL

Check the data for integrity


#### Steps
Create environment variables that will be used later for your project ID and the storage bucket that will contain your data:
    export PROJECT_ID=$(gcloud info --format='value(config.project)')
    export BUCKET=${PROJECT_ID}-ml

Create a Cloud SQL instance
    gcloud sql instances create taxi \
        --tier=db-n1-standard-1 --activation-policy=ALWAYS

Set a root password for the Cloud SQL instance:
    gcloud sql users set-password root --host % --instance taxi \
    --password Passw0rd

create an environment variable with the IP address of the Cloud Shell:
    export ADDRESS=$(wget -qO - http://ipecho.net/plain)/32

Whitelist the Cloud Shell instance for management access to your SQL instance:
    gcloud sql instances patch taxi --authorized-networks $ADDRESS



