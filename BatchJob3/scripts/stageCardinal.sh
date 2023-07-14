#!/bin/bash

# Database store connection details
db_host="localhost"
db_user="root"
db_password="amit"
db_store="batchjob3"


# CSV file path and name
csv_file="/BatchJob3/scripts/moveStageCordinal.csv"

# Database table name
store_table_name="product_store"


# Read the CSV file and insert data into the database table
mysql -h "$db_host" -u "$db_user" -P "$db_port" -p"$db_password" --local-infile=1 "$db_store" <<EOF
LOAD DATA LOCAL INFILE '$csv_file'
INTO TABLE $store_table_name
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
EOF

if [ $? -eq 0 ]; then
  echo "Data inserted into the database table successfully."
else
  echo "Error inserting data into the database table."
fi