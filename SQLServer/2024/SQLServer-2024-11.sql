drop table if exists datatier_crawler;
CREATE TABLE datatier_crawler
(
    datacrawler_id      INT IDENTITY(1,1) NOT NULL,
    token               char(128),
    crawledtext_details text,
    created_date        datetime DEFAULT (GETUTCDATE()),
    status_id           int      DEFAULT 1,
    registeredapp_guid  char(38),
    organization_guid   char(38),
    PRIMARY KEY (datacrawler_id)
);

drop table if exists datatier_sdp_dataattributes;
CREATE TABLE datatier_sdp_dataattributes
(
    datatier_id        INT IDENTITY(1,1) NOT NULL,
    basevalue          varchar(99),
    supportingvalue1   varchar(169),
    supportingvalue2   varchar(50),
    supportingvalue3   varchar(50),
    supportingvalue4   varchar(50),
    supportingvalue5   varchar(50),
    supportingvalue6   varchar(50),
    supportingvalue7   varchar(50),
    created_date       datetime DEFAULT (GETUTCDATE()),
    status_id          INT      default 1,
    dataattribute_id   INT,
    created_user        varchar(20),
    registeredapp_guid char(38),
    datagentype_id     INT,
    PRIMARY KEY (datatier_id)
);

drop table if exists datatier_sdp_datastructures;
CREATE TABLE datatier_sdp_datastructures
(
    datastructure_core_id INT IDENTITY(1,1) NOT NULL,
    datastructure_name    varchar(29),
    datastructure_details text,
    created_date          datetime DEFAULT (GETUTCDATE()),
    status_id             INT      default 1,
    registeredapp_guid    char(38),
    PRIMARY KEY (datastructure_core_id)
);

DROP TABLE if exists datatier_tokens;
CREATE TABLE datatier_tokens
(
    datatoken_id       INT IDENTITY(1,1) NOT NULL,
    token              char(128),
    created_date       datetime    DEFAULT (GETUTCDATE()),
    status_id          INT         DEFAULT 1,
    registeredapp_guid char(38),
    organization_guid  char(38),
    intfc_type         varchar(10) DEFAULT 'API',
    datasource_id      INT,
    PRIMARY KEY (datatoken_id)
);

drop table if exists datamodel_apis;
CREATE TABLE datamodel_apis
(
    api_id             INT IDENTITY(1,1) NOT NULL,
    technology         varchar(30),
    dataattributes_id  INT,
    baseurllocation    varchar(99),
    apiname            varchar(79),
    created_date       datetime DEFAULT (GETUTCDATE()),
    status_id          INT      default 1,
    purpose            varchar(49),
    datmodel_tablename varchar(99),
    apiparams          varchar(59),
    apiexample         varchar(149),
    PRIMARY KEY (api_id)
);

drop TABLE if exists datamodel_datatables;
CREATE TABLE datamodel_datatables
(
    tablename        varchar(64) NOT NULL,
    tableinformation varchar(249),
    status_id        INT      default 1,
    created_date     datetime DEFAULT (GETUTCDATE()),
    datadomain       varchar(64),
    PRIMARY KEY (tablename)
);

drop table if exists datamodel_domain;
CREATE TABLE datamodel_domain
(
    domainname        varchar(64) NOT NULL,
    domaininformation varchar(249),
    status_id         INT      default 1,
    created_date      datetime DEFAULT (GETUTCDATE()),
    PRIMARY KEY (domainname)
);

drop table if exists platform_codesets_crossmaps;
CREATE TABLE platform_codesets_crossmaps
(
    codesetcrossmap_id  INT IDENTITY(1,1) NOT NULL,
    implcodesets_id     INT NOT NULL,
    application_guid    CHAR(38),
    organization_guid   CHAR(38),
    terminologystd_to   int,
    created_date        datetime DEFAULT (GETUTCDATE()),
    status_id           INT      default 1,
    created_user        varchar(20),
    transformcode_value varchar(40),
    transformcode_desc  varchar(129),
    originalcode_value  varchar(40),
    originalcode_desc   varchar(40),
    PRIMARY KEY (codesetcrossmap_id)
);

