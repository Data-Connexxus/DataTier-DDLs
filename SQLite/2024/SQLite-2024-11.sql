-- Create Tables
-- Reference Data Tables are loaded based on usage
drop table if exists refdata_status;
CREATE TABLE refdata_status
(
    status_id          VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    status_description varchar(45) NOT NULL,
    created_date       VARCHAR(20) default (datetime('now', 'localtime')),
    created_user       VARCHAR(20)
);

drop table if exists refdata_vendors;
CREATE TABLE refdata_vendors
(
    vendor_id    VARCHAR(38)  primary key DEFAULT  (lower(hex(randomblob(16)))) ,
    vendor_name  VARCHAR(50),
    created_date VARCHAR(20) default (datetime('now', 'localtime')),
    status_id    VARCHAR(38),
    created_user VARCHAR(20),
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id)
);

drop table if exists refdata_usstates;
CREATE TABLE refdata_usstates
(
    state_id          VARCHAR(2) primary key,
    state_description VARCHAR(65),
    lattitude         VARCHAR(12),
    longitude         VARCHAR(12),
    created_date      VARCHAR(20) default (datetime('now', 'localtime')),
    status_id         VARCHAR(38),
    created_user      VARCHAR(20),
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id)
);

drop table if exists refdata_legalentities;
CREATE TABLE refdata_legalentities
(
    legalentity_guid VARCHAR(38)  primary key default  (lower(hex(randomblob(16)))),
    location_name    VARCHAR(50),
    address          VARCHAR(75),
    city             VARCHAR(60),
    state_id         VARCHAR(2),
    zipcode          VARCHAR(12),
    created_user     VARCHAR(20),
    status_id        VARCHAR(38),
    created_date     VARCHAR(20) default (datetime('now', 'localtime')),
    location_url     VARCHAR(99),
    location_phone   VARCHAR(12),
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id),
    FOREIGN KEY (state_id) REFERENCES refdata_usstates(state_id)
);

drop table if exists refdata_organizations;
CREATE TABLE refdata_organizations
(
    organization_guid          VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    organization_internal_code VARCHAR(10),
    organization_internal_id   VARCHAR(10),
    organization_name          VARCHAR(50),
    address                   VARCHAR(75),
    city                       VARCHAR(60),
    state_id                   VARCHAR(2),
    zipcode                    VARCHAR(12),
    created_user               VARCHAR(20),
    status_id                  VARCHAR(38),
    created_date               VARCHAR(20) default (datetime('now', 'localtime')),
    legalentity_guid           VARCHAR(38),
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id),
    FOREIGN KEY (state_id) REFERENCES refdata_usstates(state_id),
    FOREIGN KEY (legalentity_guid) REFERENCES refdata_legalentities(legalentity_guid)
);

drop table if exists refdata_applications;
CREATE TABLE refdata_applications
(
    app_guid               VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    application_customcode VARCHAR(15),
    application_desc       VARCHAR(50),
    created_user           VARCHAR(20),
    created_date           VARCHAR(20) default (datetime('now', 'localtime')),
    status_id              VARCHAR(38),
    vendor_id              VARCHAR(38),
    industry_oid           VARCHAR(49),
    organization_guid      VARCHAR(38),
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id),
    FOREIGN KEY(vendor_id) REFERENCES refdata_vendors(vendor_id),
    FOREIGN KEY(organization_guid) REFERENCES refdata_organizations(organization_guid)
);

drop table if exists refdata_sensitivityflags;
CREATE TABLE refdata_sensitivityflags
(
    sensitivityflag_id   VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    sensitivityflag_desc VARCHAR(30),
    created_date       VARCHAR(20) default (datetime('now', 'localtime')),
    status_id           VARCHAR(38),
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id)
);

drop table if exists refdata_codesets;
CREATE TABLE refdata_codesets
(
    codesets_id        VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    codeset_name       VARCHAR(50),
    industry_std       VARCHAR(6),
    status_id          VARCHAR(38),
    created_date       VARCHAR(20) default (datetime('now', 'localtime')),
    created_user       VARCHAR(20),
    field_mapping      VARCHAR(40),
    sensitivityflag_id VARCHAR(38),
    externaltable_id   VARCHAR(20),
    external_notes     VARCHAR(149),
    external_link      VARCHAR(99),
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id),
    FOREIGN KEY (sensitivityflag_id) REFERENCES refdata_sensitivityflags(sensitivityflag_id)
);

