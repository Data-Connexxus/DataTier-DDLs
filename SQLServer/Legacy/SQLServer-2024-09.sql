drop table if exists datatier_datastructure;
CREATE TABLE datatier_datastructure
(
    datastructurecoreid  INT IDENTITY(1,1) NOT NULL,
    datastructurename    varchar(29),
    datastructuredetails text,
    createddate          datetime DEFAULT (GETUTCDATE()),
    statusid             int      default 1,
    registeredapp        char(38),
    PRIMARY KEY (datastructurecoreid)
);

drop table if exists datamodel_apis;
CREATE TABLE datamodel_apis
(
    apiid              INT IDENTITY(1,1) NOT NULL,
    technology         varchar(30),
    dataattributesid   int,
    baseurllocation    varchar(99),
    apiname            varchar(79),
    createddate        datetime DEFAULT (GETUTCDATE()),
    statusid           int      default 1,
    purpose            varchar(49),
    datmodel_tablename varchar(99),
    apiparams          varchar(59),
    apiexample         varchar(149),
    PRIMARY KEY (apiid)
);

drop TABLE if exists datamodel_datatables;
CREATE TABLE datamodel_datatables
(
    tablename        varchar(64) NOT NULL,
    tableinformation varchar(249),
    statusid         int      default 1,
    createddate      datetime DEFAULT (GETUTCDATE()),
    datadomain       varchar(64),
    PRIMARY KEY (tablename)
);

drop table if exists datamodel_domain;
CREATE TABLE datamodel_domain
(
    domainname        varchar(64) NOT NULL,
    domaininformation varchar(249),
    statusid          int      default 1,
    createddate       datetime DEFAULT (GETUTCDATE()),
    PRIMARY KEY (domainname)
);

drop table if exists datatier;
CREATE TABLE datatier
(
    datatierid       INT IDENTITY(1,1) NOT NULL,
    basevalue        varchar(99),
    supportingvalue1 varchar(169),
    supportingvalue2 varchar(50),
    supportingvalue3 varchar(50),
    supportingvalue4 varchar(50),
    supportingvalue5 varchar(50),
    supportingvalue6 varchar(50),
    supportingvalue7 varchar(50),
    createddate      datetime DEFAULT (GETUTCDATE()),
    statusid         int      default 1,
    dataattributeid  int,
    createduser      varchar(20),
    registeredapp    char(38),
    datagentypeid    int,
    PRIMARY KEY (datatierid)
);

drop table if exists platform_dataattributes;
CREATE TABLE platform_dataattributes
(
    platformdataattributesid  INT IDENTITY(1,1) NOT NULL,
    dataattributename         varchar(50),
    sensitivityflagid         int,
    createddate               datetime DEFAULT (GETUTCDATE()),
    statusid                  int      default 1,
    createduser               varchar(20),
    platformdataattributeguid char(38),
    registeredapp             char(38),
    platformtablename         varchar(38),
    attributetype             varchar(10),
    PRIMARY KEY (platformdataattributesid)
);

drop table if exists platform_datageneration;
CREATE TABLE platform_datageneration
(
    datagentypeid          INT IDENTITY(1,1) NOT NULL,
    datagentypedescription varchar(65),
    definition             varchar(255),
    dataattributeid        int,
    createddate            datetime DEFAULT (GETUTCDATE()),
    statusid               int      default 1,
    createduser            varchar(20),
    quantity               int,
    maxrecordsinsource     int,
    registeredapp          char(38),
    organizationguid       char(38),
    PRIMARY KEY (datagentypeid)
);

drop table if exists platform_datastrucutre;
CREATE TABLE platform_datastructures
(
    platformdatastructuresid   INT IDENTITY(1,1) NOT NULL,
    datastructurename          varchar(50),
    sensitivityflagid          int,
    createddate                datetime DEFAULT (GETUTCDATE()),
    statusid                   int      default 1,
    createduser                varchar(20),
    platformdatastructuresguid char(38),
    registeredapp              char(38),
    PRIMARY KEY (platformdatastructuresid)
);

