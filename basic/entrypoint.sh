#!/usr/bin/env bash

# Initilize the metastore
airflow db init

# Run the scheduler in background silently
airflow scheduler &> /dev/null &

# Create admin user
airflow users create -u admin -p admin -r Admin -e admin@admin.com -f admin -l admin

# Run the web server in foreground (for docker logs)
exec airflow webserver
