-- Create Tables
-- Reference Data Tables are loaded based on usage
drop table if exists refdata_status;
CREATE TABLE refdata_status
(
    status_id          VARCHAR(38) ,
    status_description varchar(45) NOT NULL,
    created_date       VARCHAR(20) ,
    created_user       VARCHAR(20)
);

drop table if exists refdata_vendors;
CREATE TABLE refdata_vendors
(
    vendor_id    VARCHAR(38)   ,
    vendor_name  VARCHAR(50),
    created_date VARCHAR(20) ,
    status_id    VARCHAR(38),
    created_user VARCHAR(20)
);

drop table if exists refdata_usstates;
CREATE TABLE refdata_usstates
(
    state_id          VARCHAR(2) primary key,
    state_description VARCHAR(65),
    lattitude         VARCHAR(12),
    longitude         VARCHAR(12),
    created_date      VARCHAR(20) ,
    status_id         VARCHAR(38),
    created_user      VARCHAR(20)
);

drop table if exists refdata_legalentities;
CREATE TABLE refdata_legalentities
(
    legalentity_guid VARCHAR(38)  ,
    location_name    VARCHAR(50),
    address          VARCHAR(75),
    city             VARCHAR(60),
    state_id         VARCHAR(2),
    zipcode          VARCHAR(12),
    created_user     VARCHAR(20),
    status_id        VARCHAR(38),
    created_date     VARCHAR(20) ,
    location_url     VARCHAR(99),
    location_phone   VARCHAR(12)
);

drop table if exists refdata_organizations;
CREATE TABLE refdata_organizations
(
    organization_guid          VARCHAR(38) ,
    organization_internal_code VARCHAR(10),
    organization_internal_id   VARCHAR(10),
    organization_name          VARCHAR(50),
    address                   VARCHAR(75),
    city                       VARCHAR(60),
    state_id                   VARCHAR(2),
    zipcode                    VARCHAR(12),
    created_user               VARCHAR(20),
    status_id                  VARCHAR(38),
    created_date               VARCHAR(20) ,
    legalentity_guid           VARCHAR(38)
);

drop table if exists refdata_applications;
CREATE TABLE refdata_applications
(
    app_guid               VARCHAR(38) ,
    application_customcode VARCHAR(15),
    application_desc       VARCHAR(50),
    created_user           VARCHAR(20),
    created_date           VARCHAR(20) ,
    status_id              VARCHAR(38),
    vendor_id              VARCHAR(38),
    industry_oid           VARCHAR(49),
    organization_guid      VARCHAR(38),
);

drop table if exists refdata_sensitivityflags;
CREATE TABLE refdata_sensitivityflags
(
    sensitivityflag_id   VARCHAR(38) ,
    sensitivityflag_desc VARCHAR(30),
    created_date       VARCHAR(20) ,
    status_id           VARCHAR(38)
);

drop table if exists refdata_codesets;
CREATE TABLE refdata_codesets
(
    codesets_id        VARCHAR(38) ,
    codeset_name       VARCHAR(50),
    industry_std       VARCHAR(6),
    status_id          VARCHAR(38),
    created_date       VARCHAR(20) ,
    created_user       VARCHAR(20),
    field_mapping      VARCHAR(40),
    sensitivityflag_id VARCHAR(38),
    externaltable_id   VARCHAR(20),
    external_notes     VARCHAR(149),
    external_link      VARCHAR(99)
);

DROP TABLE if exists refdata_dataattributes;
CREATE TABLE refdata_dataattributes
(
    dataattribute_id  TEXT primary key default (lower(hex(randomblob(16)))),
    dataattribute_name         VARCHAR(50),
    sensitivityflag_id          VARCHAR(38),
    created_date                VARCHAR(20) ,
    status_id                   VARCHAR(38),
    created_user                VARCHAR(20),
    registeredapp_guid          VARCHAR(38),
    attribute_type              VARCHAR(10)
);

drop table if exists refdata_datastructures;
create table refdata_datastructures
(
    datastructure_id   VARCHAR(38) ,
    datastructure_name           VARCHAR(50),
    sensitivityflag_id           VARCHAR(38),
    created_date                 VARCHAR(20) ,
    status_id                    VARCHAR(38),
    created_user                 VARCHAR(20),
    registeredapp_guid           VARCHAR(38)
);

