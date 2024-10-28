
###############################################################
################## Creating a Delta Table ###################
###############################################################

# Have the Azure page open on one tab

# Have the Databricks workspace open on another tab


------------------------------------------
Create a delta table by uploading a file
Create the table in workspace catalog
------------------------------------------

# Click on +New from the top left -> Add or upload data

# Show all the ways that you can ingest data

# Show that we can get to the same place by click on "Data Ingestion" on the left


# Select the first option (From local files -> Create or modify table)

# This will bring you to a page


# Drag the Employees.csv file to the page

# Show the drop-down options


############################
# Notes

# A workspace catalog, which, when originally provisioned, is named after your workspace.

# All users in your workspace can create assets in the default schema in this catalog. By default, this catalog is bound to your workspace, which means that it can only be accessed through your workspace. Automatic provisioning of the workspace catalog at workspace creation is rolling out gradually across accounts.

# Databricks strongly recommends using the Unity Catalog for data access management. The Unity Catalog offers a more straightforward and account-centered governance model. 

############################

Catalog: loony-db-ws
Schema: default
Table name: all_employees

# See the preview of the data

# Click on "Create Table"

# This uses the SQL warehouse to load data

# Note that we are now in the Catalog explorer

# Note the pane on the right "About this table"

# Note that this is a Delta table

# Hover over the columns of the table

# Show how you can add comments using AI (comments are pretty bad)


# Click on the various tabs and show

Sample Data
Details

# Here notice the storage location - cloud storage managed by the Unity Catalog
# Databricks manages this storage account - we do not have direct access to this

# Go to the Azure page - search for "Storage accounts"

# Here you will find a storage account similar to "dbstoragefnqz2uet3kikm"

# Click through

# Select "Containers" from the left

# Show that the "unity-catalog-storage" is a container here

# Go back to Databricks and show

Permissions
History
Lineage
Insights
Quality


------------------------------------------
Create a delta table by uploading a file
Create the table using the hive metastore
------------------------------------------

############################
# Notes

# Hive metastore table access control is a legacy data governance model within Databricks - when you set up your production level tables using this is not recommended

# Currently, there is no official announcement regarding the end of support for Hive metastore table access control.

# However, given its legacy status, keeping an eye on Databricks updates and announcements is essential.

# However we will be using this for learning purposes as this helps us understand how Delta tables use parquet files stored in cloud storage as the underlying storage mechanism

############################


# Click on +New from the top left -> Add or upload data

# This will take you to the same page

# Drag the Employees.csv file to the page


Catalog: hive metastore
Schema: default
Table name: employees

# Click on "Create table"

# Note that we can have the same table name under different schemas (however I have chosen different names so we can differentiate the tables)

# Create the table

# Click on the various tabs and show

Sample Data
Details

# Here notice the storage location - this is stored in DBFS associated with the current workspace. We can access and view the contents of this location

Permissions
History
Lineage
Insights
Quality


------------------------------------------
Import notebook to work with Delta tables using Spark
------------------------------------------

# Click on Workspace on the left

# Click on the 3 dots next to contact@loonycorn.com

Import

# Import "CreateTables.html"

# Connect to the "loony-cluster-regular"






























