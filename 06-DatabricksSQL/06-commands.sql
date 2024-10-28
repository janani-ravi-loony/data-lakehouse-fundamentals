###############################################################
############### Working from Databricks SQL ###################
###############################################################

## Create and upload data to a Volume in the Unity Catalog

###############################################################

-- Volumes are Unity Catalog objects that represent a logical volume of storage in a cloud object storage location. Volumes provide capabilities for accessing, storing, governing, and organizing files. While tables provide governance over tabular datasets, volumes add governance over non-tabular datasets. You can use volumes to store and access files in any format, including structured, semi-structured, and unstructured data.

-- A managed volume is a Unity Catalog-governed storage volume created within the default storage location of the containing schema. Managed volumes allow the creation of governed storage for working with files without the overhead of external locations and storage credentials. You do not need to specify a location when creating a managed volume, and all file access for data in managed volumes is through paths managed by Unity Catalog.

###############################################################

## Go to Catalog on the left

## Select <workspace_name> -> default 

## Click on "Create" on the top right and select "Create Volume"

Name: wine_data_volume
Type: Managed Volume

## Click on "Create"

# Show the volume

# Can upload to the volume right there by clicking on "Upload to this volume"

# Show this

# Can also upload by going to "Data Ingestion" on the left -> "Upload files to volume"

# Select the wine_data_volume and upload

winemag_data.csv

## Navigate to the SQL workspace on the new tab

## In order to run queries we need our loony-sql-warehouse


-- A SQL warehouse is a computation resource that lets you run SQL commands on data objects within Databricks SQL. 

### From the menu on the left, navigate to SQL Warehouses
### Choose to create a new endpoint
### Use the following config:
##		- Name: loony-sql-warehouse
##		- Cluster size: 2x small

# While the endpoint is being created show the tabs

## Channels let you choose whether to use the Current SQL warehouse compute version or the Preview version. A preview version let you try out functionality before it becomes the Databricks SQL standard. Take advantage of the preview channel to test your queries and dashboards against upcoming changes.

# Click on the other links in the left navigation pane

SQL Editor, Queries, Dashboard, Query History etc

----------------------------

## Create a new database - rather than the default one we've been working with
CREATE DATABASE IF NOT EXISTS wine;

## Show database on the left pane (under the workspace metastore)


CREATE TABLE wine.allwinereviews (
    id INT,
    country STRING,
    designation STRING,
    points INT,
    price INT,
    province STRING,
    region STRING,
    title STRING,
    variety STRING,
    winery STRING
 );

COPY INTO wine.allwinereviews
FROM (
  SELECT id::int, country, designation, points::int, price::int,
         province, region, title, variety, winery 
  FROM '/Volumes/loony_databricks_ws/default/wine_data_volume/winemag_data.csv'
)
FILEFORMAT = CSV
FORMAT_OPTIONS('header' = 'true');


# On the left select the volume and show how we can get the path to any volume to access it



## On the left navigation pane switch the database to wine and show the table
## in there


SELECT country, province, region,
       points, price
FROM wine.allwinereviews
WHERE points IS NOT NULL
AND price IS NOT NULL
AND country IS NOT NULL
AND province IS NOT NULL
AND region IS NOT NULL;

## Remove the limit (1000) abd ryb


## Save query as (Cmd + S)
Wine Geography

## Note that each query can have multiple associated visualizations
## Though not explicitly stated in the docs, its almost as though 
##     visualizations are children of queries in Databricks SQL


# Click on + ---> Visualization
# Choose Bar chart
# X-axis: Country
# Y-axis: Median (Price) and Median (Points)

# Explore the other tab and click around and configure the chart, change colors 
# etc.

## Set a name for the visual
Median Price and Points by Country



# Click on Add Visualization
# Choose pie chart
# X-axis: Country
# Y-axis: Country

# This will give you a donut chart with count(*) as a percent


## Set a name for the visual
Share of Wines by Country


# Click on Add Visualization
# Choose word cloud

# Choose Region and show the result
# Choose Province and show the result

# Click on save

## A visualization can be renamed once it is created by editing the 
## visualization tab in the query pane
Province Word Cloud


#############################################

## Go to Dashboards using the left navigation pane

# Create a new dashboard

Wine Dashboard

# Go back to the Query Editor and click on the 3 dots next to one of the visualizations

# Add to dashboard -> Existing dashboard

# Select all visualizations -> Add them to the Wine Dashboard

# If there is time, add a filter and show (filter by Country)