DROP TABLE if exists refdata_dataattributes;
CREATE TABLE refdata_dataattributes
(
    dataattribute_id  TEXT primary key default (lower(hex(randomblob(16)))),
    dataattribute_name         VARCHAR(50),
    sensitivityflag_id          VARCHAR(38),
    created_date                VARCHAR(20) default (datetime('now', 'localtime')),
    status_id                   VARCHAR(38),
    created_user                VARCHAR(20),
    registeredapp_guid          VARCHAR(38),
    attribute_type              VARCHAR(10),
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id),
    FOREIGN KEY (sensitivityflag_id) REFERENCES refdata_sensitivityflags(sensitivityflag_id)
);

drop table if exists refdata_datastructures;
create table refdata_datastructures
(
    datastructure_id   VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    datastructure_name           VARCHAR(50),
    sensitivityflag_id           VARCHAR(38),
    created_date                 VARCHAR(20) default (datetime('now', 'localtime')),
    status_id                    VARCHAR(38),
    created_user                 VARCHAR(20),
    registeredapp_guid           VARCHAR(38),
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id),
    FOREIGN KEY (sensitivityflag_id) REFERENCES refdata_sensitivityflags(sensitivityflag_id),
    FOREIGN KEY (registeredapp_guid) REFERENCES refdata_applications(app_guid)
);

drop table if exists refdata_devicetypes;
CREATE TABLE refdata_devicetypes
(
    devicetype_id VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    devicetype    VARCHAR(30),
    created_date  VARCHAR(20) default (datetime('now', 'localtime')),
    status_id     VARCHAR(38),
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id)
);

drop table if exists refdata_industrystds;
CREATE TABLE refdata_industrystds
(
    industry_std     VARCHAR(6) primary key,
    industrystd_desc VARCHAR(30),
    created_date     VARCHAR(20) default (datetime('now', 'localtime')),
    status_id        VARCHAR(38)
);

drop table if exists refdata_industrystd_eventtypes;
CREATE TABLE refdata_industrystd_eventtypes
(
    eventtype_id   VARCHAR(10) NOT NULL,
    eventtype_desc VARCHAR(30),
    industry_std   VARCHAR(6),
    created_date   VARCHAR(20) default (datetime('now', 'localtime')),
    status_id      VARCHAR(38),
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id),
    FOREIGN KEY(industry_std) REFERENCES refdata_industrystds(industry_std)
);

drop table if exists refdata_industries;
CREATE TABLE refdata_industries
(
    industry_id   VARCHAR(38) primary key default  (lower(hex(randomblob(16)))) ,
    industry_name VARCHAR(45),
    created_date  VARCHAR(20) default (datetime('now', 'localtime')),
    status_id     VARCHAR(38),
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id)
);

drop table if exists refdata_industries_business;
CREATE TABLE refdata_industries_business
(
    industrytobusiness_id VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    industry_id           VARCHAR(38),
    business_area         VARCHAR(50),
    created_date          VARCHAR(20) default (datetime('now', 'localtime')),
    status_id             VARCHAR(38),
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id),
    FOREIGN KEY(industry_id) REFERENCES refdata_industries(industry_id)
);

drop table if exists refdata_operationtypes;
CREATE TABLE refdata_operationtypes
(
    operationtype_id   VARCHAR(7) primary key,
    operationtype_name VARCHAR(60),
    created_date       VARCHAR(20) default (datetime('now', 'localtime')),
    status_id          VARCHAR(38),
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id)
);

drop table if exists refdata_professiontypes;
CREATE TABLE refdata_professiontypes
(
    professiontype_id   VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    professiontype_name VARCHAR(65),
    created_user       VARCHAR(20),
    created_date        VARCHAR(20) default (datetime('now', 'localtime')),
    status_id           VARCHAR(38),
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id)
);

