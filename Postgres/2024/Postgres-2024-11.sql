-- Create Sequences First
-- All have been moved to varchar, chars, or guids to simplify cross platform data technologies

-- Create Tables
--- -------------------
-- Reference Tables
drop table if exists refdata_applications cascade;
CREATE TABLE refdata_applications
(
    app_guid               char(38)    DEFAULT gen_random_uuid() NOT NULL,
    application_customcode varchar(15) DEFAULT 'NULL'::character varying,
    application_desc       varchar(50) DEFAULT 'NULL'::character varying,
    created_user           varchar(20) DEFAULT 'NULL'::character varying,
    created_date           timestamp   DEFAULT CURRENT_TIMESTAMP,
    status_id varchar(10) DEFAULT 'Active',
    vendor_id              char(38),
    industry_oid           varchar(49),
    organization_guid       varchar(49),
    PRIMARY KEY (app_guid)
);

drop table if exists refdata_codesets cascade;
CREATE TABLE refdata_codesets
(
    codesets_id        char(38)     DEFAULT gen_random_uuid() NOT NULL,
    codeset_name       varchar(50)  DEFAULT 'NULL'::character varying,
    industry_std       varchar(6)   DEFAULT 'NULL'::character varying,
    status_id varchar(10) DEFAULT 'Active',
    created_date       timestamp    DEFAULT CURRENT_TIMESTAMP,
    created_user       varchar(20)  DEFAULT 'NULL'::character varying,
    codeset_guid       char(38)     DEFAULT 'NULL'::bpchar,
    field_mapping      varchar(40)  DEFAULT 'NULL'::character varying,
    sensitivityflag_id varchar(5) DEFAULT 'UNDF',
    externaltable_id   varchar(20)  DEFAULT 'NULL'::character varying,
    external_notes     varchar(149) DEFAULT 'NULL'::character varying,
    external_link      varchar(99)  DEFAULT 'NULL'::character varying,
    PRIMARY KEY (codesets_id)
);

drop table if exists refdata_dataattributes cascade;
CREATE TABLE refdata_dataattributes
(
    dataattribute_id  char(38)     DEFAULT gen_random_uuid() NOT NULL,
    dataattribute_name         varchar(50) DEFAULT 'NULL'::character varying,
    sensitivityflag_id         varchar(5) DEFAULT 'UNDF',
    created_date               timestamp   DEFAULT CURRENT_TIMESTAMP,
    status_id varchar(10) DEFAULT 'Active',
    created_user               varchar(20) DEFAULT 'NULL'::character varying,
    platform_dataattribute_guid char(38)    DEFAULT 'NULL'::bpchar,
    registeredapp_guid             char(38)    DEFAULT 'NULL'::character varying,
    attribute_type              varchar(10) DEFAULT 'NULL'::character varying,
    PRIMARY KEY (dataattribute_id)
);

drop table if exists platform_datastructures cascade;
drop table if exists refdata_datastructures cascade;
create table refdata_datastructures
(
    datastructure_id   CHAR(38)   DEFAULT gen_random_uuid() NOT NULL,
    datastructure_name          varchar(50) default 'NULL'::character varying,
    sensitivityflag_id          varchar(5) DEFAULT 'UNDF',
    created_date                timestamp   default CURRENT_TIMESTAMP,
    status_id varchar(10) DEFAULT 'Active',
    created_user                varchar(20) default 'NULL'::character varying,
    platform_datastructures_guid char(38)    default gen_random_uuid()::bpchar,
    registeredapp_guid              char(38)    DEFAULT 'NULL'::character varying,
    PRIMARY KEY (datastructure_id)
);

drop table if exists refdata_devicetypes cascade;
CREATE TABLE refdata_devicetypes
(
    devicetype_id CHAR(38)   DEFAULT gen_random_uuid() NOT NULL,
    devicetype    varchar(30),
    created_date  timestamp DEFAULT CURRENT_TIMESTAMP,
    status_id varchar(10) DEFAULT 'Active',
    PRIMARY KEY (devicetype_id)
);

drop table if exists refdata_industrystds_eventtypes cascade;
CREATE TABLE refdata_industrystds_eventtypes
(
    eventtype_id    varchar(10) NOT NULL,
    eventtype_desc varchar(30) default 'NULL'::character varying,
    industry_std    varchar(6),
    created_date    timestamp   default CURRENT_TIMESTAMP,
    status_id varchar(10) DEFAULT 'Active',
    PRIMARY KEY (eventtype_id)
);