drop table if exists platform_dataattributes;
CREATE TABLE platform_dataattributes
(
    platform_dataattributes_id INT IDENTITY(1,1) NOT NULL,
    dataattribute_name          varchar(50),
    sensitivityflag_id         INT,
    created_date               datetime DEFAULT (GETUTCDATE()),
    status_id                  INT      default 1,
    createduser                varchar(20),
    platform_dataattribute_guid char(38),
    registeredapp_guid         char(38),
    platform_tablename         char(38),
    attribute_type             varchar(10),
    PRIMARY KEY (platform_dataattributes_id)
);

drop table if exists platform_datageneration;
CREATE TABLE platform_datageneration
(
    datagentype_id         INT IDENTITY(1,1) NOT NULL,
    datagentype_description varchar(65),
    definition             varchar(255),
    dataattribute_id       INT,
    created_date           datetime DEFAULT (GETUTCDATE()),
    status_id              INT      default 1,
    createduser            varchar(20),
    quantity               int,
    maxrecordsinsource     int,
    registeredapp_guid     char(38),
    organization_guid      char(38),
    PRIMARY KEY (datagentype_id)
);

drop table if exists platform_datasources;
create table platform_datasources
(
    platform_datasources_id INT IDENTITY(1,1) NOT NULL,
    datasource_name         varchar(50),
    datasource_type         varchar(10),
    created_date            datetime DEFAULT (GETUTCDATE()),
    status_id               INT      default 1,
    created_user            varchar(20),
    organization_guid       char(38),
    registeredapp_guid      char(38),
    PRIMARY KEY (platform_datasources_id)
);

drop table if exists platform_datastructures;
CREATE TABLE platform_datastructures
(
    platform_datastructures_id   INT IDENTITY(1,1) NOT NULL,
    datastructure_name           varchar(50),
    sensitivityflag_id           INT,
    created_date                 datetime DEFAULT (GETUTCDATE()),
    status_id                    INT      default 1,
    created_user                 varchar(20),
    platform_datastructures_guid char(38),
    registeredapp_guid           char(38),
    PRIMARY KEY (platform_datastructures_id)
);

drop table if exists platform_datastructures_dtl;
CREATE TABLE platform_datastructures_dtl
(
    platform_datastructuresdtl_id                  INT IDENTITY(1,1) NOT NULL,
    platform_datastructures_id                     INT,
    composite_datastructure_name                   varchar(50),
    sensitivityflag_id                             INT,
    created_date                                   datetime DEFAULT (GETUTCDATE()),
    status_id                                      INT      default 1,
    createduser                                    varchar(20),
    platform_datastructures_to_dataattributes_guid char(38),
    registeredapp_guid                             char(38),
    platform_dataattributes_id                     INT,
    PRIMARY KEY (platform_datastructuresdtl_id)
);


DROP TABLE if exists platform_xmap_tokens_attributes_dtl;
CREATE TABLE platform_xmap_tokens_attributes_dtl
(
    platform_xmap_tokensattributesdtl_id INT IDENTITY(1,1) NOT NULL,
    platform_datastructures_id           int,
    xmap_details                         varchar(149),
    dataattribute_id                     int      DEFAULT 1,
    fieldorder_id                        int      DEFAULT 1,
    created_date                         datetime DEFAULT (GETUTCDATE()),
    status_id                            int      DEFAULT 1,
    created_user                         varchar(20),
    registeredapp_guid                   char(38),
    organization_guid                    char(38),
    PRIMARY KEY (platform_xmap_tokensattributesdtl_id)
);

drop table if exists refdata_application;
CREATE TABLE refdata_application
(
    app_guid               char(38) NOT NULL,
    application_customcode varchar(15),
    application_desc       varchar(50),
    created_user           varchar(20),
    created_date           datetime DEFAULT (GETUTCDATE()),
    status_id              INT      default 1,
    vendor_id              INT,
    industry_oid           varchar(49),
    organization_uid       varchar(49),
    PRIMARY KEY (app_guid)
);

drop table if exists refdata_codeset;
CREATE TABLE refdata_codeset
(
    codesets_id        INT IDENTITY(1,1) NOT NULL,
    codeset_name       varchar(50),
    industry_std       varchar(6),
    status_id          INT      default 1,
    created_date       datetime DEFAULT (GETUTCDATE()),
    created_user       varchar(20),
    codeset_guid       char(38),
    field_mapping      varchar(40),
    sensitivityflag_id INT,
    externaltable_id   varchar(20),
    external_notes     varchar(149),
    external_link      varchar(99),
    PRIMARY KEY (codesets_id)
);

