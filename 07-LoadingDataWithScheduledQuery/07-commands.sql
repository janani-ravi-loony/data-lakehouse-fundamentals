###############################################################
############## Loading data with a Scheduled Query ############
###############################################################

## Have two tables

One open to Catalog

Another to SQL Editor



## Go to Catalog on the left

## Select <workspace_name> -> default 

## Click on "Create" on the top right and select "Create Volume"

Name: emp_data_volume
Type: Managed Volume

## Click on "Create"

# Show the volume

# Can upload to the volume right there by clicking on "Upload to this volume"

# First upload this file

employees-01.csv


### Head to the SQL Editor 

## Create two SQL Editors

CreateReadEmployeesDelta

and

LoadIntoEmployeesDelta


### Run this query to create the Delta table

# In CreateReadEmployeesDelta

CREATE TABLE Employees (
    id INT,
    empname STRING,
    phone STRING,
    email STRING,
    city STRING
);

SELECT * FROM Employees;

### Observe on the left that the Delta table has been created in the default DB


### Create a new query and call it LoadIntoEmployeesDelta

### Paste in these contents

COPY INTO Employees
FROM (
  SELECT id::int, empname, phone, email, city
  FROM '/Volumes/loony_db_ws_1117716205479151/default/emp_data_volume/'
)
FILEFORMAT = CSV
FORMAT_OPTIONS('header' = 'true');


# Save the query

## Set this LoadIntoEmployeesDelta query to run on a schedule

## Click on the "Schedule" button at the top right

## Run every minute


## Wait for the query to run. In a minute or so, head to "Query History"

## You'll see an entry for the COPY INTO query

## Head to the Query editor and to CreateReadEmployeesDelta

## Run the following

SELECT * FROM Employees;

## The 5 rows from employees-01.csv are present


## Check the history
DESCRIBE HISTORY Employees;

## Head to the Catalog and add employees-02.csv to the emp_data_volume folder
## Wait a minute and then check from the Query History section
## You'll see one more run of the COPY INTO query

## Head to the Query editor and to CreateReadEmployeesDelta to re-run
SELECT * FROM company.Employees;;

## The new rows are visible

## Go to the volume and add employees-03.csv as well
## After a minute, rerun the SELECT query - the new row should show up
SELECT * FROM company.Employees;;


# IMPORTANT: Make sure you go back to LoadIntoEmployeesDelta and DELETE the current schedule


Notes:
------

## COPY INTO is idempotent — files that have already been loaded are skipped
## Note that we cast the id as an int - this is required as by default
##		Databricks SQL will try to load it as a String

## From the docs:
# Use the COPY INTO SQL command instead of Auto Loader when:
#   - You want to load data from a file location that contains files in the order of thousands or fewer.
#   - Your data schema is not expected to evolve frequently.
#   - You plan to load subsets of previously uploaded files.