drop table if exists refdata_industries cascade;
CREATE TABLE refdata_industries
(
    industry_id   char(38)   DEFAULT gen_random_uuid() NOT NULL,
    industry_name varchar(45),
    created_date  timestamp DEFAULT CURRENT_TIMESTAMP,
    status_id varchar(10) DEFAULT 'Active',
    PRIMARY KEY (industry_id)
);

drop table if exists refdata_industries_business cascade;
CREATE TABLE refdata_industries_business
(
    industrytobusiness_id CHAR(38)   DEFAULT gen_random_uuid() NOT NULL,
    industry_id           char(38),
    business_area         varchar(50),
    created_date          timestamp DEFAULT CURRENT_TIMESTAMP,
    status_id varchar(10) DEFAULT 'Active',
    PRIMARY KEY (industrytobusiness_id)
);

drop table if exists refdata_industrystds cascade;
CREATE TABLE refdata_industrystds
(
    industry_std     varchar(6) NOT NULL,
    industrystd_desc varchar(30) DEFAULT 'NULL'::character varying,
    created_date     timestamp   DEFAULT CURRENT_TIMESTAMP,
    status_id varchar(10) DEFAULT 'Active',
    PRIMARY KEY (industry_std)
);

drop table if exists refdata_legalentities cascade;
CREATE TABLE refdata_legalentities
(
    legalentity_guid char(38)  DEFAULT gen_random_uuid()   NOT NULL,
    location_name    varchar(50) DEFAULT 'NULL'::character varying,
    address          varchar(75) DEFAULT 'NULL'::character varying,
    city             varchar(60) DEFAULT 'NULL'::character varying,
    state_id         varchar(2)  DEFAULT 'NULL'::character varying,
    zipcode          varchar(12) DEFAULT 'NULL'::character varying,
    created_user     varchar(20) DEFAULT 'NULL'::character varying,
    status_id varchar(10) DEFAULT 'Active',
    created_date     timestamp   DEFAULT CURRENT_TIMESTAMP NOT NULL,
    location_url     varchar(99) DEFAULT 'NULL'::character varying,
    location_phone   varchar(12) DEFAULT 'NULL'::character varying,
    PRIMARY KEY (legalentity_guid)
);

drop table if exists refdata_operationtypes cascade;
CREATE TABLE refdata_operationtypes
(
    operationtype_id   varchar(7) NOT NULL,
    operationtype_name varchar(60) DEFAULT 'NULL'::character varying,
    created_date       timestamp   DEFAULT CURRENT_TIMESTAMP,
    status_id varchar(10) DEFAULT 'Active',
    PRIMARY KEY (operationtype_id)
);

drop table if exists refdata_organizations cascade;
CREATE TABLE refdata_organizations
(
    organization_guid          char(38) DEFAULT gen_random_uuid() NOT NULL,
    organization_internal_code varchar(10) DEFAULT 'NULL'::character varying,
    organization_internal_id   varchar(10) DEFAULT 'NULL'::character varying,
    organization_name          varchar(50) DEFAULT 'NULL'::character varying,
    address                    varchar(75) DEFAULT 'NULL'::character varying,
    city                       varchar(60) DEFAULT 'NULL'::character varying,
    state_id                   varchar(2)  DEFAULT 'NULL'::character varying,
    zipcode                    varchar(12) DEFAULT 'NULL'::character varying,
    created_user               varchar(20) DEFAULT 'NULL'::character varying,
    status_id                       varchar(10) DEFAULT 'Active',
    created_date               timestamp   DEFAULT CURRENT_TIMESTAMP NOT NULL,
    legalentity_guid           char(38) DEFAULT 'NULL'::character varying,
    PRIMARY KEY (organization_guid)
);

drop table if exists refdata_professiontypes cascade;
CREATE TABLE refdata_professiontypes
(
    professiontype_id   char(38)    DEFAULT gen_random_uuid() NOT NULL,
    professiontype_name varchar(65) DEFAULT 'NULL'::character varying,
    created_user        varchar(20) DEFAULT 'NULL'::character varying,
    created_date        timestamp   DEFAULT CURRENT_TIMESTAMP,
    status_id varchar(10) DEFAULT 'Active',
    PRIMARY KEY (professiontype_id)
);

