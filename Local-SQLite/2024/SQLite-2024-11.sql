-- Create Tables

-- Reference Data
drop table if exists refdata_applications;
CREATE TABLE refdata_applications
(
    app_guid               TEXT primary key default  (lower(hex(randomblob(16)))),
    application_customcode TEXT,
    application_desc       TEXT,
    created_user           TEXT,
    created_date           TEXT default (datetime('now', 'localtime')),
    status_id              integer   DEFAULT 1,
    vendor_id              integer,
    industry_oid           TEXT,
    organization_guid      TEXT
);

drop table if exists refdata_codesets;
CREATE TABLE refdata_codesets
(
    codesets_id        TEXT primary key default  (lower(hex(randomblob(16)))),
    codeset_name       TEXT,
    industry_std       TEXT,
    status_id          integer   DEFAULT 1,
    created_date       TEXT default (datetime('now', 'localtime')),
    created_user       TEXT,
    codeset_guid       TEXT,
    field_mapping      TEXT,
    sensitivityflag_id integer,
    externaltable_id   TEXT,
    external_notes     TEXT,
    external_link      TEXT
);

drop table if exists refdata_countries;
CREATE TABLE refdata_countries
(
    country_id   integer primary key autoincrement,
    idd          TEXT,
    country_name TEXT,
    created_date TEXT default (datetime('now', 'localtime')),
    status_id    integer   DEFAULT 1
);

DROP TABLE if exists refdata_dataattributes;
CREATE TABLE refdata_dataattributes
(
    dataattribute_id  integer primary key autoincrement,
    dataattribute_name          TEXT,
    sensitivityflag_id          integer,
    created_date                TEXT default (datetime('now', 'localtime')),
    status_id                   integer   DEFAULT 1,
    created_user                TEXT,
    platform_dataattribute_guid TEXT,
    registeredapp_guid          TEXT,
    attribute_type              TEXT
);

drop table if exists refdata_datastructures;
create table refdata_datastructures
(
    datastructure_id   integer primary key autoincrement,
    datastructure_name           TEXT,
    sensitivityflag_id           integer,
    created_date                 TEXT default (datetime('now', 'localtime')),
    status_id                    integer   default 1,
    created_user                 TEXT,
    platform_datastructures_guid TEXT,
    registeredapp_guid           TEXT
);

drop table if exists refdata_devicetypes;
CREATE TABLE refdata_devicetypes
(
    devicetype_id TEXT primary key default  (lower(hex(randomblob(16)))),
    devicetype    TEXT,
    created_date  TEXT default (datetime('now', 'localtime')),
    status_id     integer   DEFAULT 1
);

drop table if exists refdata_industrystd_eventtypes;
CREATE TABLE refdata_industrystd_eventtypes
(
    eventtype_id   TEXT NOT NULL,
    eventtype_desc TEXT,
    industry_std   TEXT(6),
    created_date   TEXT default (datetime('now', 'localtime')),
    status_id      integer   default 1
);

drop table if exists refdata_industries;
CREATE TABLE refdata_industries
(
    industry_id   TEXT primary key default  (lower(hex(randomblob(16)))) ,
    industry_name TEXT(45),
    created_date  TEXT default (datetime('now', 'localtime')),
    status_id     integer   DEFAULT 1
);

drop table if exists refdata_industries_business;
CREATE TABLE refdata_industries_business
(
    industrytobusiness_id TEXT primary key default  (lower(hex(randomblob(16)))),
    industry_id           TEXT,
    business_area         TEXT,
    created_date          TEXT default (datetime('now', 'localtime')),
    status_id             integer   DEFAULT 1
);

drop table if exists refdata_industrystds;
CREATE TABLE refdata_industrystds
(
    industry_std     TEXT primary key,
    industrystd_desc TEXT,
    created_date     TEXT default (datetime('now', 'localtime')),
    status_id        integer   DEFAULT 1
);

drop table if exists refdata_legalentities;
CREATE TABLE refdata_legalentities
(
    legalentity_guid TEXT  primary key default  (lower(hex(randomblob(16)))),
    location_name    TEXT,
    address          TEXT,
    city             TEXT,
    state_id         TEXT,
    zipcode          TEXT,
    created_user     TEXT,
    status_id        integer   DEFAULT 1,
    created_date     TEXT default (datetime('now', 'localtime')),
    location_url     TEXT,
    location_phone   TEXT
);

