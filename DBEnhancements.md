[Core Site README](README.md)

# Background
This file is in place to track database changes needed
to ensure they are implemented across all supported platforms.
Detailed testing of the changes/enhancements within Postgresql 
and/or MS SQL Server.

# 2024-11

## Created 
The following tables were created for this month's release.

- platform_datasources
- platform_xmap_tokens_attributes_dtl
- datatier_crawler
- datatier_tokens

## Enhancements
The following tables have been enhanced for this month's release.

- datatier_datastructure to datatier_sdp_datastructures
- datatier_dataattributes to datatier_sdp_dataattributes

Renamed fields:
- any fields ending in id we made _id
- any fields ending in guid we made _guid
- industrystd to industry_std
- registeredapp to registered_app
- organizationguid to organization_guid
- statusid to status_id
- createddate to created_date

- In datatier_sdp_datastructures renamed 
- datastructurename to datastructure_name
- datastructure_name to datastructure_name
- and datastructuredetails to datastructure_details