drop table if exists refdata_rulesets cascade;
CREATE TABLE refdata_rulesets
(
    rule_id        char(38)     DEFAULT gen_random_uuid() NOT NULL,
    rule_name      varchar(65) DEFAULT 'NULL'::character varying,
    created_user   varchar(20) DEFAULT 'NULL'::character varying,
    created_date   timestamp   DEFAULT CURRENT_TIMESTAMP,
    status_id varchar(10) DEFAULT 'Active',
    expiration_date timestamp,
    PRIMARY KEY (rule_id)
);

drop table if exists refdata_sensitivityflags cascade;
CREATE TABLE refdata_sensitivityflags
(
    sensitivityflag_id   varchar(5) NOT NULL,
    sensitivityflag_desc varchar(50) DEFAULT 'NULL'::character varying,
    created_date       timestamp   DEFAULT CURRENT_TIMESTAMP,
    status_id varchar(10) DEFAULT 'Active',
    PRIMARY KEY (sensitivityflag_id)
);

drop table if exists refdata_status cascade;
CREATE TABLE refdata_status
(
    status_id          varchar(10) NOT NULL,
    status_description varchar(45)                                                 NOT NULL,
    created_date       timestamp   DEFAULT CURRENT_TIMESTAMP,
    created_user       varchar(20) DEFAULT 'NULL'::character varying,
    PRIMARY KEY (status_id)
);

drop table if exists refdata_terminologystds cascade;
CREATE TABLE refdata_terminologystds
(
    terminology_std         varchar(25)  NOT NULL,
    terminologystd_version varchar(10)                                                          NOT NULL,
    terminologystd_desc    varchar(129) DEFAULT 'NULL'::character varying,
    created_date           timestamp    DEFAULT CURRENT_TIMESTAMP,
    status_id varchar(10) DEFAULT 'Active',
    PRIMARY KEY (terminology_std)
);

drop table if exists refdata_timezones cascade;
CREATE TABLE refdata_timezones
(
    timezone_value varchar(3) NOT NULL,
    timezone_desc  varchar(25) DEFAULT 'NULL'::character varying,
    created_date   timestamp   DEFAULT CURRENT_TIMESTAMP,
    status_id varchar(10) DEFAULT 'Active',
    PRIMARY KEY (timezone_value)
);

drop table if exists refdata_usstates cascade;
CREATE TABLE refdata_usstates
(
    state_id          varchar(2) NOT NULL,
    state_description varchar(65) DEFAULT 'NULL'::character varying,
    lattitude         varchar(12) DEFAULT 'NULL'::character varying,
    longitude         varchar(12) DEFAULT 'NULL'::character varying,
    created_date      timestamp   DEFAULT CURRENT_TIMESTAMP,
    status_id varchar(10) DEFAULT 'Active',
    created_user      varchar(20) DEFAULT 'NULL'::character varying,
    PRIMARY KEY (state_id)
);

drop table if exists refdata_vendors cascade;
CREATE TABLE refdata_vendors
(
    vendor_id    char(38)     DEFAULT gen_random_uuid() NOT NULL,
    vendor_name  varchar(50) DEFAULT 'NULL'::character varying,
    created_date timestamp   DEFAULT CURRENT_TIMESTAMP,
    status_id varchar(10) DEFAULT 'Active',
    created_user varchar(20) DEFAULT 'NULL'::character varying,
    vendor_guid  char(38)    DEFAULT 'NULL'::bpchar,
    PRIMARY KEY (vendor_id)
);

ALTER TABLE refdata_applications
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_applications
    ADD FOREIGN KEY (vendor_id)
        REFERENCES refdata_vendors (vendor_id);

ALTER TABLE refdata_applications
    ADD FOREIGN KEY (organization_guid)
        REFERENCES refdata_organizations (organization_guid);

ALTER TABLE refdata_codesets
    ADD FOREIGN KEY (industry_std)
        REFERENCES refdata_industrystds (industry_std);

ALTER TABLE refdata_codesets
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_codesets
    ADD FOREIGN KEY (sensitivityflag_id)
        REFERENCES refdata_sensitivityflags (sensitivityflag_id);

ALTER TABLE refdata_devicetypes
    ADD FOREIGN KEY  (status_id)
        REFERENCES refdata_status(status_id);

ALTER TABLE refdata_industrystds_eventtypes
    ADD FOREIGN KEY  (status_id)
        REFERENCES refdata_status(status_id);

