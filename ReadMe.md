## Loading Taxi Data into Google Cloud SQL

### Overview

This project focuses on loading data from a CSV file in a Google Cloud Storage bucket into a cloud SQL instance

Data Source: [NYC Taxi and Limousine Commission](https://www1.nyc.gov/site/tlc/about/tlc-trip-record-data.page). 

Dataset description: Includes trip records from all trips completed in Yellow and Green taxis in NYC from 2009 to present, and all trips in for-hire vehicles (FHV) from 2015 to present. Records include fields capturing pick-up and drop-off dates/times, pick-up and drop-off locations, trip distances, itemized fares, rate types, payment types, and driver-reported passenger counts.

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


Get the IP address of your Cloud SQL instance by running:

    >MYSQLIP=$(gcloud sql instances describe \
    >taxi --format="value(ipAddresses.ipAddress)")

Check the variable MYSQLIP:
    >echo $MYSQLIP



Create the taxi trips table by logging into the mysql command line interface:

    >mysql --host=$MYSQLIP --user=root \
        >--password --verbose

When prompted for a password enter Passw0rd.

Paste the Code in Section 1 of the SQL file into the command line to create the schema for the trips table:
