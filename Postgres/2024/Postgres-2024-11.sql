-- Create Sequences First
-- Need to create for all serial datatypes
drop sequence if exists datatier_sdp_datastructure_seq;
create sequence datatier_sdp_datastructure_seq;
drop sequence if exists datatier_sdp_dataattribute_seq;
create sequence datatier_sdp_dataattribute_seq;
drop sequence if exists datatier_tokens_seq;
create sequence datatier_tokens_seq;
drop sequence if exists datatier_crawler_seq;
create sequence datatier_crawler_seq;
drop sequence if exists apis_seq;
create sequence apis_seq;
drop sequence if exists platform_codeset_industrystd_seq;
create sequence platform_codeset_industrystd_seq;
drop sequence if exists platform_codesets_seq;
create sequence platform_codesets_seq;
drop sequence if exists platform_codesets_xmap_seq;
create sequence platform_codesets_xmaps_seq;
drop sequence if exists platform_datasources_seq;
create sequence platform_datasources_seq;
drop sequence if exists platform_xmap_tokens_dataattributes_seq;
create sequence platform_xmap_tokens_dataattributes_seq;
drop sequence if exists platform_dataattributes_seq;
create sequence platform_dataattributes_seq;
drop sequence if exists platform_datageneration_seq;
create sequence platform_datageneration_seq;
drop sequence if exists platform_databuilding_dataattributes_seq;
create sequence platform_databuilding_dataattributes_seq
drop sequence if exists platform_databuilding_datastructures_seq;
create sequence platform_databuilding_datastructures_seq;
drop sequence if exists platform_datastructures_seq;
create sequence platform_datastructures_seq;
drop sequence if exists refdata_codeset_seq;
create sequence refdata_codeset_seq;
drop sequence if exists refdata_countries_seq;
create sequence refdata_countries_seq;
drop sequence if exists refdata_devicetypes_seq;
create sequence refdata_devicetypes_seq;
drop sequence if exists refdata_eventtypes_seq;
create sequence refdata_eventtypes_seq;
drop sequence if exists refdata_industries_seq;
create sequence refdata_industries_seq;
drop sequence if exists refdata_industriestobusiness_seq;
create sequence refdata_industriestobusiness_seq;
drop sequence if exists refdata_professiontypes_seq;
create sequence refdata_professiontypes_seq;
drop sequence if exists refdata_regextypes_seq;
create sequence refdata_regextypes_seq;
drop sequence if exists refdata_rulesets_seq;
create sequence refdata_rulesets_seq;
drop sequence if exists refdata_sensitivityflag_seq;
create sequence refdata_sensitivityflag_seq;
drop sequence if exists refdata_status_seq;
create sequence refdata_status_seq;
drop sequence if exists refdata_terminologystd_seq;
create sequence refdata_terminologystd_seq;
drop sequence if exists refdata_vendor_seq;
create sequence refdata_vendor_seq;

-- Create Tables
-- Reference Tables
drop table if exists refdata_application;
CREATE TABLE refdata_application
(
    app_guid               char(38)    DEFAULT 'gen_random_uuid()' NOT NULL,
    application_customcode varchar(15) DEFAULT 'NULL'::character varying,
    application_desc       varchar(50) DEFAULT 'NULL'::character varying,
    created_user           varchar(20) DEFAULT 'NULL'::character varying,
    created_date           timestamp   DEFAULT CURRENT_TIMESTAMP,
    status_id              integer     DEFAULT 1,
    vendor_id              integer,
    industry_oid           varchar(49),
    organization_guid       varchar(49),
    PRIMARY KEY (app_guid)
);

drop table if exists refdata_codeset;
CREATE TABLE refdata_codeset
(
    codesets_id        integer      DEFAULT nextval('refdata_codeset_seq'::regclass) NOT NULL,
    codeset_name       varchar(50)  DEFAULT 'NULL'::character varying,
    industry_std       varchar(6)   DEFAULT 'NULL'::character varying,
    status_id          integer      DEFAULT 1,
    created_date       timestamp    DEFAULT CURRENT_TIMESTAMP,
    created_user       varchar(20)  DEFAULT 'NULL'::character varying,
    codeset_guid       char(38)     DEFAULT 'NULL'::bpchar,
    field_mapping      varchar(40)  DEFAULT 'NULL'::character varying,
    sensitivityflag_id integer,
    externaltable_id   varchar(20)  DEFAULT 'NULL'::character varying,
    external_notes     varchar(149) DEFAULT 'NULL'::character varying,
    external_link      varchar(99)  DEFAULT 'NULL'::character varying,
    PRIMARY KEY (codesets_id)
);

drop table if exists efdata_countries;
CREATE TABLE refdata_countries
(
    country_id   integer     DEFAULT nextval('refdata_countries_seq'::regclass) NOT NULL,
    idd          varchar(5)  DEFAULT 'NULL'::character varying,
    country_name varchar(59) DEFAULT 'NULL'::character varying,
    created_date timestamp   DEFAULT CURRENT_TIMESTAMP,
    status_id    integer     DEFAULT 1,
    PRIMARY KEY (country_id)
);

drop table if exists refdata_devicetypes;
CREATE TABLE refdata_devicetypes
(
    devicetype_id integer   DEFAULT nextval('refdata_devicetypes_seq'::regclass) NOT NULL,
    devicetype    varchar(30),
    created_date  timestamp DEFAULT CURRENT_TIMESTAMP,
    status_id     integer   DEFAULT 1,
    PRIMARY KEY (devicetype_id)
);

drop table if exists refdata_industrystd_eventtypes;
CREATE TABLE refdata_industrystd_eventtypes
(
    eventtype_id    varchar(10) NOT NULL,
    eventtype_desc varchar(30) default 'NULL'::character varying,
    industry_std    varchar(6),
    created_date    timestamp   default CURRENT_TIMESTAMP,
    status_id       integer     default 1,
    PRIMARY KEY (eventtype_id)
);

drop table if exists refdata_industries;
CREATE TABLE refdata_industries
(
    industry_id   integer   DEFAULT nextval('refdata_industries_seq'::regclass) NOT NULL,
    industry_name varchar(45),
    created_date  timestamp DEFAULT CURRENT_TIMESTAMP,
    status_id     integer   DEFAULT 1,
    PRIMARY KEY (industry_id)
);

drop table if exists refdata_industriestobusiness;
CREATE TABLE refdata_industriestobusiness
(
    industrytobusiness_id integer   DEFAULT nextval('refdata_industriestobusiness_seq'::regclass) NOT NULL,
    industry_id           integer DEFAULT 1,
    business_area         varchar(50),
    created_date          timestamp DEFAULT CURRENT_TIMESTAMP,
    status_id             integer   DEFAULT 1,
    PRIMARY KEY (industrytobusiness_id)
);

drop table if exists refdata_industrystd;
CREATE TABLE refdata_industrystd
(
    industry_std     varchar(6) NOT NULL,
    industrystd_desc varchar(30) DEFAULT 'NULL'::character varying,
    created_date     timestamp   DEFAULT CURRENT_TIMESTAMP,
    status_id        integer     DEFAULT 1,
    PRIMARY KEY (industry_std)
);

drop table if exists refdata_legalentities;
CREATE TABLE refdata_legalentities
(
    legalentity_guid char(38)                              NOT NULL,
    location_name    varchar(50) DEFAULT 'NULL'::character varying,
    address          varchar(75) DEFAULT 'NULL'::character varying,
    city             varchar(60) DEFAULT 'NULL'::character varying,
    state_id         varchar(2)  DEFAULT 'NULL'::character varying,
    zipcode          varchar(12) DEFAULT 'NULL'::character varying,
    created_user     varchar(20) DEFAULT 'NULL'::character varying,
    status_id        integer     DEFAULT 1,
    created_date     timestamp   DEFAULT CURRENT_TIMESTAMP NOT NULL,
    location_url     varchar(99) DEFAULT 'NULL'::character varying,
    location_phone   varchar(12) DEFAULT 'NULL'::character varying,
    PRIMARY KEY (legalentity_guid)
);

drop table if exists refdata_operationtype;
CREATE TABLE refdata_operationtype
(
    operationtype_id   varchar(7) NOT NULL,
    operationtype_name varchar(60) DEFAULT 'NULL'::character varying,
    created_date       timestamp   DEFAULT CURRENT_TIMESTAMP,
    status_id          integer     DEFAULT 1,
    PRIMARY KEY (operationtype_id)
);

drop table if exists refdata_organization;
CREATE TABLE refdata_organization
(
    organization_guid          char(38)                              NOT NULL,
    organization_internal_code varchar(10) DEFAULT 'NULL'::character varying,
    organization_internal_id   varchar(10) DEFAULT 'NULL'::character varying,
    organization_name          varchar(50) DEFAULT 'NULL'::character varying,
    address                    varchar(75) DEFAULT 'NULL'::character varying,
    city                       varchar(60) DEFAULT 'NULL'::character varying,
    state_id                   varchar(2)  DEFAULT 'NULL'::character varying,
    zipcode                    varchar(12) DEFAULT 'NULL'::character varying,
    created_user               varchar(20) DEFAULT 'NULL'::character varying,
    status_id                  integer     DEFAULT 1,
    created_date               timestamp   DEFAULT CURRENT_TIMESTAMP NOT NULL,
    legalentity_guid           char(38) DEFAULT 'NULL'::character varying,
    PRIMARY KEY (organization_guid)
);

drop table if exists refdata_professiontypes;
CREATE TABLE refdata_professiontypes
(
    professiontype_id   integer     DEFAULT nextval('refdata_professiontypes_seq'::regclass) NOT NULL,
    professiontype_name varchar(65) DEFAULT 'NULL'::character varying,
    created_user        varchar(20) DEFAULT 'NULL'::character varying,
    created_date        timestamp   DEFAULT CURRENT_TIMESTAMP,
    status_id           integer     DEFAULT 1,
    PRIMARY KEY (professiontype_id)
);

drop table if exists refdata_regextypes;
CREATE TABLE refdata_regextypes
(
    regextype_id     integer   DEFAULT nextval('refdata_regextypes_seq'::regclass) NOT NULL,
    regextype_desc   varchar(69),
    created_date     timestamp DEFAULT CURRENT_TIMESTAMP,
    status_id        integer   DEFAULT 1,
    organization_guid  char(38)  DEFAULT 'NULL'::character varying,
    application_guid char(38)  DEFAULT 'NULL'::character varying,
    PRIMARY KEY (regextype_id)
);

drop table if exists refdata_rulesets;
CREATE TABLE refdata_rulesets
(
    rule_id        integer     DEFAULT nextval('refdata_rulesets_seq'::regclass) NOT NULL,
    rule_name      varchar(65) DEFAULT 'NULL'::character varying,
    created_user   varchar(20) DEFAULT 'NULL'::character varying,
    created_date   timestamp   DEFAULT CURRENT_TIMESTAMP,
    status_id      integer     DEFAULT 1,
    expiration_date timestamp,
    PRIMARY KEY (rule_id)
);

drop table if exists refdata_rulesetsdefinitions;
CREATE TABLE refdata_rulesetsdefinitions
(
    rulesetdefinitions_id   char(38) NOT NULL,
    rulesetdefinitions_name varchar(50) DEFAULT 'NULL'::character varying,
    ruleset_id              integer,
    steporder_id            integer,
    operationtype_id        varchar(7)  DEFAULT 'NULL'::character varying,
    ruleset_defvalue        char(40)    DEFAULT 'NULL'::bpchar,
    status_id               integer     DEFAULT 1,
    created_date            timestamp   DEFAULT CURRENT_TIMESTAMP,
    effective_date          timestamp,
    application_guid        char(38)    DEFAULT 'NULL'::character varying,
    term_date               timestamp,
    dataattribute_id        integer,
    PRIMARY KEY (rulesetdefinitions_id)
);

drop table if exists refdata_sensitivityflag;
CREATE TABLE refdata_sensitivityflag
(
    sensitiveflag_id   integer     DEFAULT nextval('refdata_sensitivityflag_seq'::regclass) NOT NULL,
    sensitiveflag_desc varchar(30) DEFAULT 'NULL'::character varying,
    created_date       timestamp   DEFAULT CURRENT_TIMESTAMP,
    status_id          integer     DEFAULT 1,
    PRIMARY KEY (sensitiveflag_id)
);

drop table if exists refdata_status;
CREATE TABLE refdata_status
(
    status_id          integer     DEFAULT nextval('refdata_status_seq'::regclass) NOT NULL,
    status_description varchar(45)                                                 NOT NULL,
    created_date       timestamp   DEFAULT CURRENT_TIMESTAMP,
    created_user       varchar(20) DEFAULT 'NULL'::character varying,
    PRIMARY KEY (status_id)
);

drop table if exists refdata_terminologystd;
CREATE TABLE refdata_terminologystd
(
    terminologystd_id      integer      DEFAULT nextval('refdata_terminologystd_seq'::regclass) NOT NULL,
    terminologystd         varchar(25)                                                          NOT NULL,
    terminologystd_version varchar(10)                                                          NOT NULL,
    terminologystd_desc    varchar(129) DEFAULT 'NULL'::character varying,
    created_date           timestamp    DEFAULT CURRENT_TIMESTAMP,
    status_id              integer      DEFAULT 1,
    PRIMARY KEY (terminologystd_id)
);