drop table if exists refdata_countries;
CREATE TABLE refdata_countries
(
    country_id   INT IDENTITY(1,1) NOT NULL,
    idd          varchar(5),
    country_name varchar(59),
    created_date datetime DEFAULT (GETUTCDATE()),
    status_id    INT      default 1,
    PRIMARY KEY (country_id)
);

drop table if exists refdata_devicetypes;
CREATE TABLE refdata_devicetypes
(
    devicetype_id INT IDENTITY(1,1) NOT NULL,
    devicetype    varchar(30),
    created_date  datetime DEFAULT (GETUTCDATE()),
    status_id     INT      default 1,
    PRIMARY KEY (devicetype_id)
);

drop table if exists refdata_industries;
CREATE TABLE refdata_industries
(
    industry_id   INT IDENTITY(1,1) NOT NULL,
    industry_name varchar(45),
    created_date  datetime DEFAULT (GETUTCDATE()),
    status_id     INT      default 1,
    PRIMARY KEY (industry_id)
);

drop table if exists refdata_industriestobusiness;
CREATE TABLE refdata_industriestobusiness
(
    industrytobusiness_id INT IDENTITY(1,1) NOT NULL,
    industry_id           INT,
    business_area          varchar(50),
    created_date          datetime DEFAULT (GETUTCDATE()),
    status_id             INT      default 1,
    PRIMARY KEY (industrytobusiness_id)
);

drop table if exists refdata_industrystd;
CREATE TABLE refdata_industrystd
(
    industry_std     varchar(6) NOT NULL,
    industrystd_desc varchar(30),
    created_date     datetime DEFAULT (GETUTCDATE()),
    status_id        INT      default 1,
    PRIMARY KEY (industry_std)
);

drop table if exists refdata_industrystd_eventtypes;
CREATE TABLE refdata_industrystd_eventtypes
(
    eventtype_id     varchar(10) NOT NULL,
    eventtype_desc varchar(30),
    industry_std     varchar(6),
    created_date    datetime DEFAULT (GETUTCDATE()),
    status_id       INT      default 1,
    PRIMARY KEY (eventtype_id)
);

drop table if exists refdata_legalentities;
CREATE TABLE refdata_legalentities
(
    legalentity_guid char(38) NOT NULL,
    location_name    varchar(50),
    address          varchar(75),
    city             varchar(60),
    state_id         varchar(2),
    zipcode          varchar(12),
    created_user     varchar(20),
    status_id        INT      default 1,
    created_date     datetime DEFAULT (GETUTCDATE()),
    location_url     varchar(99),
    location_phone   varchar(12),
    PRIMARY KEY (legalentity_guid)
);

drop table if exists refdata_operationtype;
CREATE TABLE refdata_operationtype
(
    operationtype_id   varchar(7) NOT NULL,
    operationtype_name varchar(60),
    created_date       datetime DEFAULT (GETUTCDATE()),
    status_id          INT      default 1,
    PRIMARY KEY (operationtype_id)
);

drop table if exists refdata_organization;
CREATE TABLE refdata_organization
(
    organization_guid          char(38) NOT NULL,
    organization_internal_code varchar(10),
    organization_internal_id   varchar(10),
    organization_name          varchar(50),
    address                    varchar(75),
    city                       varchar(60),
    state_id                   varchar(2),
    zipcode                    varchar(12),
    created_user               varchar(20),
    status_id                  INT      default 1,
    created_date               datetime DEFAULT (GETUTCDATE()),
    legalentity_guid           char(38),
    PRIMARY KEY (organization_guid)
);

drop table if exists refdata_professsiontypes;
CREATE TABLE refdata_professiontypes
(
    professiontype_id  INT IDENTITY(1,1) NOT NULL,
    professiontypename varchar(65),
    createduser        varchar(20),
    created_date       datetime DEFAULT (GETUTCDATE()),
    status_id          INT      default 1,
    PRIMARY KEY (professiontype_id)
);

drop table if exists refdata_regextypes;
CREATE TABLE refdata_regextypes
(
    implregextype_id INT IDENTITY(1,1) NOT NULL,
    regextypedesc    varchar(69),
    created_date     datetime DEFAULT (GETUTCDATE()),
    status_id        INT      default 1,
    organizationid   char(38),
    applicationid    char(38),
    PRIMARY KEY (implregextype_id)
);