drop table if exists refdata_rulesets;
CREATE TABLE refdata_rulesets
(
    rule_id         VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    rule_name       VARCHAR(65),
    created_user    VARCHAR(20),
    created_date    VARCHAR(20) default (datetime('now', 'localtime')),
    status_id       VARCHAR(38),
    expiration_date VARCHAR(20),
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id)
);

drop table if exists refdata_terminologystds;
CREATE TABLE refdata_terminologystds
(
    terminology_std        VARCHAR(25) primary key,
    terminologystd_version VARCHAR(10) NOT NULL,
    terminologystd_desc    VARCHAR(129),
    created_date           VARCHAR(20) default (datetime('now', 'localtime')),
    status_id              VARCHAR(38),
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id)
);

drop table if exists refdata_timezones;
CREATE TABLE refdata_timezones
(
    timezone_value VARCHAR(3) primary key,
    timezone_desc  VARCHAR(25),
    created_date   VARCHAR(20) default (datetime('now', 'localtime')),
    status_id      VARCHAR(38),
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id)
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
    apiexample         TEXT,
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id)
);

DROP TABLE if exists datamodel_datatables;
CREATE TABLE datamodel_datatables
(
    tablename        TEXT NOT NULL,
    tableinformation TEXT,
    status_id        VARCHAR(38),
    created_date     TEXT default (datetime('now', 'localtime')),
    datadomain       TEXT,
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id)
);

DROP TABLE if exists datamodel_domains;
CREATE TABLE datamodel_domains
(
    domainname        TEXT NOT NULL,
    domaininformation TEXT,
    status_id         VARCHAR(38),
    created_date      TEXT default (datetime('now', 'localtime')),
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id)
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
    organization_guid   VARCHAR(38),
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id),
    FOREIGN KEY(registeredapp_guid) REFERENCES refdata_applications(app_guid),
    FOREIGN KEY(organization_guid) REFERENCES refdata_organizations(organization_guid)
);

DROP TABLE if exists datatier_sdp_datastructures;
CREATE TABLE datatier_sdp_datastructures
(
    datastructure_core_id INTEGER PRIMARY KEY AUTOINCREMENT,
    datastructure_name    TEXT,
    datastructure_details text,
    created_date          TEXT default (datetime('now', 'localtime')),
    status_id             VARCHAR(38),
    registeredapp_guid    VARCHAR(38),
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id),
    FOREIGN KEY(registeredapp_guid) REFERENCES refdata_applications(app_guid)
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
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id),
    FOREIGN KEY(dataattribute_id) REFERENCES refdata_dataattributes(dataattribute_id),
    FOREIGN KEY(registeredapp_guid) REFERENCES refdata_applications(app_guid)
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
    registeredapp_guid      VARCHAR(38),
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id),
    FOREIGN KEY(registeredapp_guid) REFERENCES refdata_applications(app_guid),
    FOREIGN KEY(organization_guid) REFERENCES refdata_organizations(organization_guid)
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
    datasource_id      VARCHAR(38),
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id),
    FOREIGN KEY(registeredapp_guid) REFERENCES refdata_applications(app_guid),
    FOREIGN KEY(organization_guid) REFERENCES refdata_organizations(organization_guid),
    FOREIGN KEY(datasource_id) REFERENCES platform_datasources(platform_datasources_id)
);

-- Platform
DROP TABLE if exists platform_codesets;
CREATE TABLE platform_codesets
(
    platform_codeset_id  VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    application_guid    VARCHAR(38),
    organization_guid   VARCHAR(38),
    codesets_id VARCHAR(38),
    created_date       VARCHAR(20) default (datetime('now', 'localtime')),
    status_id           VARCHAR(38),
    created_user        VARCHAR(20),
    originalcode_value  VARCHAR(40),
    originalcode_desc   VARCHAR(149),
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id),
    FOREIGN KEY(application_guid) REFERENCES refdata_applications(app_guid),
    FOREIGN KEY(organization_guid) REFERENCES refdata_organizations(organization_guid),
);

drop table if exists platform_codesets_industrystds;
CREATE TABLE platform_codesets_industrystds
(
    term_codeset_id  VARCHAR(38)  primary key default  (lower(hex(randomblob(16)))),
    created_date      VARCHAR(20) default (datetime('now', 'localtime')),
    status_id         VARCHAR(38),
    code_value        VARCHAR(20),
    code_desc         VARCHAR(129),
    industry_std      VARCHAR(6),
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id),
    FOREIGN KEY(industry_std) REFERENCES refdata_industrystds(industry_std)
);