ALTER TABLE refdata_industrystds_eventtypes
    ADD FOREIGN KEY  (industry_std)
        REFERENCES refdata_industrystds(industry_std);

ALTER TABLE refdata_industries
    ADD FOREIGN KEY  (status_id)
        REFERENCES refdata_status(status_id);

ALTER TABLE refdata_industries_business
    ADD FOREIGN KEY  (status_id)
        REFERENCES refdata_status(status_id);

ALTER TABLE refdata_industries_business
    ADD FOREIGN KEY  (industry_id)
        REFERENCES refdata_industries(industry_id);

ALTER TABLE refdata_industrystds
    ADD FOREIGN KEY  (status_id)
        REFERENCES refdata_status(status_id);

ALTER TABLE refdata_legalentities
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_legalentities
    ADD FOREIGN KEY (state_id)
        REFERENCES refdata_usstates (state_id);

ALTER TABLE refdata_organizations
    ADD FOREIGN KEY (legalentity_guid)
        REFERENCES refdata_legalentities (legalentity_guid);

ALTER TABLE refdata_organizations
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_organizations
    ADD FOREIGN KEY (state_id)
        REFERENCES refdata_usstates (state_id);

ALTER TABLE refdata_professiontypes
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_rulesets
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_sensitivityflags
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_terminologystds
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_timezones
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_usstates
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_vendors
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

-- Datamodel
drop table if exists datamodel_apis cascade;
CREATE TABLE datamodel_apis
(
    api_id             char(38)   DEFAULT gen_random_uuid() NOT NULL,
    technology         varchar(30),
    dataattribute_id  char(38),
    baseurllocation    varchar(99),
    apiname            varchar(79),
    created_date       timestamp DEFAULT CURRENT_TIMESTAMP,
    status_id varchar(10) DEFAULT 'Active',
    purpose            varchar(49),
    datmodel_tablename varchar(99),
    apiparams          varchar(59),
    apiexample         varchar(149),
    PRIMARY KEY (api_id)
);

ALTER TABLE datamodel_apis
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

drop table if exists datamodel_domains cascade;
CREATE TABLE datamodel_domains
(
    domainname        varchar(64) NOT NULL,
    domaininformation varchar(249) DEFAULT 'NULL'::character varying,
    status_id varchar(10) DEFAULT 'Active',
    created_date      timestamp    DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (domainname)
);

ALTER TABLE datamodel_domains
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

drop table if exists datamodel_datatables cascade;
CREATE TABLE datamodel_datatables
(
    tablename        varchar(64) NOT NULL,
    tableinformation varchar(249) DEFAULT 'NULL'::character varying,
    status_id varchar(10) DEFAULT 'Active',
    created_date     timestamp    DEFAULT CURRENT_TIMESTAMP,
    datadomain       varchar(64),
    PRIMARY KEY (tablename)
);

ALTER TABLE datamodel_datatables
    ADD FOREIGN KEY (datadomain)
        REFERENCES datamodel_domains (domainname);

ALTER TABLE datamodel_datatables
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

-- DataTier
drop table if exists datatier_crawlers cascade;
CREATE TABLE datatier_crawlers
(
    datacrawler_id      char(38) default gen_random_uuid() NOT NULL,
    token               char(128)   DEFAULT 'NULL'::character varying,
    crawledtext_details text        DEFAULT 'NULL'::character varying,
    created_date        timestamp   DEFAULT CURRENT_TIMESTAMP,
    status_id varchar(10) DEFAULT 'Active',
    registeredapp_guid      char(38) DEFAULT 'NULL'::character varying,
    organization_guid   char(38) DEFAULT 'NULL'::character varying,
    PRIMARY KEY (datacrawler_id)
);

ALTER TABLE datatier_crawlers
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE datatier_crawlers
    ADD FOREIGN KEY (registeredapp_guid)
        REFERENCES refdata_applications (app_guid);

ALTER TABLE datatier_crawlers
    ADD FOREIGN KEY (organization_guid)
        REFERENCES refdata_organizations (organization_guid);

drop table if exists datatier_sdp_dataattributes cascade;
create table datatier_sdp_dataattributes
(
    datatier_id      char(38) default gen_random_uuid() NOT NULL,
    basevalue        varchar(99),
    supportingvalue1 varchar(169),
    supportingvalue2 varchar(50),
    supportingvalue3 varchar(50),
    supportingvalue4 varchar(50),
    supportingvalue5 varchar(50),
    supportingvalue6 varchar(50),
    supportingvalue7 varchar(50),
    created_date     timestamp,
    status_id varchar(10) DEFAULT 'Active',
    dataattribute_id  char(38),
    created_user     varchar(20),
    registeredapp_guid   char(38),
    datagentype_id   integer,
    dataattribute_guid char(38) DEFAULT 'UNDF'
);

