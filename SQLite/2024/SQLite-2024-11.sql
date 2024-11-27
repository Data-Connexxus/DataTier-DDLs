-- Create Tables
-- Reference Data
drop table if exists refdata_applications;
CREATE TABLE refdata_applications
(
    app_guid               VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    application_customcode TEXT,
    application_desc       TEXT,
    created_user           TEXT,
    created_date           TEXT default (datetime('now', 'localtime')),
    status_id              VARCHAR(38),
    vendor_id              VARCHAR(38),
    industry_oid           TEXT,
    organization_guid      VARCHAR(38)
);

drop table if exists refdata_codesets;
CREATE TABLE refdata_codesets
(
    codesets_id        VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    codeset_name       TEXT,
    industry_std       TEXT,
    status_id          VARCHAR(38),
    created_date       TEXT default (datetime('now', 'localtime')),
    created_user       TEXT,
    field_mapping      TEXT,
    sensitivityflag_id VARCHAR(38),
    externaltable_id   TEXT,
    external_notes     TEXT,
    external_link      TEXT
);

DROP TABLE if exists refdata_dataattributes;
CREATE TABLE refdata_dataattributes
(
    dataattribute_id  TEXT primary key default (lower(hex(randomblob(16)))),
    dataattribute_name          TEXT,
    sensitivityflag_id          TEXT,
    created_date                TEXT default (datetime('now', 'localtime')),
    status_id                   TEXT,
    created_user                TEXT,
    platform_dataattribute_guid TEXT,
    registeredapp_guid          VARCHAR(38),
    attribute_type              TEXT
);

drop table if exists refdata_datastructures;
create table refdata_datastructures
(
    datastructure_id   VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    datastructure_name           TEXT,
    sensitivityflag_id           VARCHAR(38),
    created_date                 TEXT default (datetime('now', 'localtime')),
    status_id                    VARCHAR(38),
    created_user                 TEXT,
    platform_datastructures_guid TEXT,
    registeredapp_guid           VARCHAR(38)
);

drop table if exists refdata_devicetypes;
CREATE TABLE refdata_devicetypes
(
    devicetype_id VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    devicetype    TEXT,
    created_date  TEXT default (datetime('now', 'localtime')),
    status_id     VARCHAR(38)
);

drop table if exists refdata_industrystd_eventtypes;
CREATE TABLE refdata_industrystd_eventtypes
(
    eventtype_id   TEXT NOT NULL,
    eventtype_desc TEXT,
    industry_std   VARCHAR(6),
    created_date   TEXT default (datetime('now', 'localtime')),
    status_id      VARCHAR(38)
);

drop table if exists refdata_industries;
CREATE TABLE refdata_industries
(
    industry_id   VARCHAR(38) primary key default  (lower(hex(randomblob(16)))) ,
    industry_name VARCHAR(45),
    created_date  TEXT default (datetime('now', 'localtime')),
    status_id     VARCHAR(38)
);

drop table if exists refdata_industries_business;
CREATE TABLE refdata_industries_business
(
    industrytobusiness_id VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    industry_id           VARCHAR(38),
    business_area         TEXT,
    created_date          TEXT default (datetime('now', 'localtime')),
    status_id             VARCHAR(38),
);

drop table if exists refdata_industrystds;
CREATE TABLE refdata_industrystds
(
    industry_std     TEXT primary key,
    industrystd_desc TEXT,
    created_date     TEXT default (datetime('now', 'localtime')),
    status_id        VARCHAR(38)
);

drop table if exists refdata_legalentities;
CREATE TABLE refdata_legalentities
(
    legalentity_guid VARCHAR(38)  primary key default  (lower(hex(randomblob(16)))),
    location_name    TEXT,
    address          TEXT,
    city             TEXT,
    state_id         VARCHAR(2),
    zipcode          TEXT,
    created_user     TEXT,
    status_id        VARCHAR(38),
    created_date     TEXT default (datetime('now', 'localtime')),
    location_url     TEXT,
    location_phone   TEXT
);

drop table if exists refdata_operationtypes;
CREATE TABLE refdata_operationtypes
(
    operationtype_id   VARCHAR(38) primary key,
    operationtype_name TEXT,
    created_date       TEXT default (datetime('now', 'localtime')),
    status_id          VARCHAR(38)
);