drop table if exists refdata_devicetypes;
CREATE TABLE refdata_devicetypes
(
    devicetype_id VARCHAR(38) ,
    devicetype    VARCHAR(30),
    created_date  VARCHAR(20) ,
    status_id     VARCHAR(38)
);

drop table if exists refdata_industrystds;
CREATE TABLE refdata_industrystds
(
    industry_std     VARCHAR(6),
    industrystd_desc VARCHAR(30),
    created_date     VARCHAR(20) ,
    status_id        VARCHAR(38)
);

drop table if exists refdata_industrystd_eventtypes;
CREATE TABLE refdata_industrystd_eventtypes
(
    eventtype_id   VARCHAR(10) NOT NULL,
    eventtype_desc VARCHAR(30),
    industry_std   VARCHAR(6),
    created_date   VARCHAR(20) ,
    status_id      VARCHAR(38)
);

drop table if exists refdata_industries;
CREATE TABLE refdata_industries
(
    industry_id   VARCHAR(38)  ,
    industry_name VARCHAR(45),
    created_date  VARCHAR(20) ,
    status_id     VARCHAR(38)
);

drop table if exists refdata_industries_business;
CREATE TABLE refdata_industries_business
(
    industrytobusiness_id VARCHAR(38) ,
    industry_id           VARCHAR(38),
    business_area         VARCHAR(50),
    created_date          VARCHAR(20) ,
    status_id             VARCHAR(38)
);

drop table if exists refdata_operationtypes;
CREATE TABLE refdata_operationtypes
(
    operationtype_id   VARCHAR(7) primary key,
    operationtype_name VARCHAR(60),
    created_date       VARCHAR(20) ,
    status_id          VARCHAR(38)
);

drop table if exists refdata_professiontypes;
CREATE TABLE refdata_professiontypes
(
    professiontype_id   VARCHAR(38) ,
    professiontype_name VARCHAR(65),
    created_user       VARCHAR(20),
    created_date        VARCHAR(20) ,
    status_id           VARCHAR(38)
);

drop table if exists refdata_rulesets;
CREATE TABLE refdata_rulesets
(
    rule_id         VARCHAR(38) ,
    rule_name       VARCHAR(65),
    created_user    VARCHAR(20),
    created_date    VARCHAR(20) ,
    status_id       VARCHAR(38),
    expiration_date VARCHAR(20)
);

drop table if exists refdata_terminologystds;
CREATE TABLE refdata_terminologystds
(
    terminology_std        VARCHAR(25) primary key,
    terminologystd_version VARCHAR(10) NOT NULL,
    terminologystd_desc    VARCHAR(129),
    created_date           VARCHAR(20) ,
    status_id              VARCHAR(38)
);

drop table if exists refdata_timezones;
CREATE TABLE refdata_timezones
(
    timezone_id VARCHAR(3) primary key,
    timezone_desc  VARCHAR(25),
    created_date   VARCHAR(20) ,
    status_id      VARCHAR(38)
);

-- DataModel
DROP TABLE if exists datamodel_apis;
CREATE TABLE datamodel_apis
(
    api_id             VARCHAR(38) ,
    technology         TEXT,
    dataattribute_id   TEXT,
    baseurllocation    TEXT,
    apiname            TEXT,
    created_date       TEXT ,
    status_id          VARCHAR(38),
    purpose            TEXT,
    datmodel_tablename TEXT,
    apiparams          TEXT,
    apiexample         TEXT
);

DROP TABLE if exists datamodel_datatables;
CREATE TABLE datamodel_datatables
(
    tablename        TEXT NOT NULL,
    tableinformation TEXT,
    status_id        VARCHAR(38),
    created_date     TEXT ,
    datadomain       TEXT
);

DROP TABLE if exists datamodel_domains;
CREATE TABLE datamodel_domains
(
    domainname        TEXT NOT NULL,
    domaininformation TEXT,
    status_id         VARCHAR(38),
    created_date      TEXT
);