ALTER TABLE datatier_sdp_dataattributes
    ADD FOREIGN KEY (registeredapp_guid)
        REFERENCES refdata_applications (app_guid);

ALTER TABLE datatier_sdp_dataattributes
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE datatier_sdp_dataattributes
    ADD FOREIGN KEY (dataattribute_id)
        REFERENCES refdata_dataattributes (dataattribute_id);

drop table if exists datatier_sdp_datastructures cascade;
CREATE TABLE datatier_sdp_datastructures
(
    datastructure_core_id  char(38) DEFAULT gen_random_uuid() NOT NULL,
    datastructure_name    varchar(29) DEFAULT 'NULL'::character varying,
    datastructure_details text        DEFAULT 'NULL'::character varying,
    created_date          timestamp   DEFAULT CURRENT_TIMESTAMP,
    status_id varchar(10) DEFAULT 'Active',
    registeredapp_guid        char(38) DEFAULT 'NULL'::character varying,
    PRIMARY KEY (datastructure_core_id)
);

ALTER TABLE datatier_sdp_datastructures
    ADD FOREIGN KEY (registeredapp_guid)
        REFERENCES refdata_applications (app_guid);

ALTER TABLE datatier_sdp_datastructures
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

drop table if exists datatier_tokens;
CREATE TABLE datatier_tokens
(
    datatoken_id      char(38)    DEFAULT gen_random_uuid() NOT NULL,
    token             char(128)   DEFAULT 'NULL'::character varying,
    created_date      timestamp   DEFAULT CURRENT_TIMESTAMP,
    status_id varchar(10) DEFAULT 'Active',
    registeredapp_guid    char(38) DEFAULT 'NULL'::character varying,
    organization_guid char(38) DEFAULT 'NULL'::character varying,
    intfc_type        varchar(10) DEFAULT 'API',
    datasource_id     char(38),
    PRIMARY KEY (datatoken_id)
);

ALTER TABLE datatier_tokens
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE datatier_tokens
    ADD FOREIGN KEY (registeredapp_guid)
        REFERENCES refdata_applications (app_guid);

ALTER TABLE datatier_tokens
    ADD FOREIGN KEY (organization_guid)
        REFERENCES refdata_organizations (organization_guid);

-- Platform

drop table if exists platform_codesets cascade;
CREATE TABLE platform_codesets
(
    platform_codeset_id  char(38)    DEFAULT gen_random_uuid() NOT NULL,
    application_guid      CHAR(38),
    organization_guid      CHAR(38),
    codesets_id  char(38),
    created_date        timestamp    DEFAULT CURRENT_TIMESTAMP,
    status_id varchar(10) DEFAULT 'Active',
    created_user        varchar(20)  DEFAULT 'NULL'::character varying,
    originalcode_value  varchar(40),
    originalcode_desc   varchar(149),
    PRIMARY KEY (codesets_id)
);

ALTER TABLE platform_codesets
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE platform_codesets
    ADD FOREIGN KEY (codesets_id)
        REFERENCES refdata_codesets (codesets_id);

drop table if exists platform_codesets_industrystds;
CREATE TABLE platform_codesets_industrystds
(
    termcodeset_id    char(38)    DEFAULT gen_random_uuid() NOT NULL,
    created_date      timestamp    DEFAULT CURRENT_TIMESTAMP,
    status_id varchar(10) DEFAULT 'Active',
    code_value         varchar(20)  DEFAULT 'NULL'::character varying,
    code_desc          varchar(129) DEFAULT 'NULL'::character varying,
    industry_std      varchar(6)   DEFAULT 'UNDF'::character varying,
    terminology_std varchar(25),
    PRIMARY KEY (termcodeset_id)
);

ALTER TABLE platform_codesets_industrystds
    ADD FOREIGN KEY (terminology_std)
        REFERENCES refdata_terminologystds (terminology_std);

ALTER TABLE platform_codesets_industrystds
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