drop table if exists platform_datastructures_dtl;
CREATE TABLE platform_datastructures_dtl
(
    platformdatastructuresdtlid                INT IDENTITY(1,1) NOT NULL,
    platformdatastructuresid                   int,
    compositedatastructurename                 varchar(50),
    sensitivityflagid                          int,
    createddate                                datetime DEFAULT (GETUTCDATE()),
    statusid                                   int      default 1,
    createduser                                varchar(20),
    platformdatastructurestodataattributesguid char(38),
    registeredapp                              char(38),
    platformdataattributesid                   int,
    PRIMARY KEY (platformdatastructuresdtlid)
);

drop table if exists refdata_application;
CREATE TABLE refdata_application
(
    appguid               char(38) NOT NULL,
    applicationcustomcode varchar(15),
    applicationdesc       varchar(50),
    createduser           varchar(20),
    createddate           datetime DEFAULT (GETUTCDATE()),
    statusid              int      default 1,
    vendorid              int,
    industry_oid          varchar(49),
    organization_uid      varchar(49),
    PRIMARY KEY (appguid)
);

drop table if exists refdata_codeset;
CREATE TABLE refdata_codeset
(
    codesetsid        INT IDENTITY(1,1) NOT NULL,
    codesetname       varchar(50),
    industrystd       varchar(6),
    statusid          int      default 1,
    createddate       datetime DEFAULT (GETUTCDATE()),
    createduser       varchar(20),
    codesetguid       char(38),
    fieldmapping      varchar(40),
    sensitivityflagid int,
    externaltableid   varchar(20),
    externalnotes     varchar(149),
    externallink      varchar(99),
    PRIMARY KEY (codesetsid)
);

drop table if exists refdata_codesets_crossmaps;
CREATE TABLE refdata_codesets_crossmaps
(
    codesetcrossmapid  INT IDENTITY(1,1) NOT NULL,
    implcodesetsid     int NOT NULL,
    applicationid      bigint,
    terminologystdto   int,
    createddate        datetime DEFAULT (GETUTCDATE()),
    statusid           int      default 1,
    createduser        varchar(20),
    transformcodevalue varchar(40),
    transformcodedesc  varchar(129),
    originalcodevalue  varchar(40),
    originalcodedesc   varchar(40),
    PRIMARY KEY (codesetcrossmapid)
);

drop table if exists refdata_countries;
CREATE TABLE refdata_countries
(
    countryid   INT IDENTITY(1,1) NOT NULL,
    idd         varchar(5),
    countryname varchar(59),
    createddate datetime DEFAULT (GETUTCDATE()),
    statusid    int      default 1,
    PRIMARY KEY (countryid)
);

drop table if exists refdata_devicetypes;
CREATE TABLE refdata_devicetypes
(
    devicetypeid INT IDENTITY(1,1) NOT NULL,
    devicetype   varchar(30),
    createddate  datetime DEFAULT (GETUTCDATE()),
    statusid     int      default 1,
    PRIMARY KEY (devicetypeid)
);

drop table if exists refdata_industries;
CREATE TABLE refdata_industries
(
    industryid   INT IDENTITY(1,1) NOT NULL,
    industryname varchar(45),
    createddate  datetime DEFAULT (GETUTCDATE()),
    statusid     int      default 1,
    PRIMARY KEY (industryid)
);

drop table if exists refdata_industriestobusiness;
CREATE TABLE refdata_industriestobusiness
(
    industrytobusinessid INT IDENTITY(1,1) NOT NULL,
    industryid           int,
    businessarea         varchar(50),
    createddate          datetime DEFAULT (GETUTCDATE()),
    statusid             int      default 1,
    PRIMARY KEY (industrytobusinessid)
);

drop table if exists refdata_industrystd;
CREATE TABLE refdata_industrystd
(
    industrystd     varchar(6) NOT NULL,
    industrystddesc varchar(30),
    createddate     datetime DEFAULT (GETUTCDATE()),
    statusid        int      default 1,
    PRIMARY KEY (industrystd)
);

drop table if exists refdata_industrystd_eventtypes;
CREATE TABLE refdata_industrystd_eventtypes
(
    eventtypeid     varchar(10) NOT NULL,
    eventtypesddesc varchar(30),
    industrystd     varchar(6),
    createddate     datetime DEFAULT (GETUTCDATE()),
    statusid        int      default 1,
    PRIMARY KEY (eventtypeid)
);

drop table if exists refdata_legalentities;
CREATE TABLE refdata_legalentities
(
    legalentityguid char(38) NOT NULL,
    locationname    varchar(50),
    address         varchar(75),
    city            varchar(60),
    stateid         varchar(2),
    zipcode         varchar(12),
    createduser     varchar(20),
    statusid        int      default 1,
    createddate     datetime DEFAULT (GETUTCDATE()),
    locationurl     varchar(99),
    locationphone   varchar(12),
    PRIMARY KEY (legalentityguid)
);

drop table if exists refdata_operationtype;
CREATE TABLE refdata_operationtype
(
    operationtypeid   varchar(7) NOT NULL,
    operationtypename varchar(60),
    createddate       datetime DEFAULT (GETUTCDATE()),
    statusid          int      default 1,
    PRIMARY KEY (operationtypeid)
);

drop table if exists refdata_organization;
CREATE TABLE refdata_organization
(
    organizationguid         char(38) NOT NULL,
    organizationinternalcode varchar(10),
    organizationinternalid   varchar(10),
    organizationname         varchar(50),
    address                  varchar(75),
    city                     varchar(60),
    stateid                  varchar(2),
    zipcode                  varchar(12),
    createduser              varchar(20),
    statusid                 int      default 1,
    createddate              datetime DEFAULT (GETUTCDATE()),
    legalentityguid          char(38),
    PRIMARY KEY (organizationguid)
);

drop table if exists refdata_professsiontypes;
CREATE TABLE refdata_professiontypes
(
    professiontypeid   INT IDENTITY(1,1) NOT NULL,
    professiontypename varchar(65),
    createduser        varchar(20),
    createddate        datetime DEFAULT (GETUTCDATE()),
    statusid           int      default 1,
    PRIMARY KEY (professiontypeid)
);

drop table if exists refdata_regextypes;
CREATE TABLE refdata_regextypes
(
    implregextypeid INT IDENTITY(1,1) NOT NULL,
    regextypedesc   varchar(69),
    createddate     datetime DEFAULT (GETUTCDATE()),
    statusid        int      default 1,
    organizationid  char(38),
    applicationid   char(38),
    PRIMARY KEY (implregextypeid)
);

drop table if exists refdata_rulesets;
CREATE TABLE refdata_rulesets
(
    ruleid         INT IDENTITY(1,1) NOT NULL,
    rulename       varchar(65),
    createduser    varchar(20),
    createddate    datetime DEFAULT (GETUTCDATE()),
    statusid       int      default 1,
    expirationdate datetime,
    PRIMARY KEY (ruleid)
);

drop table if exists refdata_rulesetsdefinitions;
CREATE TABLE refdata_rulesetsdefinitions
(
    rulesetdefinitionsid  char(38) NOT NULL,
    rulesetdefinitionname varchar(50),
    rulesetid             int,
    steporderid           int,
    operationtypeid       varchar(7),
    rulesetdefvalue       char(40),
    statusid              int      default 1,
    createddate           datetime DEFAULT (GETUTCDATE()),
    effectivedate         datetime,
    applicationid         char(38),
    termdate              datetime,
    dataattributeid       int,
    PRIMARY KEY (rulesetdefinitionsid)
);

drop table if exists refdata_sensitivityflag;
CREATE TABLE refdata_sensitivityflag
(
    sensitiveflagid   INT IDENTITY(1,1) NOT NULL,
    sensitiveflagdesc varchar(30),
    createddate       datetime DEFAULT (GETUTCDATE()),
    statusid          int      default 1,
    PRIMARY KEY (sensitiveflagid)
);

drop table if exists refdata_status;
CREATE TABLE refdata_status
(
    statusid          INT IDENTITY(1,1) NOT NULL,
    statusdescription varchar(45) NOT NULL,
    createddate       datetime,
    createduser       varchar(20),
    PRIMARY KEY (statusid)
);

drop table if exists refdata_terminologystd;
CREATE TABLE refdata_terminologystd
(
    terminologystdid      INT IDENTITY(1,1) NOT NULL,
    terminologystd        varchar(25) NOT NULL,
    terminologystdversion varchar(10) NOT NULL,
    terminologystddesc    varchar(129),
    createddate           datetime DEFAULT (GETUTCDATE()),
    statusid              int      default 1,
    PRIMARY KEY (terminologystdid)
);

drop table if exists refdata_timezones;
CREATE TABLE refdata_timezones
(
    timezonevalue varchar(3) NOT NULL,
    timezonedesc  varchar(25),
    createddate   datetime DEFAULT (GETUTCDATE()),
    statusid      int      default 1,
    PRIMARY KEY (timezonevalue)
);

drop table if exists refdata_usstates;
CREATE TABLE refdata_usstates
(
    stateid          varchar(2) NOT NULL,
    statedescription varchar(65),
    lattitude        varchar(12),
    longitude        varchar(12),
    createddate      datetime DEFAULT (GETUTCDATE()),
    statusid         int      default 1,
    createduser      varchar(20),
    PRIMARY KEY (stateid)
);

drop table if exists refdata_vendor;
CREATE TABLE refdata_vendor
(
    vendorid    INT IDENTITY(1,1) NOT NULL,
    vendorname  varchar(50),
    createddate datetime DEFAULT (GETUTCDATE()),
    statusid    int      default 1,
    createduser varchar(20),
    vendorguid  char(38),
    PRIMARY KEY (vendorid)
);

drop table if exists terms_codeset_industrystd;
CREATE TABLE terms_codeset_industrystd
(
    termcodesetid    INT IDENTITY(1,1) NOT NULL,
    codesetsid       int NOT NULL,
    createddate      datetime DEFAULT (GETUTCDATE()),
    statusid         int      default 1,
    codevalue        varchar(20),
    codedesc         varchar(129),
    industrystd      varchar(6),
    terminologystdid int,
    PRIMARY KEY (termcodesetid)
);

ALTER TABLE databuilt_datastructure
    ADD FOREIGN KEY (registeredapp)
        REFERENCES refdata_application (appguid);

ALTER TABLE databuilt_datastructure
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);


ALTER TABLE datamodel_apis
    ADD FOREIGN KEY (dataattributesid)
        REFERENCES platform_dataattributes (platformdataattributesid);


ALTER TABLE datamodel_datatables
    ADD FOREIGN KEY (datadomain)
        REFERENCES datamodel_domain (domainname);

ALTER TABLE datamodel_datatables
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);


ALTER TABLE datatier
    ADD FOREIGN KEY (registeredapp)
        REFERENCES refdata_application (appguid);

ALTER TABLE datatier
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);


ALTER TABLE platform_dataattributes
    ADD FOREIGN KEY (registeredapp)
        REFERENCES refdata_application (appguid);

ALTER TABLE platform_dataattributes
    ADD FOREIGN KEY (sensitivityflagid)
        REFERENCES refdata_sensitivityflag (sensitiveflagid);

ALTER TABLE platform_dataattributes
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);


ALTER TABLE platform_datageneration
    ADD FOREIGN KEY (dataattributeid)
        REFERENCES platform_dataattributes (platformdataattributesid);

ALTER TABLE platform_datageneration
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);


ALTER TABLE platform_datastructures
    ADD FOREIGN KEY (registeredapp)
        REFERENCES refdata_application (appguid);

ALTER TABLE platform_datastructures
    ADD FOREIGN KEY (sensitivityflagid)
        REFERENCES refdata_sensitivityflag (sensitiveflagid);

ALTER TABLE platform_datastructures
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);


ALTER TABLE refdata_application
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE refdata_application
    ADD FOREIGN KEY (vendorid)
        REFERENCES refdata_vendor (vendorid);