drop table if exists refdata_timezones;
CREATE TABLE refdata_timezones
(
    timezone_value varchar(3) NOT NULL,
    timezone_desc  varchar(25) DEFAULT 'NULL'::character varying,
    created_date   timestamp   DEFAULT CURRENT_TIMESTAMP,
    status_id      integer     DEFAULT 1,
    PRIMARY KEY (timezone_value)
);

drop table if exists refdata_usstates;
CREATE TABLE refdata_usstates
(
    state_id          varchar(2) NOT NULL,
    state_description varchar(65) DEFAULT 'NULL'::character varying,
    lattitude         varchar(12) DEFAULT 'NULL'::character varying,
    longitude         varchar(12) DEFAULT 'NULL'::character varying,
    created_date      timestamp   DEFAULT CURRENT_TIMESTAMP,
    status_id         integer     DEFAULT 1,
    created_user      varchar(20) DEFAULT 'NULL'::character varying,
    PRIMARY KEY (state_id)
);

drop table if exists refdata_vendor;
CREATE TABLE refdata_vendor
(
    vendor_id    integer     DEFAULT nextval('refdata_vendor_seq'::regclass) NOT NULL,
    vendor_name  varchar(50) DEFAULT 'NULL'::character varying,
    created_date timestamp   DEFAULT CURRENT_TIMESTAMP,
    status_id    integer     DEFAULT 1,
    created_user varchar(20) DEFAULT 'NULL'::character varying,
    vendor_guid  char(38)    DEFAULT 'NULL'::bpchar,
    PRIMARY KEY (vendor_id)
);

ALTER TABLE refdata_application
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_application
    ADD FOREIGN KEY (vendor_id)
        REFERENCES refdata_vendor (vendor_id);

ALTER TABLE refdata_application
    ADD FOREIGN KEY (organization_guid)
        REFERENCES refdata_organization (organization_guid);

ALTER TABLE refdata_codeset
    ADD FOREIGN KEY (industry_std)
        REFERENCES refdata_industrystd (industry_std);

ALTER TABLE refdata_codeset
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_codeset
    ADD FOREIGN KEY (sensitivityflag_id)
        REFERENCES refdata_sensitivityflag (sensitiveflag_id);

ALTER TABLE refdata_countries
    ADD FOREIGN KEY  (status_id)
        REFERENCES refdata_status(status_id)

ALTER TABLE refdata_devicetypes
    ADD FOREIGN KEY  (status_id)
        REFERENCES refdata_status(status_id)

ALTER TABLE refdata_industrystd_eventtypes
    ADD FOREIGN KEY  (status_id)
        REFERENCES refdata_status(status_id)

ALTER TABLE refdata_industrystd_eventtypes
    ADD FOREIGN KEY  (industry_std)
        REFERENCES refdata_industrystd(industry_std)

ALTER TABLE refdata_industries
    ADD FOREIGN KEY  (status_id)
        REFERENCES refdata_status(status_id)

ALTER TABLE refdata_industriestobusiness
    ADD FOREIGN KEY  (status_id)
        REFERENCES refdata_status(status_id)

ALTER TABLE refdata_industriestobusiness
    ADD FOREIGN KEY  (industry_id)
        REFERENCES refdata_industries(industry_id)

ALTER TABLE refdata_industrystd
    ADD FOREIGN KEY  (status_id)
        REFERENCES refdata_status(status_id)

ALTER TABLE refdata_legalentities
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_legalentities
    ADD FOREIGN KEY (state_id)
        REFERENCES refdata_usstates (state_id);

ALTER TABLE refdata_organization
    ADD FOREIGN KEY (legalentity_guid)
        REFERENCES refdata_legalentities (legalentity_guid);

ALTER TABLE refdata_organization
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_organization
    ADD FOREIGN KEY (state_id)
        REFERENCES refdata_usstates (state_id);

ALTER TABLE refdata_professiontypes
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_regextypes
    ADD FOREIGN KEY (application_guid)
        REFERENCES refdata_application (app_guid);

ALTER TABLE refdata_regextypes
    ADD FOREIGN KEY (organization_guid)
        REFERENCES refdata_organization (organization_guid);

ALTER TABLE refdata_regextypes
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_rulesets
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_rulesetsdefinitions
    ADD FOREIGN KEY (application_guid)
        REFERENCES refdata_application (app_guid);

ALTER TABLE refdata_rulesetsdefinitions
    ADD FOREIGN KEY (ruleset_id)
        REFERENCES refdata_rulesets (rule_id);

ALTER TABLE refdata_rulesetsdefinitions
    ADD FOREIGN KEY (dataattribute_id)
        REFERENCES platform_dataattributes (platform_dataattributes_id);