drop table if exists platform_codesets_xmaps cascade;
CREATE TABLE platform_codesets_xmaps
(
    codesetcrossmap_id  char(38) DEFAULT gen_random_uuid() NOT NULL,
    application_guid      CHAR(38),
    organization_guid      CHAR(38),
    terminologystd_from     varchar(25),
    terminologystd_to   varchar(25),
    created_date        timestamp    DEFAULT CURRENT_TIMESTAMP,
    status_id varchar(10) DEFAULT 'Active',
    created_user        varchar(20)  DEFAULT 'NULL'::character varying,
    transformcode_value varchar(40)  DEFAULT 'NULL'::character varying,
    transformcode_desc  varchar(129) DEFAULT 'NULL'::character varying,
    originalcode_value  varchar(40),
    originalcode_desc   varchar(40),
    PRIMARY KEY (codesetcrossmap_id)
);
ALTER TABLE platform_codesets_xmaps
    ADD FOREIGN KEY (application_guid)
        REFERENCES refdata_applications (app_guid);

ALTER TABLE platform_codesets_xmaps
    ADD FOREIGN KEY (organization_guid)
        REFERENCES refdata_organizations (organization_guid);

ALTER TABLE platform_codesets_xmaps
    ADD FOREIGN KEY (terminologystd_from)
        REFERENCES refdata_terminologystds (terminology_std);

ALTER TABLE platform_codesets_xmaps
    ADD FOREIGN KEY (terminologystd_to)
        REFERENCES refdata_terminologystds (terminology_std);

ALTER TABLE platform_codesets_xmaps
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

drop table if exists platform_datageneration_dataattributes cascade;
CREATE TABLE platform_datageneration_dataattributes
(
    datagentype_id          char(38) DEFAULT gen_random_uuid() NOT NULL,
    datagentype_description varchar(65)  DEFAULT 'NULL'::character varying,
    definition              varchar(255) DEFAULT 'NULL'::character varying,
    dataattribute_id        char(38),
    created_date            timestamp    DEFAULT CURRENT_TIMESTAMP,
    status_id varchar(10) DEFAULT 'Active',
    created_user            varchar(20)  DEFAULT 'NULL'::character varying,
    quantity                integer,
    maxrecords_in_source      integer,
    registeredapp_guid          char(38)     DEFAULT 'NULL'::character varying,
    organization_guid       char(38)     DEFAULT 'NULL'::character varying,
    PRIMARY KEY (datagentype_id)
);

ALTER TABLE platform_datageneration_dataattributes
    ADD FOREIGN KEY (dataattribute_id)
        REFERENCES refdata_dataattributes (dataattribute_id);

ALTER TABLE platform_datageneration_dataattributes
    ADD FOREIGN KEY (organization_guid)
        REFERENCES refdata_organizations (organization_guid);

ALTER TABLE platform_datageneration_dataattributes
    ADD FOREIGN KEY (registeredapp_guid)
        REFERENCES refdata_applications (app_guid);

ALTER TABLE platform_datageneration_dataattributes
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

drop table if exists platform_databuilding_dataattributes cascade;
CREATE TABLE platform_databuilding_dataattributes
(
    databuild_dataattribute_id  char(38) DEFAULT gen_random_uuid() NOT NULL,
    databuild_description varchar(65)  DEFAULT 'NULL'::character varying,
    definition              varchar(255) DEFAULT 'NULL'::character varying,
    dataattribute_id        char(38),
    created_date            timestamp    DEFAULT CURRENT_TIMESTAMP,
    status_id varchar(10) DEFAULT 'Active',
    created_user            varchar(20)  DEFAULT 'NULL'::character varying,
    quantity                integer,
    maxrecords_in_source      integer,
    registeredapp_guid          char(38)     DEFAULT 'NULL'::character varying,
    organization_guid       char(38)     DEFAULT 'NULL'::character varying,
    param1  varchar(30) DEFAULT 'NULL'::character varying,
    param1_operator varchar(7) DEFAULT 'NULL'::character varying,
    param1_value varchar(65) DEFAULT 'NULL'::character varying,
    param2  varchar(30) DEFAULT 'NULL'::character varying,
    param2_operator varchar(7) DEFAULT 'NULL'::character varying,
    param2_value varchar(65) DEFAULT 'NULL'::character varying,
    param3  varchar(30) DEFAULT 'NULL'::character varying,
    param3_operator varchar(7) DEFAULT 'NULL'::character varying,
    param3_value varchar(65) DEFAULT 'NULL'::character varying,
    param4  varchar(30) DEFAULT 'NULL'::character varying,
    param4_operator varchar(7) DEFAULT 'NULL'::character varying,
    param4_value varchar(65) DEFAULT 'NULL'::character varying,
    PRIMARY KEY (databuild_dataattribute_id)
);
ALTER TABLE platform_databuilding_dataattributes
    ADD FOREIGN KEY (dataattribute_id)
        REFERENCES refdata_dataattributes (dataattribute_id);