drop table if exists refdata_rulesets;
CREATE TABLE refdata_rulesets
(
    rule_id        INT IDENTITY(1,1) NOT NULL,
    rule_name      varchar(65),
    created_user   varchar(20),
    created_date   datetime DEFAULT (GETUTCDATE()),
    status_id      INT      default 1,
    expirationdate datetime,
    PRIMARY KEY (rule_id)
);

drop table if exists refdata_rulesetsdefinitions;
CREATE TABLE refdata_rulesetsdefinitions
(
    rulesetdefinitions_id  char(38) NOT NULL,
    rulesetdefinition_name varchar(50),
    ruleset_id             INT,
    steporder_id           INT,
    operationtype_id       varchar(7),
    ruleset_defvalue       char(40),
    status_id              INT      default 1,
    created_date           datetime DEFAULT (GETUTCDATE()),
    effective_date         datetime,
    application_guid       char(38),
    term_date              datetime,
    dataattribute_id       INT,
    PRIMARY KEY (rulesetdefinitions_id)
);

drop table if exists refdata_sensitivityflag;
CREATE TABLE refdata_sensitivityflag
(
    sensitiveflag_id   INT IDENTITY(1,1) NOT NULL,
    sensitiveflag_desc varchar(30),
    created_date       datetime DEFAULT (GETUTCDATE()),
    status_id          INT      default 1,
    PRIMARY KEY (sensitiveflag_id)
);

drop table if exists refdata_status;
CREATE TABLE refdata_status
(
    status_id          INT IDENTITY(1,1) NOT NULL,
    status_description varchar(45) NOT NULL,
    created_date       datetime,
    created_user       varchar(20),
    PRIMARY KEY (status_id)
);

drop table if exists refdata_terminologystd;
CREATE TABLE refdata_terminologystd
(
    terminologystd_id      INT IDENTITY(1,1) NOT NULL,
    terminologystd         varchar(25) NOT NULL,
    terminologystd_version varchar(10) NOT NULL,
    terminologystd_desc    varchar(129),
    created_date           datetime DEFAULT (GETUTCDATE()),
    status_id              INT      default 1,
    PRIMARY KEY (terminologystd_id)
);

drop table if exists refdata_timezones;
CREATE TABLE refdata_timezones
(
    timezone_value varchar(3) NOT NULL,
    timezone_desc  varchar(25),
    created_date   datetime DEFAULT (GETUTCDATE()),
    status_id      INT      default 1,
    PRIMARY KEY (timezone_value)
);

drop table if exists refdata_usstates;
CREATE TABLE refdata_usstates
(
    state_id          varchar(2) NOT NULL,
    state_description varchar(65),
    lattitude         varchar(12),
    longitude         varchar(12),
    created_date      datetime DEFAULT (GETUTCDATE()),
    status_id         INT      default 1,
    created_user      varchar(20),
    PRIMARY KEY (state_id)
);

drop table if exists refdata_vendor;
CREATE TABLE refdata_vendor
(
    vendor_id    INT IDENTITY(1,1) NOT NULL,
    vendor_name   varchar(50),
    created_date datetime DEFAULT (GETUTCDATE()),
    status_id    INT      default 1,
    created_user  varchar(20),
    vendor_guid  char(38),
    PRIMARY KEY (vendor_id)
);

drop table if exists terms_codeset_industrystd;
CREATE TABLE terms_codeset_industrystd
(
    termcodeset_id    INT IDENTITY(1,1) NOT NULL,
    codesets_id       INT NOT NULL,
    created_date      datetime DEFAULT (GETUTCDATE()),
    status_id         INT      default 1,
    code_value        varchar(20),
    code_desc         varchar(129),
    industry_std      varchar(6),
    terminologystd_id INT,
    PRIMARY KEY (termcodeset_id)
);

ALTER TABLE datamodel_apis
    ADD FOREIGN KEY (dataattributes_id)
        REFERENCES platform_dataattributes (platform_dataattributes_id);


ALTER TABLE datamodel_datatables
    ADD FOREIGN KEY (datadomain)
        REFERENCES datamodel_domain (domainname);

ALTER TABLE datamodel_datatables
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE datatier_sdp_dataattributes
    ADD FOREIGN KEY (registeredapp_guid)
        REFERENCES refdata_application (app_guid);

ALTER TABLE datatier_sdp_datastructures
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE datatier_sdp_datastructures
    ADD FOREIGN KEY (registeredapp_guid)
        REFERENCES refdata_application (app_guid);

ALTER TABLE datatier_sdp_dataattributes
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE platform_dataattributes
    ADD FOREIGN KEY (registeredapp_guid)
        REFERENCES refdata_application (app_guid);

ALTER TABLE platform_dataattributes
    ADD FOREIGN KEY (sensitivityflag_id)
        REFERENCES refdata_sensitivityflag (sensitiveflag_id);

ALTER TABLE platform_dataattributes
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);


ALTER TABLE platform_datageneration
    ADD FOREIGN KEY (dataattribute_id)
        REFERENCES platform_dataattributes (platform_dataattributes_id);

ALTER TABLE platform_datageneration
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);


ALTER TABLE platform_datastructures
    ADD FOREIGN KEY (registeredapp_guid)
        REFERENCES refdata_application (app_guid);

ALTER TABLE platform_datastructures
    ADD FOREIGN KEY (sensitivityflag_id)
        REFERENCES refdata_sensitivityflag (sensitiveflag_id);

ALTER TABLE platform_datastructures
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);


ALTER TABLE refdata_application
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_application
    ADD FOREIGN KEY (vendor_id)
        REFERENCES refdata_vendor (vendor_id);


ALTER TABLE refdata_codeset
    ADD FOREIGN KEY (industry_std)
        REFERENCES refdata_industrystd (industry_std);

ALTER TABLE refdata_codeset
    ADD FOREIGN KEY (industry_std)
        REFERENCES refdata_industrystd (industry_std);

ALTER TABLE refdata_codeset
    ADD FOREIGN KEY (sensitivityflag_id)
        REFERENCES refdata_sensitivityflag (sensitiveflag_id);

ALTER TABLE refdata_codeset
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_codeset
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);


ALTER TABLE platform_codesets_crossmaps
    ADD FOREIGN KEY (implcodesets_id)
        REFERENCES refdata_codeset (codesets_id);

ALTER TABLE platform_codesets_crossmaps
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE platform_codesets_crossmaps
    ADD FOREIGN KEY (terminologystd_to)
        REFERENCES refdata_terminologystd (terminologystd_id);


ALTER TABLE refdata_countries
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);


ALTER TABLE refdata_devicetypes
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_devicetypes
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);


ALTER TABLE refdata_industries
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);


ALTER TABLE refdata_industriestobusiness
    ADD FOREIGN KEY (industry_id)
        REFERENCES refdata_industries (industry_id);

ALTER TABLE refdata_industriestobusiness
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);


ALTER TABLE refdata_industrystd
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);


ALTER TABLE refdata_industrystd_eventtypes
    ADD FOREIGN KEY (industry_std)
        REFERENCES refdata_industrystd (industry_std);

ALTER TABLE refdata_industrystd_eventtypes
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);


ALTER TABLE refdata_legalentities
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_legalentities
    ADD FOREIGN KEY (state_id)
        REFERENCES refdata_usstates (state_id);


ALTER TABLE refdata_operationtype
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);


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
    ADD FOREIGN KEY (applicationid)
        REFERENCES refdata_application (app_guid);

ALTER TABLE refdata_regextypes
    ADD FOREIGN KEY (organizationid)
        REFERENCES refdata_organization (organization_guid);

ALTER TABLE refdata_regextypes
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);


ALTER TABLE refdata_rulesets
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);


ALTER TABLE refdata_rulesetsdefinitions
    ADD FOREIGN KEY (dataattribute_id)
        REFERENCES platform_dataattributes (platform_dataattributes_id);

ALTER TABLE refdata_rulesetsdefinitions
    ADD FOREIGN KEY (application_guid)
        REFERENCES refdata_application (app_guid);

ALTER TABLE refdata_rulesetsdefinitions
    ADD FOREIGN KEY (operationtype_id)
        REFERENCES refdata_operationtype (operationtype_id);

ALTER TABLE refdata_rulesetsdefinitions
    ADD FOREIGN KEY (ruleset_id)
        REFERENCES refdata_rulesets (rule_id);

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


ALTER TABLE terms_codeset_industrystd
    ADD FOREIGN KEY (codesets_id)
        REFERENCES refdata_codeset (codesets_id);

ALTER TABLE terms_codeset_industrystd
    ADD FOREIGN KEY (industry_std)
        REFERENCES refdata_industrystd (industry_std);

ALTER TABLE terms_codeset_industrystd
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE terms_codeset_industrystd
    ADD FOREIGN KEY (terminologystd_id)
        REFERENCES refdata_terminologystd (terminologystd_id);