ALTER TABLE refdata_rulesetsdefinitions
    ADD FOREIGN KEY (operationtype_id)
        REFERENCES refdata_operationtype (operationtype_id);

ALTER TABLE refdata_rulesetsdefinitions
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_sensitivityflag
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_terminologystd
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_timezones
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_usstates
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_vendor
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

-- Datamodel
drop table if exists datamodel_apis;
CREATE TABLE datamodel_apis
(
    api_id             integer   DEFAULT nextval('apis_seq'::regclass) NOT NULL,
    technology         varchar(30),
    dataattributes_id  integer,
    baseurllocation    varchar(99),
    apiname            varchar(79),
    created_date       timestamp DEFAULT CURRENT_TIMESTAMP,
    status_id          integer   DEFAULT 1,
    purpose            varchar(49),
    datmodel_tablename varchar(99),
    apiparams          varchar(59),
    apiexample         varchar(149),
    PRIMARY KEY (api_id)
);

ALTER TABLE datamodel_apis
    ADD FOREIGN KEY (status_id)

drop table if exists datamodel_domain;
CREATE TABLE datamodel_domain
(
    domainname        varchar(64) NOT NULL,
    domaininformation varchar(249) DEFAULT 'NULL'::character varying,
    status_id         integer      DEFAULT 1,
    created_date      timestamp    DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (domainname)
);

ALTER TABLE datamodel_domain
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

drop table if exists datamodel_datatables;
CREATE TABLE datamodel_datatables
(
    tablename        varchar(64) NOT NULL,
    tableinformation varchar(249) DEFAULT 'NULL'::character varying,
    status_id        integer      DEFAULT 1,
    created_date     timestamp    DEFAULT CURRENT_TIMESTAMP,
    datadomain       varchar(64),
    PRIMARY KEY (tablename)
);

ALTER TABLE datamodel_datatables
    ADD FOREIGN KEY (datadomain)
        REFERENCES datamodel_domain (domainname);

ALTER TABLE datamodel_datatables
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

-- DataTier
drop table if exists datatier_crawler;
CREATE TABLE datatier_crawler
(
    datacrawler_id      integer     DEFAULT nextval('datatier_crawler_seq'::regclass) NOT NULL,
    token               char(128)   DEFAULT 'NULL'::character varying,
    crawledtext_details text        DEFAULT 'NULL'::character varying,
    created_date        timestamp   DEFAULT CURRENT_TIMESTAMP,
    status_id           integer     DEFAULT 1,
    registeredapp_guid      char(38) DEFAULT 'NULL'::character varying,
    organization_guid   char(38) DEFAULT 'NULL'::character varying,
    PRIMARY KEY (datacrawler_id)
);

ALTER TABLE datatier_crawler
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE datatier_crawler
    ADD FOREIGN KEY (registeredapp_guid)
        REFERENCES refdata_application (app_guid);

ALTER TABLE datatier_crawler
    ADD FOREIGN KEY (organization_guid)
        REFERENCES refdata_organization (organization_guid);

drop table if exists datatier_sdp_dataattributes;
create table datatier_sdp_dataattributes
(
    datatier_id      integer default nextval('datatier_sdp_dataattribute_seq'::regclass) not null primary key,
    basevalue        varchar(99),
    supportingvalue1 varchar(169),
    supportingvalue2 varchar(50),
    supportingvalue3 varchar(50),
    supportingvalue4 varchar(50),
    supportingvalue5 varchar(50),
    supportingvalue6 varchar(50),
    supportingvalue7 varchar(50),
    created_date     timestamp,
    status_id        integer,
    dataattribute_id integer,
    created_user     varchar(20),
    registeredapp_guid   char(38),
    datagentype_id   integer
);

ALTER TABLE datatier_sdp_dataattributes
    ADD FOREIGN KEY (registeredapp_guid)
        REFERENCES refdata_application (app_guid);

ALTER TABLE datatier_sdp_dataattributes
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE datatier_sdp_dataattributes
    ADD FOREIGN KEY (dataattribute_id)
        REFERENCES platform_dataattributes (platform_dataattributes_id);

ALTER TABLE datatier_sdp_dataattributes
    ADD FOREIGN KEY (datagentype_id)
        REFERENCES platform_datageneration_dataattributes (datagentype_id);

drop table if exists datatier_sdp_datastructures;
CREATE TABLE datatier_sdp_datastructures
(
    datastructure_core_id  integer     DEFAULT nextval('datatier_sdp_datastructure_seq'::regclass) NOT NULL,
    datastructure_name    varchar(29) DEFAULT 'NULL'::character varying,
    datastructure_details text        DEFAULT 'NULL'::character varying,
    created_date          timestamp   DEFAULT CURRENT_TIMESTAMP,
    status_id             integer     DEFAULT 1,
    registeredapp_guid        char(38) DEFAULT 'NULL'::character varying,
    PRIMARY KEY (datastructure_core_id)
);