ALTER TABLE platform_databuilding_dataattributes
    ADD FOREIGN KEY (organization_guid)
        REFERENCES refdata_organizations (organization_guid);

ALTER TABLE platform_databuilding_dataattributes
    ADD FOREIGN KEY (registeredapp_guid)
        REFERENCES refdata_applications (app_guid);

ALTER TABLE platform_databuilding_dataattributes
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

drop table if exists platform_databuilding_datastructures cascade;
CREATE TABLE platform_databuilding_datastructures
(
    databuild_datastructures_id  char(38) DEFAULT gen_random_uuid() NOT NULL,
    databuild_description varchar(65)  DEFAULT 'NULL'::character varying,
    definition              varchar(255) DEFAULT 'NULL'::character varying,
    datastructure_id        char(38),
    created_date            timestamp    DEFAULT CURRENT_TIMESTAMP,
    status_id varchar(10) DEFAULT 'Active',
    created_user            varchar(20)  DEFAULT 'NULL'::character varying,
    quantity                integer,
    maxrecords_in_source      integer,
    registeredapp_guid          char(38)     DEFAULT 'NULL'::character varying,
    organization_guid       char(38)     DEFAULT 'NULL'::character varying,
    PRIMARY KEY (databuild_datastructures_id)
);

ALTER TABLE platform_databuilding_datastructures
    ADD FOREIGN KEY (organization_guid)
        REFERENCES refdata_organizations (organization_guid);

ALTER TABLE platform_databuilding_datastructures
    ADD FOREIGN KEY (registeredapp_guid)
        REFERENCES refdata_applications (app_guid);

ALTER TABLE platform_databuilding_datastructures
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE platform_databuilding_datastructures
    ADD FOREIGN KEY (datastructure_id)
        REFERENCES  refdata_datastructures(datastructure_id);

drop table if exists platform_datasources cascade;
create table platform_datasources
(
    platform_datasources_id char(38) DEFAULT gen_random_uuid() NOT NULL,
    datasource_name        varchar(50) default 'NULL'::character varying,
    datasource_type        varchar(10),
    created_date           timestamp   default CURRENT_TIMESTAMP,
    status_id varchar(10) DEFAULT 'Active',
    created_user           varchar(20) default 'NULL'::character varying,
    organization_guid      char(38)    DEFAULT 'NULL'::character varying,
    registeredapp_guid         char(38)    DEFAULT 'NULL'::character varying,
    PRIMARY KEY (platform_datasources_id)
);

ALTER TABLE platform_datasources
    ADD FOREIGN KEY (organization_guid)
        REFERENCES refdata_organizations (organization_guid);

ALTER TABLE platform_datasources
    ADD FOREIGN KEY (registeredapp_guid)
        REFERENCES refdata_applications (app_guid);

ALTER TABLE platform_datasources
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);
-- Added to ensure a reference to it occurs in table created well before in script
ALTER TABLE datatier_tokens
    ADD FOREIGN KEY (datasource_id)
        REFERENCES platform_datasources (platform_datasources_id);

drop table if exists platform_datastructures_dtl cascade;
CREATE TABLE platform_datastructures_dtl
(
    platform_datastructuresdtl_id     char(38) DEFAULT gen_random_uuid() NOT NULL,
    datastructure_id                     char(38),
    composite_datastructure_name                   varchar(50) DEFAULT 'NULL'::character varying,
    sensitivityflag_id                            varchar(5) DEFAULT 'UNDF',
    created_date                                  timestamp   DEFAULT CURRENT_TIMESTAMP,
    status_id varchar(10) DEFAULT 'Active',
    created_user                                  varchar(20) DEFAULT 'NULL'::character varying,
    platform_datastructures_to_dataattributes_guid char(38)    DEFAULT 'NULL'::bpchar,
    registeredapp_guid                                char(38)    DEFAULT 'NULL'::bpchar,
    dataattribute_id                    char(38),
    PRIMARY KEY (platform_datastructuresdtl_id)
);