drop table if exists refdata_operationtypes;
CREATE TABLE refdata_operationtypes
(
    operationtype_id   TEXT primary key,
    operationtype_name TEXT,
    created_date       TEXT default (datetime('now', 'localtime')),
    status_id          integer   DEFAULT 1
);

drop table if exists refdata_organizations;
CREATE TABLE refdata_organizations
(
    organization_guid          TEXT primary key default  (lower(hex(randomblob(16)))),
    organization_internal_code TEXT,
    organization_internal_id   TEXT,
    organization_name          TEXT,
    address                    TEXT,
    city                       TEXT,
    state_id                   TEXT,
    zipcode                    TEXT,
    created_user               TEXT,
    status_id                  integer   DEFAULT 1,
    created_date               TEXT default (datetime('now', 'localtime')),
    legalentity_guid           TEXT
);

drop table if exists refdata_rulesets;
CREATE TABLE refdata_rulesets
(
    rule_id         TEXT primary key default  (lower(hex(randomblob(16)))),
    rule_name       TEXT(65),
    created_user    TEXT,
    created_date    TEXT default (datetime('now', 'localtime')),
    status_id       integer   DEFAULT 1,
    expiration_date TEXT
);

drop table if exists refdata_professiontypes;
CREATE TABLE refdata_professiontypes
(
    professiontype_id   TEXT primary key default  (lower(hex(randomblob(16)))),
    professiontype_name TEXT(65),
    created_user        TEXT,
    created_date        TEXT default (datetime('now', 'localtime')),
    status_id           integer   DEFAULT 1
);

drop table if exists refdata_sensitivityflags;
CREATE TABLE refdata_sensitivityflags
(
    sensitiveflag_id   integer primary key autoincrement,
    sensitiveflag_desc TEXT,
    created_date       TEXT default (datetime('now', 'localtime')),
    status_id          integer   DEFAULT 1
);

drop table if exists refdata_status;
CREATE TABLE refdata_status
(
    status_id          integer primary key autoincrement,
    status_description TEXT(45)                                                 NOT NULL,
    created_date       TEXT default (datetime('now', 'localtime')),
    created_user       TEXT
);

drop table if exists refdata_terminologystds;
CREATE TABLE refdata_terminologystds
(
    terminologystd         TEXT(6) primary key,
    terminologystd_version TEXT                                                              NOT NULL,
    terminologystd_desc    TEXT,
    created_date           TEXT default (datetime('now', 'localtime')),
    status_id              integer   DEFAULT 1
);

drop table if exists refdata_timezones;
CREATE TABLE refdata_timezones
(
    timezone_value TEXT(3) primary key,
    timezone_desc  TEXT(25),
    created_date   TEXT default (datetime('now', 'localtime')),
    status_id      integer   DEFAULT 1
);

drop table if exists refdata_usstates;
CREATE TABLE refdata_usstates
(
    state_id          TEXT primary key,
    state_description TEXT(65),
    lattitude         TEXT,
    longitude         TEXT,
    created_date      TEXT default (datetime('now', 'localtime')),
    status_id         integer   DEFAULT 1,
    created_user      TEXT
);

drop table if exists refdata_vendors;
CREATE TABLE refdata_vendors
(
    vendor_id    TEXT   primary key DEFAULT  (lower(hex(randomblob(16)))) ,
    vendor_name  TEXT,
    created_date TEXT default (datetime('now', 'localtime')),
    status_id    integer   DEFAULT 1,
    created_user TEXT,
    vendor_guid  TEXT
);

-- DataModel

DROP TABLE if exists datamodel_apis;
CREATE TABLE datamodel_apis
(
    api_id             TEXT primary key DEFAULT  (lower(hex(randomblob(16)))),
    technology         TEXT,
    dataattribute_id  integer,
    baseurllocation    TEXT,
    apiname            TEXT,
    created_date       TEXT default (datetime('now', 'localtime')),
    status_id          integer   DEFAULT 1,
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
    status_id        integer   DEFAULT 1,
    created_date     TEXT default (datetime('now', 'localtime')),
    datadomain       TEXT
);