ALTER TABLE refdata_codeset
    ADD FOREIGN KEY (industrystd)
        REFERENCES refdata_industrystd (industrystd);

ALTER TABLE refdata_codeset
    ADD FOREIGN KEY (industrystd)
        REFERENCES refdata_industrystd (industrystd);

ALTER TABLE refdata_codeset
    ADD FOREIGN KEY (sensitivityflagid)
        REFERENCES refdata_sensitivityflag (sensitiveflagid);

ALTER TABLE refdata_codeset
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE refdata_codeset
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);


ALTER TABLE refdata_codesets_crossmaps
    ADD FOREIGN KEY (implcodesetsid)
        REFERENCES refdata_codeset (codesetsid);

ALTER TABLE refdata_codesets_crossmaps
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE refdata_codesets_crossmaps
    ADD FOREIGN KEY (terminologystdto)
        REFERENCES refdata_terminologystd (terminologystdid);


ALTER TABLE refdata_countries
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);


ALTER TABLE refdata_devicetypes
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE refdata_devicetypes
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);


ALTER TABLE refdata_industries
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);


ALTER TABLE refdata_industriestobusiness
    ADD FOREIGN KEY (industryid)
        REFERENCES refdata_industries (industryid);

ALTER TABLE refdata_industriestobusiness
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);


ALTER TABLE refdata_industrystd
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);


ALTER TABLE refdata_industrystd_eventtypes
    ADD FOREIGN KEY (industrystd)
        REFERENCES refdata_industrystd (industrystd);

ALTER TABLE refdata_industrystd_eventtypes
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);


ALTER TABLE refdata_legalentities
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE refdata_legalentities
    ADD FOREIGN KEY (stateid)
        REFERENCES refdata_usstates (stateid);


ALTER TABLE refdata_operationtype
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);


ALTER TABLE refdata_organization
    ADD FOREIGN KEY (legalentityguid)
        REFERENCES refdata_legalentities (legalentityguid);

ALTER TABLE refdata_organization
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE refdata_organization
    ADD FOREIGN KEY (stateid)
        REFERENCES refdata_usstates (stateid);


ALTER TABLE refdata_professiontypes
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);


ALTER TABLE refdata_regextypes
    ADD FOREIGN KEY (applicationid)
        REFERENCES refdata_application (appguid);

ALTER TABLE refdata_regextypes
    ADD FOREIGN KEY (organizationid)
        REFERENCES refdata_organization (organizationguid);

ALTER TABLE refdata_regextypes
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);


ALTER TABLE refdata_rulesets
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);


ALTER TABLE refdata_rulesetsdefinitions
    ADD FOREIGN KEY (dataattributeid)
        REFERENCES platform_dataattributes (platformdataattributesid);

ALTER TABLE refdata_rulesetsdefinitions
    ADD FOREIGN KEY (applicationid)
        REFERENCES refdata_application (appguid);

ALTER TABLE refdata_rulesetsdefinitions
    ADD FOREIGN KEY (operationtypeid)
        REFERENCES refdata_operationtype (operationtypeid);

ALTER TABLE refdata_rulesetsdefinitions
    ADD FOREIGN KEY (rulesetid)
        REFERENCES refdata_rulesets (ruleid);

ALTER TABLE refdata_rulesetsdefinitions
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);


ALTER TABLE refdata_sensitivityflag
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);


ALTER TABLE refdata_terminologystd
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);


ALTER TABLE refdata_timezones
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);


ALTER TABLE refdata_usstates
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);


ALTER TABLE refdata_vendor
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);


ALTER TABLE terms_codeset_industrystd
    ADD FOREIGN KEY (codesetsid)
        REFERENCES refdata_codeset (codesetsid);

ALTER TABLE terms_codeset_industrystd
    ADD FOREIGN KEY (industrystd)
        REFERENCES refdata_industrystd (industrystd);

ALTER TABLE terms_codeset_industrystd
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE terms_codeset_industrystd
    ADD FOREIGN KEY (terminologystdid)
        REFERENCES refdata_terminologystd (terminologystdid);