DROP TABLE if exists platform_codesets_xmaps;
CREATE TABLE platform_codesets_xmaps
(
    codesetcrossmap_id  VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    registeredapp_guid     VARCHAR(38),
    organization_guid    VARCHAR(38),
    terminologystd_from      VARCHAR(25),
    terminologystd_to    VARCHAR(25),
    created_date         VARCHAR(20) default (datetime('now', 'localtime')),
    status_id           VARCHAR(38),
    created_user         VARCHAR(20),
    transformcode_value  VARCHAR(40),
    transformcode_desc   VARCHAR(129),
    originalcode_value   VARCHAR(40),
    originalcode_desc    VARCHAR(129),
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id),
    FOREIGN KEY(registeredapp_guid) REFERENCES refdata_applications(app_guid),
    FOREIGN KEY(organization_guid) REFERENCES refdata_organizations(organization_guid),
    FOREIGN KEY (terminologystd_from) REFERENCES refdata_terminologystds(terminology_std),
    FOREIGN KEY (terminologystd_to) REFERENCES refdata_terminologystds(terminology_std)
);

DROP TABLE if exists platform_datageneration_dataattributes;
CREATE TABLE platform_datageneration_dataattributes
(
    datagentype_id          VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    datagentype_description VARCHAR(65),
    definition              VARCHAR(255),
    dataattribute_id        VARCHAR(38),
    created_date            VARCHAR(20) default (datetime('now', 'localtime')),
    status_id               VARCHAR(38),
    created_user            VARCHAR(20),
    quantity                integer,
    maxrecords_in_source      integer,
    registeredapp_guid      VARCHAR(38),
    organization_guid       VARCHAR(38),
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id),
    FOREIGN KEY(registeredapp_guid) REFERENCES refdata_applications(app_guid),
    FOREIGN KEY(organization_guid) REFERENCES refdata_organizations(organization_guid),
    FOREIGN KEY(dataattribute_id) REFERENCES refdata_dataattributes(dataattribute_id)
);

DROP TABLE if exists platform_databuilding_dataattributes;
CREATE TABLE platform_databuilding_dataattributes
(
    databuild_dataattribute_id VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    databuild_description VARCHAR(65),
    definition              VARCHAR(255),
    dataattribute_id        VARCHAR(38),
    created_date            VARCHAR(20) default (datetime('now', 'localtime')),
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
    param4_value VARCHAR(30),
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id),
    FOREIGN KEY(registeredapp_guid) REFERENCES refdata_applications(app_guid),
    FOREIGN KEY(organization_guid) REFERENCES refdata_organizations(organization_guid)
);

DROP TABLE if exists platform_databuilding_datastructures;
CREATE TABLE platform_databuilding_datastructures
(
    databuild_datastructures_id  VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    databuild_description VARCHAR(65),
    definition              VARCHAR(255),
    datastructure_id        VARCHAR(38),
    created_date            VARCHAR(20) default (datetime('now', 'localtime')),
    status_id               VARCHAR(38),
    created_user            VARCHAR(38),
    quantity                integer,
    maxrecords_in_source      integer,
    registeredapp_guid      VARCHAR(38),
    organization_guid       VARCHAR(38),
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id),
    FOREIGN KEY(datastructure_id) REFERENCES refdata_datastructures(datastructure_id),
    FOREIGN KEY(registeredapp_guid) REFERENCES refdata_applications(app_guid),
    FOREIGN KEY(organization_guid) REFERENCES refdata_organizations(organization_guid)
);