-- Data Tier
drop table if exists datatier_crawlers;
CREATE TABLE datatier_crawlers
(
    datacrawler_id      INTEGER,
    token               TEXT,
    crawledtext_details text,
    created_date        TEXT    ,
    status_id           VARCHAR(38),
    registeredapp_guid  VARCHAR(38),
    organization_guid   VARCHAR(38)
);

DROP TABLE if exists datatier_sdp_datastructures;
CREATE TABLE datatier_sdp_datastructures
(
    datastructure_core_id INTEGER,
    datastructure_name    TEXT,
    datastructure_details text,
    created_date          TEXT ,
    status_id             VARCHAR(38),
    registeredapp_guid    VARCHAR(38
);

drop table if exists datatier_sdp_dataattributes;
create table datatier_sdp_dataattributes
(
    datatier_id        INTEGER,
    basevalue          VARCHAR(149),
    supportingvalue1   VARCHAR(149),
    supportingvalue2   VARCHAR(149),
    supportingvalue3   VARCHAR(149),
    supportingvalue4   VARCHAR(149),
    supportingvalue5   VARCHAR(149),
    supportingvalue6   VARCHAR(149),
    supportingvalue7   VARCHAR(149),
    created_date       VARCHAR(149),
    status_id          VARCHAR(38),
    dataattribute_id   VARCHAR(38),
    created_user       VARCHAR(20),
    registeredapp_guid VARCHAR(38)
);

drop table if exists platform_datasources;
create table platform_datasources
(
    platform_datasources_id VARCHAR(38),
    datasource_name         VARCHAR(79),
    datasource_type         VARCHAR(30),
    created_date            VARCHAR(20),
    status_id               VARCHAR(38),
    created_user            VARCHAR(38),
    organization_guid       VARCHAR(38),
    registeredapp_guid      VARCHAR(38)
);

drop table if exists datatier_tokens;
CREATE TABLE datatier_tokens
(
    datatoken_id       INTEGER,
    token              varchar(128),
    created_date       TEXT ,
    status_id          VARCHAR(38),
    registeredapp_guid VARCHAR(38),
    organization_guid  VARCHAR(38),
    intfc_type         TEXT      DEFAULT 'API',
    datasource_id      VARCHAR(38)
);

-- Platform
DROP TABLE if exists platform_codesets;
CREATE TABLE platform_codesets
(
    platform_codeset_id  VARCHAR(38) ,
    application_guid    VARCHAR(38),
    organization_guid   VARCHAR(38),
    codesets_id VARCHAR(38),
    created_date       VARCHAR(20) ,
    status_id           VARCHAR(38),
    created_user        VARCHAR(20),
    originalcode_value  VARCHAR(40),
    originalcode_desc   VARCHAR(149)
);

drop table if exists platform_codesets_industrystds;
CREATE TABLE platform_codesets_industrystds
(
    term_codeset_id VARCHAR(38),
    created_date    VARCHAR(20)             ,
    status_id       VARCHAR(38),
    cui             varchar(8) null,
    lat             varchar(3) null,
    ts              varchar(1) null,
    lui             varchar(10) null,
    stt             varchar(3) null,
    sui             varchar(10) null,
    ispref          varchar(1) null,
    aui             varchar(9) null,
    saui            varchar(50) null,
    scui            varchar(50) null,
    sdui            varchar(50) null,
    sab             varchar(25) null,
    tty             varchar(20) null,
    code            varchar(50) null,
    str             TEXT null,
    srl             int null,
    suppress        varchar(1) null,
    cvf             int null
);

DROP TABLE if exists platform_codesets_xmaps;
CREATE TABLE platform_codesets_xmaps
(
    codesetcrossmap_id  VARCHAR(38) ,
    registeredapp_guid     VARCHAR(38),
    organization_guid    VARCHAR(38),
    terminologystd_from      VARCHAR(25),
    terminologystd_to    VARCHAR(25),
    created_date         VARCHAR(20) ,
    status_id           VARCHAR(38),
    created_user         VARCHAR(20),
    transformcode_value  VARCHAR(40),
    transformcode_desc   VARCHAR(129),
    originalcode_value   VARCHAR(40),
    originalcode_desc    VARCHAR(129)
);

DROP TABLE if exists platform_datageneration_dataattributes;
CREATE TABLE platform_datageneration_dataattributes
(
    datagentype_id          VARCHAR(38) ,
    datagentype_description VARCHAR(65),
    definition              VARCHAR(255),
    dataattribute_id        VARCHAR(38),
    created_date            VARCHAR(20) ,
    status_id               VARCHAR(38),
    created_user            VARCHAR(20),
    quantity                integer,
    maxrecords_in_source      integer,
    registeredapp_guid      VARCHAR(38),
    organization_guid       VARCHAR(38)
);

DROP TABLE if exists platform_databuilding_dataattributes;
CREATE TABLE platform_databuilding_dataattributes
(
    databuild_dataattribute_id VARCHAR(38) ,
    databuild_description VARCHAR(65),
    definition              VARCHAR(255),
    dataattribute_id        VARCHAR(38),
    created_date            VARCHAR(20) ,
    status_id               VARCHAR(38),
    created_user            VARCHAR(20),
    quantity                integer,
    maxrecords_in_source      integer,
    registeredapp_guid      VARCHAR(38),
    organization_guid       VARCHAR(38),
    param1 VARCHAR(30),
    param1_operator VARCHAR(7),
    param1_value VARCHAR(65),
    param2 VARCHAR(30),
    param2_operator VARCHAR(7),
    param2_value VARCHAR(65),
    param3 VARCHAR(30),
    param3_operator VARCHAR(7),
    param3_value VARCHAR(65),
    param4 VARCHAR(30),
    param4_operator VARCHAR(7),
    param4_value VARCHAR(30)
);

DROP TABLE if exists platform_databuilding_datastructures;
CREATE TABLE platform_databuilding_datastructures
(
    databuild_datastructures_id  VARCHAR(38) ,
    databuild_description VARCHAR(65),
    definition              VARCHAR(255),
    datastructure_id        VARCHAR(38),
    created_date            VARCHAR(20) ,
    status_id               VARCHAR(38),
    created_user            VARCHAR(38),
    quantity                integer,
    maxrecords_in_source      integer,
    registeredapp_guid      VARCHAR(38),
    organization_guid       VARCHAR(38)
);

drop table if exists platform_datastructures_dtl;
CREATE TABLE platform_datastructures_dtl
(
    platform_datastructuresdtl_id    VARCHAR(38) ,
    datastructure_id                     VARCHAR(38),
    composite_datastructure_name                   VARCHAR(50),
    sensitivityflag_id                             VARCHAR(38),
    created_date                                   VARCHAR(20) ,
    status_id                                      VARCHAR(38),
    created_user                                   VARCHAR(20),
    registeredapp_guid                             VARCHAR(38),
    organizationapp_guid                             VARCHAR(38),
    dataattribute_id                     VARCHAR(38)
);

drop table if exists platform_rulesets_definitions;
CREATE TABLE platform_rulesets_definitions
(
    ruleset_definitions_id   VARCHAR(38) ,
    ruleset_definitions_name VARCHAR(65),
    ruleset_id              VARCHAR(38),
    steporder_id            integer,
    operationtype_id        VARCHAR(7),
    ruleset_defvalue        VARCHAR(20),
    status_id               VARCHAR(38),
    created_date           VARCHAR(20) ,
    effective_date          VARCHAR(20),
    registeredapp_guid        VARCHAR(38),
    term_date               VARCHAR(20),
    dataattribute_id        VARCHAR(38)
);

drop table if exists platform_tokens_xmaps;
CREATE TABLE platform_tokens_xmaps
(
    platform_tokens_xmap_id VARCHAR(38) ,
    datastructure_id            VARCHAR(38),
    xmap_details                          VARCHAR(75),
    dataattribute_id                      VARCHAR(38),
    fieldorder_id                         integer   DEFAULT 1,
    created_date                          VARCHAR(20) ,
    status_id                             VARCHAR(38),
    created_user                          VARCHAR(20),
    registeredapp_guid                    VARCHAR(38),
    organization_guid                     VARCHAR(38)
);

