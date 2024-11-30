[Core Platform Site](https://github.com/DataJediToolBelt/)

# Background
This repository is specifically designed to help implement the DDL
for the platform. We have included support for a few specific databases based on those using
platform.
- SQLite: this is meant to provide someone a VERY quick ability to download the project and
see the value of what we are building out. This was brought on in November 2024 as we worked
on standardizing our code aroound Python primarily. It is built out with the same data relationships 
as Postgresql and SQL Server. We use this to test and also for the platforms configurations and 
settings as well. Within the [python code base](https://github.com/DataJediToolbelt/Code-DataJediToolkit) 
you will see a directory named platform_data_local. Within this directory there are two files datajedi-toolbelt.db 
(a small footprint of the database, it contains a starting point of all the reference, data model, platform 
data but not data tier data). If you want the complete platform with all data in SQLite just 
uncompress the complete-datajeditoolbelt.zip into this location . It is about 500 megs and 
will give you billions of possibilities.
- Postgres and SQL Server: RDBMS complete relational data models of the platform, the data loaders
can seed the data in order to ensure no primary-foreign key violations and all the code will reinforce
this model, whether the configured data platform you leverage needs it or not.
- Databricks-SPARK and Snowflake: Intentionally built as computational and EDW based.

## Pre-Requisites
Ensure you have all the tools needed to be installed and configured. 

1. RDBMS or data platform setup with security and connectivity installed and configured.
2. A clone or unzipped download of the DataTier-DDL repository.
3. If this is an enterprise or SaaS-provided database, you must ensure you have an account capable of creating
   databases and adding extensions. If you are not allowed those permissions, then admins will need to create the
   database and possibly run the ddl script within the database to create all the data objects.

## Data Tier Enhancements
As of November 2024 release we now include a specific file that chronicles releases.
Please look at this [file](DBEnhancements.md) for data tier enhancements.

# Running The Database Definition (DDL)
- Load up your favorite RDBMS management tool or command line, get the latest script for the database technology you are implementing, and run it.
- Go to the specific database and ensure that the script runs and all the tables and objects are created against the script.


Happy coding!!!