drop table if exists platform_datastructures_dtl;
CREATE TABLE platform_datastructures_dtl
(
    platform_datastructuresdtl_id    VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    datastructure_id                     VARCHAR(38),
    composite_datastructure_name                   VARCHAR(50),
    sensitivityflag_id                             VARCHAR(38),
    created_date                                   VARCHAR(20) default (datetime('now', 'localtime')),
    status_id                                      VARCHAR(38),
    created_user                                   VARCHAR(20),
    registeredapp_guid                             VARCHAR(38),
    organizationapp_guid                             VARCHAR(38),
    dataattribute_id                     VARCHAR(38),
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id),
    FOREIGN KEY(datastructure_id) REFERENCES refdata_datastructures(datastructure_id),
    FOREIGN KEY(sensitivityflag_id) REFERENCES refdata_sensitivityflags(sensitivityflag_id),
    FOREIGN KEY(registeredapp_guid) REFERENCES refdata_applications(app_guid),
    FOREIGN KEY(organization_guid) REFERENCES refdata_organizations(organization_guid)
);

drop table if exists platform_rulesets_definitions;
CREATE TABLE platform_rulesets_definitions
(
    ruleset_definitions_id   VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    ruleset_definitions_name VARCHAR(65),
    ruleset_id              VARCHAR(38),
    steporder_id            integer,
    operationtype_id        VARCHAR(7),
    ruleset_defvalue        VARCHAR(20),
    status_id               VARCHAR(38),
    created_date           VARCHAR(20) default (datetime('now', 'localtime')),
    effective_date          VARCHAR(20),
    registeredapp_guid        VARCHAR(38),
    term_date               VARCHAR(20),
    dataattribute_id        VARCHAR(38),
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id),
    FOREIGN KEY(dataattribute_id) REFERENCES refdata_dataattributes(dataattribute_id),
    FOREIGN KEY(operationtype_id) REFERENCES refdata_operationtypes(operationtype_id),
    FOREIGN KEY(registeredapp_guid) REFERENCES refdata_applications(app_guid),
    FOREIGN KEY(ruleset_id) REFERENCES refdata_rulesets(rule_id)
);

drop table if exists platform_tokens_xmaps;
CREATE TABLE platform_tokens_xmaps
(
    platform_tokens_xmap_id VARCHAR(38) primary key default  (lower(hex(randomblob(16)))),
    datastructure_id            VARCHAR(38),
    xmap_details                          VARCHAR(75),
    dataattribute_id                      VARCHAR(38),
    fieldorder_id                         integer   DEFAULT 1,
    created_date                          VARCHAR(20) default (datetime('now', 'localtime')),
    status_id                             VARCHAR(38),
    created_user                          VARCHAR(20),
    registeredapp_guid                    VARCHAR(38),
    organization_guid                     VARCHAR(38),
    FOREIGN KEY(status_id) REFERENCES refdata_status(status_id),
    FOREIGN KEY(dataattribute_id) REFERENCES refdata_dataattributes(dataattribute_id),
    FOREIGN KEY(registeredapp_guid) REFERENCES refdata_applications(app_guid),
    FOREIGN KEY(organization_guid) REFERENCES refdata_organizations(organization_guid)
);

-- Indexes
create index if not exists datatier_sdp_dataattributes_uindex
    on datatier_sdp_dataattributes (datatier_id, basevalue, supportingvalue1, supportingvalue2, supportingvalue3, supportingvalue4,
                                    supportingvalue5, supportingvalue6, supportingvalue7, created_date, dataattribute_id,
                                    status_id, created_user, registeredapp_guid);

CREATE INDEX platform_codesets_industrystds_index ON platform_codesets_industrystds(term_codeset_id, created_date, status_id, code_value, code_desc, industry_std);
CREATE UNIQUE INDEX platform_codesets_industrystds_uindex ON platform_codesets_industrystds(industry_std, code_value, code_desc);


DROP INDEX if exists datatier_crawler_indx;
CREATE INDEX datatier_crawler_indx ON datatier_crawlers
(
	datacrawler_id ASC,
	token ASC,
	created_date ASC,
	status_id ASC,
	registeredapp_guid ASC,
	organization_guid ASC
)

drop index if exists datatier_sdp_dataattributes_indx;
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
    registeredapp_guid ASC
);

drop index if exists datatier_sdp_datastructures_indx;
create index datatier_sdp_datastructures_index on datatier_sdp_datastructures
(
    datastructure_core_id ASC,
    datastructure_name    ASC,
    created_date          ASC,
    status_id             ASC,
    registeredapp_guid    ASC
);

drop index if exists datatier_tokens_indx;
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