DROP TABLE if exists datamodel_domains;
CREATE TABLE datamodel_domains
(
    domainname        TEXT NOT NULL,
    domaininformation TEXT,
    status_id         integer   DEFAULT 1,
    created_date      TEXT default (datetime('now', 'localtime'))
);

-- Data Tier
drop table if exists datatier_crawlers;
CREATE TABLE datatier_crawlers
(
    datacrawler_id      TEXT primary key default  (lower(hex(randomblob(16)))),
    token               TEXT,
    crawledtext_details text,
    created_date        TEXT    default (datetime('now', 'localtime')),
    status_id           integer DEFAULT 1,
    registeredapp_guid  TEXT,
    organization_guid   TEXT
);

DROP TABLE if exists datatier_sdp_datastructures;
CREATE TABLE datatier_sdp_datastructures
(
    datastructure_core_id TEXT primary key DEFAULT  (lower(hex(randomblob(16)))),
    datastructure_name    TEXT,
    datastructure_details text,
    created_date          TEXT default (datetime('now', 'localtime')),
    status_id             integer   DEFAULT 1,
    registeredapp_guid    TEXT
);

drop table if exists datatier_sdp_dataattributes;
create table datatier_sdp_dataattributes
(
    datatier_id        TEXT primary key default  (lower(hex(randomblob(16)))),
    basevalue          TEXT,
    supportingvalue1   TEXT,
    supportingvalue2   TEXT,
    supportingvalue3   TEXT,
    supportingvalue4   TEXT,
    supportingvalue5   TEXT,
    supportingvalue6   TEXT,
    supportingvalue7   TEXT,
    created_date       TEXT,
    status_id          integer,
    dataattribute_id   integer,
    created_user       TEXT,
    registeredapp_guid TEXT,
    datagentype_id     integer
);

drop table if exists datatier_tokens;
CREATE TABLE datatier_tokens
(
    datatoken_id       TEXT primary key default  (lower(hex(randomblob(16)))),
    token              char(128),
    created_date       TEXT default (datetime('now', 'localtime')),
    status_id          integer   DEFAULT 1,
    registeredapp_guid TEXT,
    organization_guid  TEXT,
    intfc_type         TEXT      DEFAULT 'API',
    datasource_id      integer
);

-- Platform

DROP TABLE if exists platform_codesets;
CREATE TABLE platform_codesets
(
    platform_codeset_id  TEXT primary key default  (lower(hex(randomblob(16)))),
    application_guid    TEXT,
    organization_guid   TEXT,
    codesets_id INT,
    created_date        TEXT default (datetime('now', 'localtime')),
    status_id           integer   DEFAULT 1,
    created_user        TEXT,
    originalcode_value  TEXT,
    originalcode_desc   TEXT
);

drop table if exists platform_codesets_industrystds;
CREATE TABLE platform_codesets_industrystds
(
    term_codeset_id  TEXT  primary key default  (lower(hex(randomblob(16)))),
    created_date      TEXT default (datetime('now', 'localtime')),
    status_id         integer   DEFAULT 1,
    code_value        TEXT,
    code_desc         TEXT,
    industry_std      TEXT,
    terminology_std TEXT
);

DROP TABLE if exists platform_codesets_xmaps;
CREATE TABLE platform_codesets_xmaps
(
    codesetcrossmap_id  TEXT primary key default  (lower(hex(randomblob(16)))),
    application_guid    TEXT,
    organization_guid   TEXT,
    terminologystd_from     integer,
    terminologystd_to   integer,
    created_date        TEXT default (datetime('now', 'localtime')),
    status_id           integer   DEFAULT 1,
    created_user        TEXT,
    transformcode_value TEXT,
    transformcode_desc  TEXT,
    originalcode_value  TEXT,
    originalcode_desc   TEXT
);