drop table if exists refdata_organizations;
CREATE TABLE refdata_organizations
(
    organization_guid          VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    organization_internal_code TEXT,
    organization_internal_id   TEXT,
    organization_name          TEXT,
    address                    TEXT,
    city                       TEXT,
    state_id                   VARCHAR(2),
    zipcode                    TEXT,
    created_user               TEXT,
    status_id                  VARCHAR(38),
    created_date               TEXT default (datetime('now', 'localtime')),
    legalentity_guid           VARCHAR(38)
);

drop table if exists refdata_rulesets;
CREATE TABLE refdata_rulesets
(
    rule_id         VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    rule_name       VARCHAR(65),
    created_user    TEXT,
    created_date    TEXT default (datetime('now', 'localtime')),
    status_id       VARCHAR(38),
    expiration_date TEXT
);

drop table if exists refdata_professiontypes;
CREATE TABLE refdata_professiontypes
(
    professiontype_id   VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    professiontype_name VARCHAR(65),
    created_user        TEXT,
    created_date        TEXT default (datetime('now', 'localtime')),
    status_id           VARCHAR(38)
);

drop table if exists refdata_sensitivityflags;
CREATE TABLE refdata_sensitivityflags
(
    sensitivityflag_id   VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    sensitivityflag_desc TEXT,
    created_date       TEXT default (datetime('now', 'localtime')),
    status_id           VARCHAR(38)
);

drop table if exists refdata_status;
CREATE TABLE refdata_status
(
    status_id          VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    status_description varchar(45) NOT NULL,
    created_date       TEXT default (datetime('now', 'localtime')),
    created_user       TEXT
);

drop table if exists refdata_terminologystds;
CREATE TABLE refdata_terminologystds
(
    terminology_std        TEXT primary key,
    terminologystd_version TEXT NOT NULL,
    terminologystd_desc    TEXT,
    created_date           TEXT default (datetime('now', 'localtime')),
    status_id              VARCHAR(38)
);

drop table if exists refdata_timezones;
CREATE TABLE refdata_timezones
(
    timezone_value TEXT primary key,
    timezone_desc  TEXT(25),
    created_date   TEXT default (datetime('now', 'localtime')),
    status_id      VARCHAR(38)
);

drop table if exists refdata_usstates;
CREATE TABLE refdata_usstates
(
    state_id          VARCHAR(2) primary key,
    state_description VARCHAR(65),
    lattitude         TEXT,
    longitude         TEXT,
    created_date      TEXT default (datetime('now', 'localtime')),
    status_id         TEXT,
    created_user      TEXT
);

drop table if exists refdata_vendors;
CREATE TABLE refdata_vendors
(
    vendor_id    VARCHAR(38)  primary key DEFAULT  (lower(hex(randomblob(16)))) ,
    vendor_name  TEXT,
    created_date TEXT default (datetime('now', 'localtime')),
    status_id    VARCHAR(38),
    created_user TEXT,
    vendor_guid  VARCHAR(38)
);

-- DataModel
DROP TABLE if exists datamodel_apis;
CREATE TABLE datamodel_apis
(
    api_id             VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    technology         TEXT,
    dataattribute_id   TEXT,
    baseurllocation    TEXT,
    apiname            TEXT,
    created_date       TEXT default (datetime('now', 'localtime')),
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
    created_date     TEXT default (datetime('now', 'localtime')),
    datadomain       TEXT
);

DROP TABLE if exists datamodel_domains;
CREATE TABLE datamodel_domains
(
    domainname        TEXT NOT NULL,
    domaininformation TEXT,
    status_id         VARCHAR(38),
    created_date      TEXT default (datetime('now', 'localtime'))
);

-- Data Tier
drop table if exists datatier_crawlers;
CREATE TABLE datatier_crawlers
(
    datacrawler_id      INTEGER PRIMARY KEY AUTOINCREMENT,
    token               TEXT,
    crawledtext_details text,
    created_date        TEXT    default (datetime('now', 'localtime')),
    status_id           VARCHAR(38),
    registeredapp_guid  VARCHAR(38),
    organization_guid   VARCHAR(38)
);

DROP TABLE if exists datatier_sdp_datastructures;
CREATE TABLE datatier_sdp_datastructures
(
    datastructure_core_id INTEGER PRIMARY KEY AUTOINCREMENT,
    datastructure_name    TEXT,
    datastructure_details text,
    created_date          TEXT default (datetime('now', 'localtime')),
    status_id             VARCHAR(38),
    registeredapp_guid    VARCHAR(38)
);

