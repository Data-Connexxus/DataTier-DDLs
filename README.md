[Core Platform Site](https://github.com/DataJediToolBelt/)

# Background
This repository is specifically designed to help implement the DDL
for the platform.

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