ALTER TABLE datatier_sdp_datastructures
    ADD FOREIGN KEY (registeredapp_guid)
        REFERENCES refdata_application (app_guid);

ALTER TABLE datatier_sdp_datastructures
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

drop table if exists datatier_tokens;
CREATE TABLE datatier_tokens
(
    datatoken_id      integer     DEFAULT nextval('datatier_tokens_seq'::regclass) NOT NULL,
    token             char(128)   DEFAULT 'NULL'::character varying,
    created_date      timestamp   DEFAULT CURRENT_TIMESTAMP,
    status_id         integer     DEFAULT 1,
    registeredapp_guid    char(38) DEFAULT 'NULL'::character varying,
    organization_guid char(38) DEFAULT 'NULL'::character varying,
    intfc_type        varchar(10) DEFAULT 'API',
    datasource_id     integer,
    PRIMARY KEY (datatoken_id)
);

ALTER TABLE datatier_tokens
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE datatier_tokens
    ADD FOREIGN KEY (registeredapp_guid)
        REFERENCES refdata_application (app_guid);

ALTER TABLE datatier_tokens
    ADD FOREIGN KEY (organization_guid)
        REFERENCES refdata_organization (organization_guid);

ALTER TABLE datatier_tokens
    ADD FOREIGN KEY (datasource_id)
        REFERENCES platform_datasources (datasource_id);


-- Start Here
-- Move Platform right below refdata

drop table if exists platform_codesets;
CREATE TABLE platform_codesets
(
    codeset_id  integer      DEFAULT nextval('platform_codesets_seq'::regclass) NOT NULL,
    application_guid      CHAR(38),
    organization_guid      CHAR(38),
    created_date        timestamp    DEFAULT CURRENT_TIMESTAMP,
    status_id           integer      DEFAULT 1,
    created_user        varchar(20)  DEFAULT 'NULL'::character varying,
    originalcode_value  varchar(40),
    originalcode_desc   varchar(149),
    PRIMARY KEY (codeset_id)
);

drop table if exists platform_codesets_industrystd;
CREATE TABLE platform_codesets_industrystd
(
    termcodeset_id    integer      DEFAULT nextval('platform_codeset_industrystd_seq'::regclass) NOT NULL,
    codesets_id       integer                                                                 NOT NULL,
    created_date      timestamp    DEFAULT CURRENT_TIMESTAMP,
    status_id         integer      DEFAULT 1,
    code_value         varchar(20)  DEFAULT 'NULL'::character varying,
    code_desc          varchar(129) DEFAULT 'NULL'::character varying,
    industry_std      varchar(6)   DEFAULT 'UNDF'::character varying,
    terminologystd_id integer,
    PRIMARY KEY (termcodeset_id)
);

drop table if exists platform_codesets_xmap;
CREATE TABLE platform_codesets_xmap
(
    codesetcrossmap_id  integer      DEFAULT nextval('platform_codesets_xmaps_seq'::regclass) NOT NULL,
    implcodesets_id     integer                                                                 NOT NULL,
    application_guid      CHAR(38),
    organization_guid      CHAR(38),
    terminologystd_to   integer,
    created_date        timestamp    DEFAULT CURRENT_TIMESTAMP,
    status_id           integer      DEFAULT 1,
    created_user        varchar(20)  DEFAULT 'NULL'::character varying,
    transformcode_value varchar(40)  DEFAULT 'NULL'::character varying,
    transformcode_desc  varchar(129) DEFAULT 'NULL'::character varying,
    originalcode_value  varchar(40),
    originalcode_desc   varchar(40),
    PRIMARY KEY (codesetcrossmap_id)
);

drop table if exists platform_dataattributes;
CREATE TABLE platform_dataattributes
(
    platform_dataattributes_id  integer     DEFAULT nextval('platform_dataattributes_seq'::regclass) NOT NULL,
    dataattribute_name         varchar(50) DEFAULT 'NULL'::character varying,
    sensitivityflag_id         integer,
    created_date               timestamp   DEFAULT CURRENT_TIMESTAMP,
    status_id                  integer     DEFAULT 1,
    created_user               varchar(20) DEFAULT 'NULL'::character varying,
    platform_dataattribute_guid char(38)    DEFAULT 'NULL'::bpchar,
    registeredapp_guid             char(38)    DEFAULT 'NULL'::character varying,
    attribute_type              varchar(10) DEFAULT 'NULL'::character varying,
    PRIMARY KEY (platform_dataattributes_id)
);