drop table if exists datatier_sdp_dataattributes;
create table datatier_sdp_dataattributes
(
    datatier_id        INTEGER PRIMARY KEY AUTOINCREMENT,
    basevalue          TEXT,
    supportingvalue1   TEXT,
    supportingvalue2   TEXT,
    supportingvalue3   TEXT,
    supportingvalue4   TEXT,
    supportingvalue5   TEXT,
    supportingvalue6   TEXT,
    supportingvalue7   TEXT,
    created_date       TEXT,
    status_id          VARCHAR(38),
    dataattribute_id   VARCHAR(38),
    created_user       TEXT,
    registeredapp_guid VARCHAR(38),
    datagentype_id     VARCHAR(38)
);

drop table if exists datatier_tokens;
CREATE TABLE datatier_tokens
(
    datatoken_id       INTEGER PRIMARY KEY AUTOINCREMENT,
    token              char(128),
    created_date       TEXT default (datetime('now', 'localtime')),
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
    platform_codeset_id  VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    application_guid    VARCHAR(38),
    organization_guid   VARCHAR(38),
    codesets_id VARCHAR(38),
    created_date        TEXT default (datetime('now', 'localtime')),
    status_id           VARCHAR(38),
    created_user        TEXT,
    originalcode_value  TEXT,
    originalcode_desc   TEXT
);

drop table if exists platform_codesets_industrystds;
CREATE TABLE platform_codesets_industrystds
(
    term_codeset_id  TEXT  primary key default  (lower(hex(randomblob(16)))),
    created_date      TEXT default (datetime('now', 'localtime')),
    status_id         VARCHAR(38),
    code_value        TEXT,
    code_desc         TEXT,
    industry_std      TEXT,
    terminology_std TEXT
);

DROP TABLE if exists platform_codesets_xmaps;
CREATE TABLE platform_codesets_xmaps
(
    codesetcrossmap_id  VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    application_guid    TEXT,
    organization_guid   TEXT,
    terminologystd_from     TEXT,
    terminologystd_to   TEXT,
    created_date        TEXT default (datetime('now', 'localtime')),
    status_id           VARCHAR(38),
    created_user        TEXT,
    transformcode_value TEXT,
    transformcode_desc  TEXT,
    originalcode_value  TEXT,
    originalcode_desc   TEXT
);

DROP TABLE if exists platform_datageneration_dataattributes;
CREATE TABLE platform_datageneration_dataattributes
(
    datagentype_id          VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    datagentype_description TEXT,
    definition              TEXT,
    dataattribute_id        VARCHAR(38),
    created_date            TEXT default (datetime('now', 'localtime')),
    status_id               VARCHAR(38),
    created_user            TEXT,
    quantity                integer,
    maxrecords_in_source      integer,
    registeredapp_guid      VARCHAR(38),
    organization_guid       VARCHAR(38)
);

DROP TABLE if exists platform_databuilding_dataattributes;
CREATE TABLE platform_databuilding_dataattributes
(
    databuild_dataattribute_id VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    databuild_description TEXT,
    definition              TEXT,
    dataattribute_id        VARCHAR(38),
    created_date            TEXT default (datetime('now', 'localtime')),
    status_id               VARCHAR(38),
    created_user            TEXT,
    quantity                integer,
    maxrecords_in_source      integer,
    registeredapp_guid      TEXT,
    organization_guid       TEXT,
    param1 TEXT,
    param1_operator TEXT,
    param1_value TEXT,
    param2 TEXT,
    param2_operator TEXT,
    param2_value TEXT,
    param3 TEXT,
    param3_operator TEXT,
    param3_value TEXT,
    param4 TEXT,
    param4_operator TEXT,
    param4_value TEXT
);

DROP TABLE if exists platform_databuilding_datastructures;
CREATE TABLE platform_databuilding_datastructures
(
    databuild_datastructures_id  VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    databuild_description TEXT,
    definition              TEXT,
    datastructure_id        TEXT,
    created_date            TEXT default (datetime('now', 'localtime')),
    status_id               VARCHAR(38),
    created_user            TEXT,
    quantity                integer,
    maxrecords_in_source      integer,
    registeredapp_guid      VARCHAR(38),
    organization_guid       VARCHAR(38)
);

