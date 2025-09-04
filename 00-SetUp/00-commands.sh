
###############################################################
################## Setting up the Workspace ###################
###############################################################

Do all of this as a part of prework
-----------------------------------


# Workspace
# ---------

## Provision a Databricks workspace in the "East US" region

loony-databricks-rg
loony-db-ws

## TODO: Need to figure this out

## This region has the Standard_D4ads_v5 Family vCPUs which we will use for
## Delta cache acceleration


# Clusters
# ---------

## In the databricks workspace, head to Compute
## Create a new cluster called loony-cluster-regular
## The name is to set it apart from a "Delta Cache Accelerated" cluster to be set up later
## The cluster has the following config
####	- mode => Single Node
####	- Node Type => Standard_D3_v2 node (14GB mem and 4 cores - we only have quota for this).
####    - IMPORTANT: Use personal compute

## Create a second cluster called loony-cluster-delta-acc
## The cluster has the following config
####	- mode => Single Node
####	- Node Type => Standard_D4ads_v5 (16G mem, 4 cores) (Delta Cache Accelerated)


# AWS source for streaming
# ------------------------

## Keep the AWS page open and have the bucket and the contents of the bucket set up
## Have the user set up as well loony_user


# Browser tabs
# ------------

## Keep two browser tabs open to Databricks
## One for the notebook and another to work with data



Actual demo
-----------

Follow the below steps to create a workspace:

# https://portal.azure.com/

# Make sure you are in home page else from the left nevigation menu click on home

# Click on " + Create a resources" -> Type "Azure Databricks" and 

# Select the azure databricks from the list ad click on "create"

# Subscription : pay-As-You-Go
# Resource Group : Click on : "Create new" -> Enter the resurce group name as "loony-databricks-rg" -> Ok
# Workspace name : "loony-db-ws" 
# Region : East US
# Pricing Tier : "Standard(Apache Spark, Secure with Azure AD)"/ Trial(premium- 14 days free DBUs) --> Show options here
# Click on "Next:Networking" -> Click on "No"
# Click on "Next : Advanced" -> Click on "Next:Tags"

#  Show "Review + create" -> Show "Create" 


# DO NOT ACTUALLY CREATE THE RESOURCE 

# Go to the Dashboard

# Click on the loony-databricks-rg

# Click on the loony-db-ws

# Click on "Launch Workspace"


------------------------------------------

Follw the below steps to create a cluster:

# Show the page do the minimal exploration that I have specified below

# The different environments are all available in sections on the left

# Click on each section on the left-hand-side and explain what they are for


# Click on "Compute" from the left side bar menu -> click on "create cluster" from the clusters page
# Cluster name : "loony_cluster"
# Cluster Mode : "Single Node"

# (Can switch to multi-node and show the options)
# Worker type
# Min workers, max workers
# Enable autoscaling

# Databricks Runtime Version : Choose the default LTS (long-term-support) version 



# DO NOT ACTUALLY CREATE THE RESOURCE 


------------------------------------------

Follow the below steps to create a SQL warehouse:

# We'll use the warehouse to load data into delta tables (later on the course we will use the warehouse to run SQL queries on data)

# Click on SQL Warehouses on the left -> Create SQL Warehouse

loony-sql-warehouse

2x-Small

Serverless

# Click on create


