ALTER TABLE platform_datastructures_dtl
    ADD FOREIGN KEY (registeredapp_guid)
        REFERENCES refdata_applications (app_guid);

ALTER TABLE platform_datastructures_dtl
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE platform_datastructures_dtl
    ADD FOREIGN KEY (datastructure_id)
        REFERENCES  refdata_datastructures(datastructure_id);

ALTER TABLE platform_datastructures_dtl
    ADD FOREIGN KEY (dataattribute_id)
        REFERENCES  refdata_dataattributes(dataattribute_id);

ALTER TABLE platform_datastructures_dtl
    ADD FOREIGN KEY (sensitivityflag_id)
        REFERENCES  refdata_sensitivityflags(sensitivityflag_id);

drop table if exists platform_rulesets_definitions cascade;
CREATE TABLE platform_rulesets_definitions
(
    rulesetdefinitions_id   char(38) DEFAULT gen_random_uuid() NOT NULL,
    rulesetdefinitions_name varchar(50) DEFAULT 'NULL'::character varying,
    ruleset_id              char(38),
    steporder_id            integer,
    operationtype_id        varchar(7)  DEFAULT 'NULL'::character varying,
    ruleset_defvalue        char(40)    DEFAULT 'NULL'::bpchar,
    status_id varchar(10) DEFAULT 'Active',
    created_date            timestamp   DEFAULT CURRENT_TIMESTAMP,
    effective_date          timestamp,
    application_guid        char(38)    DEFAULT 'NULL'::character varying,
    term_date               timestamp,
    dataattribute_id        char(38),
    PRIMARY KEY (rulesetdefinitions_id)
);

ALTER TABLE platform_rulesets_definitions
    ADD FOREIGN KEY (application_guid)
        REFERENCES refdata_applications (app_guid);

ALTER TABLE platform_rulesets_definitions
    ADD FOREIGN KEY (ruleset_id)
        REFERENCES refdata_rulesets (rule_id);

ALTER TABLE platform_rulesets_definitions
    ADD FOREIGN KEY (dataattribute_id)
        REFERENCES refdata_dataattributes (dataattribute_id);

ALTER TABLE platform_rulesets_definitions
    ADD FOREIGN KEY (operationtype_id)
        REFERENCES refdata_operationtype (operationtype_id);

ALTER TABLE platform_rulesets_definitions
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

drop table if exists platform_tokens_xmaps cascade;
CREATE TABLE platform_tokens_xmaps
(
    platform_tokens_xmap_id char(38) DEFAULT gen_random_uuid() ,
    datastructures_id          integer,
    xmap_details                       varchar(149) DEFAULT 'NULL'::character varying,
    dataattribute_id                  char(38),
    fieldorder_id                      integer      DEFAULT 1,
    created_date                       timestamp    DEFAULT CURRENT_TIMESTAMP,
    status_id varchar(10) DEFAULT 'Active',
    created_user                       varchar(20)  DEFAULT 'NULL'::character varying,
    registeredapp_guid                     char(38)     DEFAULT 'NULL'::bpchar,
    organization_guid                  char(38)     default NULL::bpchar,
    PRIMARY KEY (platform_tokens_xmap_id)
);

ALTER TABLE platform_tokens_xmaps
    ADD FOREIGN KEY (dataattribute_id)
        REFERENCES  refdata_dataattributes(dataattribute_id);

ALTER TABLE platform_tokens_xmaps
    ADD FOREIGN KEY (organization_guid)
        REFERENCES refdata_organizations (organization_guid);

ALTER TABLE platform_tokens_xmaps
    ADD FOREIGN KEY (registeredapp_guid)
        REFERENCES refdata_applications (app_guid);

-- Indexes
create index if not exists datatier_sdp_dataattributes_index
    on datatier_sdp_dataattributes (datatier_id, basevalue, supportingvalue1, supportingvalue2, supportingvalue3, supportingvalue4,
                                    supportingvalue5, supportingvalue6, supportingvalue7, created_date, dataattribute_id,
                                    datagentype_id, status_id, created_user, registeredapp_guid);

CREATE INDEX platform_codesets_industrystds_index ON platform_codesets_industrystds(industry_std, created_date, status_id, code_value, code_desc);

CREATE UNIQUE INDEX platform_codesets_industrystds_uindex ON platform_codesets_industrystds(industry_std, code_value, code_desc);