drop table if exists platform_datasources;
create table platform_datasources
(
    platform_datasources_id VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    datasource_name         TEXT,
    datasource_type         TEXT,
    created_date            TEXT default (datetime('now', 'localtime')),
    status_id               VARCHAR(38),
    created_user            VARCHAR(38),
    organization_guid       VARCHAR(38),
    registeredapp_guid      VARCHAR(38)
);

drop table if exists platform_datastructures_dtl;
CREATE TABLE platform_datastructures_dtl
(
    platform_datastructuresdtl_id    VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    datastructure_id                     VARCHAR(38),
    composite_datastructure_name                   TEXT,
    sensitivityflag_id                             VARCHAR(38),
    created_date                                   TEXT default (datetime('now', 'localtime')),
    status_id                                      VARCHAR(38),
    created_user                                   TEXT,
    platform_datastructures_to_dataattributes_guid TEXT,
    registeredapp_guid                             VARCHAR(38),
    dataattribute_id                     VARCHAR(38)
);

drop table if exists platform_rulesets_definitions;
CREATE TABLE platform_rulesets_definitions
(
    ruleset_definitions_id   VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    ruleset_definitions_name TEXT,
    ruleset_id              VARCHAR(38),
    steporder_id            integer,
    operationtype_id        VARCHAR(38),
    ruleset_defvalue        char,
    status_id               VARCHAR(38),
    created_date            TEXT default (datetime('now', 'localtime')),
    effective_date          TEXT,
    application_guid        VARCHAR(38),
    term_date               TEXT,
    dataattribute_id        VARCHAR(38)
);

drop table if exists platform_tokens_xmaps;
CREATE TABLE platform_tokens_xmaps
(
    platform_tokens_xmap_id VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    datastructure_id            integer,
    xmap_details                          TEXT,
    dataattribute_id                      VARCHAR(38),
    fieldorder_id                         integer   DEFAULT 1,
    created_date                          TEXT default (datetime('now', 'localtime')),
    status_id                             VARCHAR(38),
    created_user                          TEXT,
    registeredapp_guid                    VARCHAR(38),
    organization_guid                     VARCHAR(38)
);

-- Indexes
create index if not exists datatier_sdp_dataattributes_uindex
    on datatier_sdp_dataattributes (datatier_id, basevalue, supportingvalue1, supportingvalue2, supportingvalue3, supportingvalue4,
                                    supportingvalue5, supportingvalue6, supportingvalue7, created_date, dataattribute_id,
                                    datagentype_id, status_id, created_user, registeredapp_guid);

CREATE INDEX platform_codesets_industrystds_index ON platform_codesets_industrystds(term_codeset_id, created_date, status_id, code_value, code_desc, industry_std);
CREATE UNIQUE INDEX platform_codesets_industrystds_uindex ON platform_codesets_industrystds(industry_std, code_value, code_desc);


DROP INDEX if exists datatier_crawler_indx ON datatier_crawlers;
CREATE INDEX datatier_crawler_indx ON datatier_crawlers
(
	datacrawler_id ASC,
	token ASC,
	created_date ASC,
	status_id ASC,
	registeredapp_guid ASC,
	organization_guid ASC
)

drop index if exists datatier_sdp_dataattributes_indx on datatier_sdp_dataattributes;
create index datatier_sdp_dataattributes_indx on datatier_sdp_dataattributes
(
    datatier_id        ASC,
    basevalue          ASC,
    supportingvalue1   ASC,
    supportingvalue2   ASC,
    supportingvalue3   ASC,
    supportingvalue4   ASC,
    supportingvalue5   ASC,
    supportingvalue6   ASC,
    supportingvalue7   ASC,
    created_date       ASC,
    status_id          ASC,
    dataattribute_id   ASC,
    created_user       ASC,
    registeredapp_guid ASC,
    datagentype_id     ASC
);

drop index if exists datatier_sdp_datastructures_indx on datatier_sdp_datastructures;
create index datatier_sdp_datastructures_index on datatier_sdp_datastructures
(
    datastructure_core_id ASC,
    datastructure_name    ASC,
    created_date          ASC,
    status_id             ASC,
    registeredapp_guid    ASC
);

drop index if exists datatier_tokens_indx on datatier_tokens;
create index datatier_tokens_index on datatier_tokens
(
    datatoken_id       ASC,
    token              ASC,
    created_date       ASC,
    status_id          ASC,
    registeredapp_guid ASC,
    organization_guid  ASC,
    intfc_type         ASC,
    datasource_id      ASC
);