drop table if exists platform_datageneration_dataattributes;
CREATE TABLE platform_datageneration_dataattributes
(
    datagentype_id          integer      DEFAULT nextval('platform_datageneration_seq'::regclass) NOT NULL,
    datagentype_description varchar(65)  DEFAULT 'NULL'::character varying,
    definition              varchar(255) DEFAULT 'NULL'::character varying,
    dataattribute_id        integer,
    created_date            timestamp    DEFAULT CURRENT_TIMESTAMP,
    status_id               integer      DEFAULT 1,
    created_user            varchar(20)  DEFAULT 'NULL'::character varying,
    quantity                integer,
    maxrecordsinsource      integer,
    registeredapp_guid          char(38)     DEFAULT 'NULL'::character varying,
    organization_guid       char(38)     DEFAULT 'NULL'::character varying,
    PRIMARY KEY (datagentype_id)
);

drop table if exists platform_databuilding_dataattributes;
CREATE TABLE platform_databuilding_dataattributes
(
    databuild_dataattribute_id          integer      DEFAULT nextval('platform_databuilding_dataattributes_seq'::regclass) NOT NULL,
    databuild_description varchar(65)  DEFAULT 'NULL'::character varying,
    definition              varchar(255) DEFAULT 'NULL'::character varying,
    platform_dataattributes_id        integer,
    created_date            timestamp    DEFAULT CURRENT_TIMESTAMP,
    status_id               integer      DEFAULT 1,
    created_user            varchar(20)  DEFAULT 'NULL'::character varying,
    quantity                integer,
    maxrecordsinsource      integer,
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

drop table if exists platform_databuilding_datastructures;
CREATE TABLE platform_databuilding_datastructures
(
    datagentype_datastructures_id          integer      DEFAULT nextval('platform_databuilding_datastructures_seq'::regclass) NOT NULL,
    datagentype_description varchar(65)  DEFAULT 'NULL'::character varying,
    definition              varchar(255) DEFAULT 'NULL'::character varying,
    platform_datastructures_id        integer,
    created_date            timestamp    DEFAULT CURRENT_TIMESTAMP,
    status_id               integer      DEFAULT 1,
    created_user            varchar(20)  DEFAULT 'NULL'::character varying,
    quantity                integer,
    maxrecordsinsource      integer,
    registeredapp_guid          char(38)     DEFAULT 'NULL'::character varying,
    organization_guid       char(38)     DEFAULT 'NULL'::character varying,
    PRIMARY KEY (datagentype_datastructures_id)
);

drop table if exists platform_datasources;
create table platform_datasources
(
    platform_datasources_id integer     default nextval('platform_datasources_seq'::regclass) not null,
    datasource_name        varchar(50) default 'NULL'::character varying,
    datasource_type        varchar(10),
    created_date           timestamp   default CURRENT_TIMESTAMP,
    status_id              integer     default 1,
    created_user           varchar(20) default 'NULL'::character varying,
    organization_guid      char(38)    DEFAULT 'NULL'::character varying,
    registeredapp_guid         char(38)    DEFAULT 'NULL'::character varying,
    PRIMARY KEY (platform_datasources_id)
);

drop table if exists platform_datastructures;
create table platform_datastructures
(
    platform_datastructures_id   integer     default nextval('platform_datastructures_seq'::regclass) not null,
    datastructure_name          varchar(50) default 'NULL'::character varying,
    sensitivityflag_id          integer,
    created_date                timestamp   default CURRENT_TIMESTAMP,
    status_id                   integer     default 1,
    created_user                varchar(20) default 'NULL'::character varying,
    platform_datastructures_guid char(38)    default 'gen_random_uuid()'::bpchar,
    registeredapp_guid              char(38)    DEFAULT 'NULL'::character varying,
    PRIMARY KEY (platform_datastructures_id)
);

drop table if exists platform_datastructures_dtl;
CREATE TABLE platform_datastructures_dtl
(
    platform_datastructuresdtl_id                  integer     DEFAULT nextval('platform_datastructures_seq'::regclass) NOT NULL,
    platform_datastructures_id                     integer,
    composite_datastructure_name                   varchar(50) DEFAULT 'NULL'::character varying,
    sensitivityflag_id                            integer     DEFAULT 1,
    created_date                                  timestamp   DEFAULT CURRENT_TIMESTAMP,
    status_id                                     integer     DEFAULT 1,
    created_user                                  varchar(20) DEFAULT 'NULL'::character varying,
    platform_datastructures_to_dataattributes_guid char(38)    DEFAULT 'NULL'::bpchar,
    registeredapp_guid                                char(38)    DEFAULT 'NULL'::bpchar,
    platform_dataattributes_id                     integer,
    PRIMARY KEY (platform_datastructuresdtl_id)
);

drop table if exists platform_xmap_tokens_attributes_dtl;
CREATE TABLE platform_xmap_tokens_attributes_dtl
(
    platform_xmap_tokens_attributesdtl_id integer      DEFAULT nextval('platform_xmap_tokens_dataattributes_seq'::regclass) NOT NULL,
    platform_datastructures_id          integer,
    xmap_details                       varchar(149) DEFAULT 'NULL'::character varying,
    dataattribute_id                   integer      DEFAULT 1,
    fieldorder_id                      integer      DEFAULT 1,
    created_date                       timestamp    DEFAULT CURRENT_TIMESTAMP,
    status_id                          integer      DEFAULT 1,
    created_user                       varchar(20)  DEFAULT 'NULL'::character varying,
    registeredapp_guid                     char(38)     DEFAULT 'NULL'::bpchar,
    organization_guid                  char(38)     default NULL::bpchar,
    PRIMARY KEY (platform_xmap_tokens_attributesdtl_id)
);





ALTER TABLE platform_datastructures
    ADD FOREIGN KEY (sensitivityflag_id)
        REFERENCES refdata_sensitivityflag (sensitiveflag_id);

ALTER TABLE platform_datastructures
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE platform_datageneration_dataattributes
    ADD FOREIGN KEY (registeredapp_guid)
        REFERENCES refdata_application (app_guid);

ALTER TABLE platform_datageneration_dataattributes
    ADD FOREIGN KEY (organization_guid)
        REFERENCES refdata_organization (organization_guid);

ALTER TABLE platform_datageneration_dataattributes
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE platform_databuilding_dataattributes
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE platform_databuilding_dataattributes
    ADD FOREIGN KEY (registeredapp_guid)
        REFERENCES refdata_application (app_guid);

ALTER TABLE platform_databuilding_dataattributes
    ADD FOREIGN KEY (organization_guid)
        REFERENCES refdata_organization (organization_guid);

ALTER TABLE platform_databuilding_datastructures
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE platform_databuilding_datastructures
    ADD FOREIGN KEY (registeredapp_guid)
        REFERENCES refdata_application (app_guid);

ALTER TABLE platform_databuilding_datastructures
    ADD FOREIGN KEY (organization_guid)
        REFERENCES refdata_organization (organization_guid);

ALTER TABLE platform_codesets_xmap
    ADD FOREIGN KEY (implcodesets_id)
        REFERENCES refdata_codeset (codesets_id);

ALTER TABLE platform_codesets_xmap
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE platform_codesets_xmap
    ADD FOREIGN KEY (terminologystd_to)
        REFERENCES refdata_terminologystd (terminologystd_id);

ALTER TABLE platform_codeset_industrystd
    ADD FOREIGN KEY (codesets_id)
        REFERENCES refdata_codeset (codesets_id);

ALTER TABLE platform_codeset_industrystd
    ADD FOREIGN KEY (industry_std)
        REFERENCES refdata_industrystd (industry_std);

ALTER TABLE platform_codeset_industrystd
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE platform_codeset_industrystd
    ADD FOREIGN KEY (terminologystd_id)
        REFERENCES refdata_terminologystd (terminologystd_id);

ALTER TABLE platform_datageneration
    ADD FOREIGN KEY (dataattribute_id)
        REFERENCES platform_dataattributes (platform_dataattributes_id);

ALTER TABLE platform_datageneration
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE platform_datasources
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE platform_xmap_tokens_attributes_dtl
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

-- Indexes
create index if not exists datatier_sdp_dataattributes_index
    on datatier_sdp_dataattributes (datatier_id, basevalue, supportingvalue1, supportingvalue2, supportingvalue3, supportingvalue4,
                                    supportingvalue5, supportingvalue6, supportingvalue7, created_date, dataattribute_id,
                                    datagentype_id, status_id, created_user, registeredapp_guid);

CREATE INDEX terms_codeset_industrystd_index ON terms_codeset_industrystd USING btree (termcodeset_id, codesets_id, created_date, status_id, code_value, code_desc, industry_std);

CREATE UNIQUE INDEX terms_codeset_industrystd_uindex ON terms_codeset_industrystd USING btree (codesets_id, code_value, code_desc, industry_std);
