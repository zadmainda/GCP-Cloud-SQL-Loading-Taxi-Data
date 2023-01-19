#!/bin/bash

#Copy CSV files 
gsutil cp gs://cloud-training/OCBL013/nyc_tlc_yellow_trips_2018_subset_1.csv trips.csv-1
gsutil cp gs://cloud-training/OCBL013/nyc_tlc_yellow_trips_2018_subset_2.csv trips.csv-2

#Connect to mysql console
mysql --host=$MYSQLIP --user=root  --password  --local-infile