DROP TABLE if exists platform_datageneration_dataattributes;
CREATE TABLE platform_datageneration_dataattributes
(
    datagentype_id          TEXT primary key default  (lower(hex(randomblob(16)))),
    datagentype_description TEXT,
    definition              TEXT,
    dataattribute_id        integer,
    created_date            TEXT default (datetime('now', 'localtime')),
    status_id               integer   DEFAULT 1,
    created_user            TEXT,
    quantity                integer,
    maxrecords_in_source      integer,
    registeredapp_guid      TEXT,
    organization_guid       TEXT
);

DROP TABLE if exists platform_databuilding_dataattributes;
CREATE TABLE platform_databuilding_dataattributes
(
    databuild_dataattribute_id TEXT primary key default  (lower(hex(randomblob(16)))),
    databuild_description TEXT,
    definition              TEXT,
    dataattribute_id        integer,
    created_date            TEXT default (datetime('now', 'localtime')),
    status_id               integer   DEFAULT 1,
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
    databuild_datastructures_id  TEXT primary key default  (lower(hex(randomblob(16)))),
    databuild_description TEXT,
    definition              TEXT,
    datastructure_id        integer,
    created_date            TEXT default (datetime('now', 'localtime')),
    status_id               integer   DEFAULT 1,
    created_user            TEXT,
    quantity                integer,
    maxrecords_in_source      integer,
    registeredapp_guid      TEXT,
    organization_guid       TEXT
);

drop table if exists platform_datasources;
create table platform_datasources
(
    platform_datasources_id TEXT primary key default  (lower(hex(randomblob(16)))),
    datasource_name         TEXT,
    datasource_type         TEXT,
    created_date            TEXT default (datetime('now', 'localtime')),
    status_id               integer   default 1,
    created_user            TEXT,
    organization_guid       TEXT,
    registeredapp_guid      TEXT
);

drop table if exists platform_datastructures_dtl;
CREATE TABLE platform_datastructures_dtl
(
    platform_datastructuresdtl_id    TEXT primary key default  (lower(hex(randomblob(16)))),
    datastructure_id                     integer,
    composite_datastructure_name                   TEXT,
    sensitivityflag_id                             integer   DEFAULT 1,
    created_date                                   TEXT default (datetime('now', 'localtime')),
    status_id                                      integer   DEFAULT 1,
    created_user                                   TEXT,
    platform_datastructures_to_dataattributes_guid TEXT,
    registeredapp_guid                             TEXT,
    dataattribute_id                     integer
);

drop table if exists platform_rulesets_definitions;
CREATE TABLE platform_rulesets_definitions
(
    ruleset_definitions_id   TEXT primary key default  (lower(hex(randomblob(16)))),
    ruleset_definitions_name TEXT,
    ruleset_id              TEXT,
    steporder_id            integer,
    operationtype_id        TEXT,
    ruleset_defvalue        char,
    status_id               integer   DEFAULT 1,
    created_date            TEXT default (datetime('now', 'localtime')),
    effective_date          TEXT,
    application_guid        TEXT,
    term_date               TEXT,
    dataattribute_id        integer
);

drop table if exists platform_tokens_xmaps;
CREATE TABLE platform_tokens_xmaps
(
    platform_tokens_xmap_id TEXT primary key default  (lower(hex(randomblob(16)))),
    datastructure_id            integer,
    xmap_details                          TEXT,
    dataattribute_id                      integer   DEFAULT 1,
    fieldorder_id                         integer   DEFAULT 1,
    created_date                          TEXT default (datetime('now', 'localtime')),
    status_id                             integer   DEFAULT 1,
    created_user                          TEXT,
    registeredapp_guid                    TEXT,
    organization_guid                     TEXT
);

-- Indexes
create index if not exists datatier_sdp_dataattributes_uindex
    on datatier_sdp_dataattributes (datatier_id, basevalue, supportingvalue1, supportingvalue2, supportingvalue3, supportingvalue4,
                                    supportingvalue5, supportingvalue6, supportingvalue7, created_date, dataattribute_id,
                                    datagentype_id, status_id, created_user, registeredapp_guid);

CREATE INDEX platform_codesets_industrystds_index ON platform_codesets_industrystds(term_codeset_id, created_date, status_id, code_value, code_desc, industry_std);

CREATE UNIQUE INDEX platform_codesets_industrystds_uindex ON platform_codesets_industrystds(industry_std, code_value, code_desc);
