-- Create Sequences First
-- Need to create for all serial datatypes
create sequence databuilt_datastructure_seq;
create sequence datatier_seq;
create sequence apis_seq;
create sequence refdata_codesets_seq;
create sequence refdata_codesetscrossmaps_seq;
create sequence refdata_professiontypes_seq;
create sequence refdata_regextypes_seq;
create sequence refdata_rulesets_seq;
create sequence platform_dataattributes_seq;
create sequence platform_datageneration_seq;
create sequence platform_datastructures_seq;
create sequence refdata_codeset_seq;
create sequence refdata_countries_seq;
create sequence refdata_devicetypes_seq;
create sequence refdata_eventtypes_seq;
create sequence refdata_industries_seq;
create sequence refdata_industriestobusiness_seq;
create sequence refdata_sensitivityflag_seq;
create sequence refdata_status_seq;
create sequence refdata_terminologystd_seq;
create sequence refdata_vendor_seq;
create sequence terms_codeset_industrystd_seq;

-- Create Tables
CREATE TABLE datatier_datastructure
(
        datastructurecoreid integer DEFAULT nextval('databuilt_datastructure_seq'::regclass) NOT NULL,
        datastructurename varchar(29) DEFAULT 'NULL'::character varying,
        datastructuredetails text DEFAULT 'NULL'::character varying,
        createddate timestamp DEFAULT CURRENT_TIMESTAMP,
        statusid integer DEFAULT 1,
        registeredapp varchar(38) DEFAULT 'NULL'::character varying,
        PRIMARY KEY (datastructurecoreid)
);

create table datatier
(
    datatierid       integer default nextval('datatier_seq'::regclass) not null primary key,
    basevalue        varchar(99),
    supportingvalue1 varchar(169),
    supportingvalue2 varchar(50),
    supportingvalue3 varchar(50),
    supportingvalue4 varchar(50),
    supportingvalue5 varchar(50),
    supportingvalue6 varchar(50),
    supportingvalue7 varchar(50),
    createddate      timestamp,
    statusid         integer,
    dataattributeid  integer,
    createduser      varchar(20),
    registeredapp    char(38),
    datagentypeid    integer
);

CREATE TABLE datamodel_apis (
     apiid integer DEFAULT nextval('apis_seq'::regclass) NOT NULL,
     technology varchar(30),
     dataattributesid integer,
     baseurllocation varchar(99),
     apiname varchar(79),
     createddate timestamp DEFAULT CURRENT_TIMESTAMP,
     statusid integer DEFAULT 1,
     purpose varchar(49),
     datmodel_tablename varchar(99),
     apiparams varchar(59),
     apiexample varchar(149),
     PRIMARY KEY (apiid)
);

CREATE TABLE datamodel_datatables (
     tablename varchar(64) NOT NULL,
     tableinformation varchar(249) DEFAULT 'NULL'::character varying,
     statusid integer DEFAULT 1,
     createddate timestamp DEFAULT CURRENT_TIMESTAMP,
     datadomain varchar(64),
     PRIMARY KEY (tablename)
);

CREATE TABLE datamodel_domain (
      domainname varchar(64) NOT NULL,
      domaininformation varchar(249) DEFAULT 'NULL'::character varying,
      statusid integer DEFAULT 1,
      createddate timestamp DEFAULT CURRENT_TIMESTAMP,
      PRIMARY KEY (domainname)
);

CREATE TABLE platform_dataattributes (
      platformdataattributesid integer DEFAULT nextval('platform_dataattributes_seq'::regclass) NOT NULL,
      dataattributename varchar(50) DEFAULT 'NULL'::character varying,
      sensitivityflagid integer,
      createddate timestamp DEFAULT CURRENT_TIMESTAMP,
      statusid integer DEFAULT 1,
      createduser varchar(20) DEFAULT 'NULL'::character varying,
      platformdataattributeguid char(38) DEFAULT 'NULL'::bpchar,
      registeredapp char(38) DEFAULT 'NULL'::bpchar,
      attributetype varchar(10) DEFAULT 'NULL'::character varying,
      PRIMARY KEY (platformdataattributesid)
);

CREATE TABLE platform_datageneration (
       datagentypeid integer DEFAULT nextval('platform_datageneration_seq'::regclass) NOT NULL,
       datagentypedescription varchar(65) DEFAULT 'NULL'::character varying,
       definition varchar(255) DEFAULT 'NULL'::character varying,
       dataattributeid integer,
       createddate timestamp DEFAULT CURRENT_TIMESTAMP,
       statusid integer DEFAULT 1,
       createduser varchar(20) DEFAULT 'NULL'::character varying,
       quantity integer,
       maxrecordsinsource integer,
       registeredapp char(38),
       organizationguid char(38),
       PRIMARY KEY (datagentypeid)
);

create table platform_datastructures
(
    platformdatastructuresid   integer  default nextval('platform_datastructures_seq'::regclass) not null,
    datastructurename varchar(50) default 'NULL'::character varying,
    sensitivityflagid integer,
    createddate timestamp default CURRENT_TIMESTAMP,
    statusid integer default 1,
    createduser varchar(20) default 'NULL'::character varying,
    platformdatastructuresguid char(38) default 'gen_random_uuid()'::bpchar,
    registeredapp char(38) default NULL::bpchar,
    PRIMARY KEY (platformdatastructuresid)
);

CREATE TABLE platform_datastructures_dtl (
      platformdatastructuresdtlid integer DEFAULT nextval('platform_datastructures_seq'::regclass) NOT NULL,
      platformdatastructuresid integer,
      compositedatastructurename varchar(50) DEFAULT 'NULL'::character varying,
      sensitivityflagid integer DEFAULT 1,
      createddate timestamp DEFAULT CURRENT_TIMESTAMP,
      statusid integer DEFAULT 1,
      createduser varchar(20) DEFAULT 'NULL'::character varying,
      platformdatastructurestodataattributesguid char(38) DEFAULT 'NULL'::bpchar,
      registeredapp char(38) DEFAULT 'NULL'::bpchar,
      platformdataattributesid integer,
      PRIMARY KEY (platformdatastructuresdtlid)
);

CREATE TABLE refdata_application (
      appguid char(38) DEFAULT 'gen_random_uuid()' NOT NULL,
      applicationcustomcode varchar(15) DEFAULT 'NULL'::character varying,
      applicationdesc varchar(50) DEFAULT 'NULL'::character varying,
      createduser varchar(20) DEFAULT 'NULL'::character varying,
      createddate timestamp DEFAULT CURRENT_TIMESTAMP,
      statusid integer DEFAULT 1,
      vendorid integer,
      industry_oid varchar(49),
      organization_uid varchar(49),
      PRIMARY KEY (appguid)
);


CREATE TABLE refdata_codeset (
       codesetsid integer DEFAULT nextval('refdata_codeset_seq'::regclass) NOT NULL,
       codesetname varchar(50) DEFAULT 'NULL'::character varying,
       industrystd varchar(6) DEFAULT 'NULL'::character varying,
       statusid integer DEFAULT 1,
       createddate timestamp DEFAULT CURRENT_TIMESTAMP,
       createduser varchar(20) DEFAULT 'NULL'::character varying,
       codesetguid char(38) DEFAULT 'NULL'::bpchar,
       fieldmapping varchar(40) DEFAULT 'NULL'::character varying,
       sensitivityflagid integer,
       externaltableid varchar(20) DEFAULT 'NULL'::character varying,
       externalnotes varchar(149) DEFAULT 'NULL'::character varying,
       externallink varchar(99) DEFAULT 'NULL'::character varying,
       PRIMARY KEY (codesetsid)
);

CREATE TABLE refdata_codesets_crossmaps (
      codesetcrossmapid integer DEFAULT nextval('refdata_codesetscrossmaps_seq'::regclass) NOT NULL,
      implcodesetsid integer NOT NULL,
      applicationid bigint,
      terminologystdto integer,
      createddate timestamp DEFAULT CURRENT_TIMESTAMP,
      statusid integer DEFAULT 1,
      createduser varchar(20) DEFAULT 'NULL'::character varying,
      transformcodevalue varchar(40) DEFAULT 'NULL'::character varying,
      transformcodedesc varchar(129) DEFAULT 'NULL'::character varying,
      originalcodevalue varchar(40),
      originalcodedesc varchar(40),
      PRIMARY KEY (codesetcrossmapid)
);

CREATE TABLE refdata_countries (
      countryid integer DEFAULT nextval('refdata_countries_seq'::regclass) NOT NULL,
      idd varchar(5) DEFAULT 'NULL'::character varying,
      countryname varchar(59) DEFAULT 'NULL'::character varying,
      createddate timestamp DEFAULT CURRENT_TIMESTAMP,
      statusid integer DEFAULT 1,
      PRIMARY KEY (countryid)
);

CREATE TABLE refdata_devicetypes (
      devicetypeid integer DEFAULT nextval('refdata_devicetypes_seq'::regclass) NOT NULL,
      devicetype varchar(30),
      createddate timestamp DEFAULT CURRENT_TIMESTAMP,
      statusid integer DEFAULT 1,
      PRIMARY KEY (devicetypeid)
);

CREATE TABLE refdata_industrystd_eventtypes
(
    eventtypeid     varchar(10) NOT NULL,
    eventtypesddesc varchar(30) default 'NULL'::character varying,
    industrystd     varchar(6),
    createddate     timestamp   default CURRENT_TIMESTAMP,
    statusid        integer     default 1,
    PRIMARY KEY (eventtypeid)
);


CREATE TABLE refdata_industries (
      industryid integer DEFAULT nextval('refdata_industries_seq'::regclass) NOT NULL,
      industryname varchar(45),
      createddate timestamp DEFAULT CURRENT_TIMESTAMP,
      statusid integer DEFAULT 1,
      PRIMARY KEY (industryid)
);

CREATE TABLE refdata_industriestobusiness (
       industrytobusinessid integer DEFAULT nextval('refdata_industriestobusiness_seq'::regclass) NOT NULL,
       industryid integer,
       businessarea varchar(50),
       createddate timestamp DEFAULT CURRENT_TIMESTAMP,
       statusid integer DEFAULT 1,
       PRIMARY KEY (industrytobusinessid)
);

CREATE TABLE refdata_industrystd (
      industrystd varchar(6) NOT NULL,
      industrystddesc varchar(30) DEFAULT 'NULL'::character varying,
      createddate timestamp DEFAULT CURRENT_TIMESTAMP,
      statusid integer DEFAULT 1,
      PRIMARY KEY (industrystd)
);

CREATE TABLE refdata_legalentities (
       legalentityguid char(38) NOT NULL,
       locationname varchar(50) DEFAULT 'NULL'::character varying,
       address varchar(75) DEFAULT 'NULL'::character varying,
       city varchar(60) DEFAULT 'NULL'::character varying,
       stateid varchar(2) DEFAULT 'NULL'::character varying,
       zipcode varchar(12) DEFAULT 'NULL'::character varying,
       createduser varchar(20) DEFAULT 'NULL'::character varying,
       statusid integer DEFAULT 1,
       createddate timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
       locationurl varchar(99) DEFAULT 'NULL'::character varying,
       locationphone varchar(12) DEFAULT 'NULL'::character varying,
       PRIMARY KEY (legalentityguid)
);

CREATE TABLE refdata_organization (
       organizationguid char(38) NOT NULL,
       organizationinternalcode varchar(10) DEFAULT 'NULL'::character varying,
       organizationinternalid varchar(10) DEFAULT 'NULL'::character varying,
       organizationname varchar(50) DEFAULT 'NULL'::character varying,
       address varchar(75) DEFAULT 'NULL'::character varying,
       city varchar(60) DEFAULT 'NULL'::character varying,
       stateid varchar(2) DEFAULT 'NULL'::character varying,
       zipcode varchar(12) DEFAULT 'NULL'::character varying,
       createduser varchar(20) DEFAULT 'NULL'::character varying,
       statusid integer DEFAULT 1,
       createddate timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
       legalentityguid varchar(38) DEFAULT 'NULL'::character varying,
       PRIMARY KEY (organizationguid)
);


CREATE TABLE refdata_regextypes (
       implregextypeid integer DEFAULT nextval('refdata_regextypes_seq'::regclass) NOT NULL,
       regextypedesc varchar(69),
       createddate timestamp DEFAULT CURRENT_TIMESTAMP,
       statusid integer DEFAULT 1,
       organizationid char(38) DEFAULT 'NULL'::character varying,
       applicationid char(38) DEFAULT 'NULL'::character varying,
       PRIMARY KEY (implregextypeid)
);

CREATE TABLE refdata_rulesets (
       ruleid integer DEFAULT nextval('refdata_rulesets_seq'::regclass) NOT NULL,
       rulename varchar(65) DEFAULT 'NULL'::character varying,
       createduser varchar(20) DEFAULT 'NULL'::character varying,
       createddate timestamp DEFAULT CURRENT_TIMESTAMP,
       statusid integer DEFAULT 1,
       expirationdate timestamp,
       PRIMARY KEY (ruleid)
);

CREATE TABLE refdata_rulesetsdefinitions (
      rulesetdefinitionsid char(38) NOT NULL,
      rulesetdefinitionname varchar(50) DEFAULT 'NULL'::character varying,
      rulesetid integer,
      steporderid integer,
      operationtypeid varchar(7) DEFAULT 'NULL'::character varying,
      rulesetdefvalue char(40) DEFAULT 'NULL'::bpchar,
      statusid integer DEFAULT 1,
      createddate timestamp DEFAULT CURRENT_TIMESTAMP,
      effectivedate timestamp,
      applicationid char(38) DEFAULT 'NULL'::character varying,
      termdate timestamp,
      dataattributeid integer,
      PRIMARY KEY (rulesetdefinitionsid)
);

CREATE TABLE refdata_professiontypes (
       professiontypeid integer DEFAULT nextval('refdata_professiontypes_seq'::regclass) NOT NULL,
       professiontypename varchar(65) DEFAULT 'NULL'::character varying,
       createduser varchar(20) DEFAULT 'NULL'::character varying,
       createddate timestamp DEFAULT CURRENT_TIMESTAMP,
       statusid integer DEFAULT 1,
       PRIMARY KEY (professiontypeid)
);


CREATE TABLE refdata_operationtype (
       operationtypeid varchar(7) NOT NULL,
       operationtypename varchar(60) DEFAULT 'NULL'::character varying,
       createddate timestamp DEFAULT CURRENT_TIMESTAMP,
       statusid integer DEFAULT 1,
       PRIMARY KEY (operationtypeid)
);

CREATE TABLE refdata_sensitivityflag (
       sensitiveflagid integer DEFAULT nextval('refdata_sensitivityflag_seq'::regclass) NOT NULL,
       sensitiveflagdesc varchar(30) DEFAULT 'NULL'::character varying,
       createddate timestamp DEFAULT CURRENT_TIMESTAMP,
       statusid integer DEFAULT 1,
       PRIMARY KEY (sensitiveflagid)
);

CREATE TABLE refdata_status (
        statusid integer DEFAULT nextval('refdata_status_seq'::regclass) NOT NULL,
        statusdescription varchar(45) NOT NULL,
        createddate timestamp DEFAULT CURRENT_TIMESTAMP,
        createduser varchar(20) DEFAULT 'NULL'::character varying,
        PRIMARY KEY (statusid)
);

CREATE TABLE refdata_terminologystd (
        terminologystdid integer DEFAULT nextval('refdata_terminologystd_seq'::regclass) NOT NULL,
        terminologystd varchar(25) NOT NULL,
        terminologystdversion varchar(10) NOT NULL,
        terminologystddesc varchar(129) DEFAULT 'NULL'::character varying,
        createddate timestamp DEFAULT CURRENT_TIMESTAMP,
        statusid integer DEFAULT 1,
        PRIMARY KEY (terminologystdid)
);

CREATE TABLE refdata_timezones (
        timezonevalue varchar(3) NOT NULL,
        timezonedesc varchar(25) DEFAULT 'NULL'::character varying,
        createddate timestamp DEFAULT CURRENT_TIMESTAMP,
        statusid integer DEFAULT 1,
        PRIMARY KEY (timezonevalue)
);

CREATE TABLE refdata_usstates (
       stateid varchar(2) NOT NULL,
       statedescription varchar(65) DEFAULT 'NULL'::character varying,
       lattitude varchar(12) DEFAULT 'NULL'::character varying,
       longitude varchar(12) DEFAULT 'NULL'::character varying,
       createddate timestamp DEFAULT CURRENT_TIMESTAMP,
       statusid integer DEFAULT 1,
       createduser varchar(20) DEFAULT 'NULL'::character varying,
       PRIMARY KEY (stateid)
);

CREATE TABLE refdata_vendor (
       vendorid integer DEFAULT nextval('refdata_vendor_seq'::regclass) NOT NULL,
       vendorname varchar(50) DEFAULT 'NULL'::character varying,
       createddate timestamp DEFAULT CURRENT_TIMESTAMP,
       statusid integer DEFAULT 1,
       createduser varchar(20) DEFAULT 'NULL'::character varying,
       vendorguid char(38) DEFAULT 'NULL'::bpchar,
       PRIMARY KEY (vendorid)
);

CREATE TABLE terms_codeset_industrystd (
        termcodesetid integer DEFAULT nextval('terms_codeset_industrystd_seq'::regclass)NOT NULL,
        codesetsid integer NOT NULL,
        createddate timestamp DEFAULT CURRENT_TIMESTAMP,
        statusid integer DEFAULT 1,
        codevalue varchar(20) DEFAULT 'NULL'::character varying,
        codedesc varchar(129) DEFAULT 'NULL'::character varying,
        industrystd varchar(6) DEFAULT 'UNDF'::character varying,
        terminologystdid integer,
        PRIMARY KEY (termcodesetid)
);

-- Foreign Keys
ALTER TABLE datatier
    ADD FOREIGN KEY (registeredapp)
        REFERENCES refdata_application (appguid);

ALTER TABLE datatier
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

ALTER TABLE databuilt_datastructure
    ADD FOREIGN KEY (registeredapp)
        REFERENCES refdata_application (appguid);

ALTER TABLE databuilt_datastructure
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

ALTER TABLE platform_dataattributes
    ADD FOREIGN KEY (registeredapp)
        REFERENCES refdata_application (appguid);

ALTER TABLE platform_dataattributes
    ADD FOREIGN KEY (sensitivityflagid)
        REFERENCES refdata_sensitivityflag (sensitiveflagid);

ALTER TABLE platform_dataattributes
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

ALTER TABLE refdata_legalentities
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE refdata_legalentities
    ADD FOREIGN KEY (stateid)
        REFERENCES refdata_usstates (stateid);

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
    ADD FOREIGN KEY (applicationid)
        REFERENCES refdata_application (appguid);

ALTER TABLE refdata_rulesetsdefinitions
    ADD FOREIGN KEY (rulesetid)
        REFERENCES refdata_rulesets (ruleid);

ALTER TABLE refdata_rulesetsdefinitions
    ADD FOREIGN KEY (dataattributeid)
        REFERENCES platform_dataattributes (platformdataattributesid);

ALTER TABLE refdata_rulesetsdefinitions
    ADD FOREIGN KEY (operationtypeid)
        REFERENCES refdata_operationtype (operationtypeid);

ALTER TABLE refdata_rulesetsdefinitions
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE refdata_codeset
    ADD FOREIGN KEY (industrystd)
        REFERENCES refdata_industrystd (industrystd);

ALTER TABLE refdata_codeset
    ADD FOREIGN KEY (sensitivityflagid)
        REFERENCES refdata_sensitivityflag (sensitiveflagid);

ALTER TABLE refdata_codeset
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE refdata_countries
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE platform_datageneration
    ADD FOREIGN KEY (dataattributeid)
        REFERENCES platform_dataattributes (platformdataattributesid);

ALTER TABLE platform_datageneration
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE refdata_devicetypes
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE refdata_devicetypes
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE refdata_industrystd_eventtypes
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE refdata_industrystd_eventtypes
    ADD FOREIGN KEY (industrystd)
        REFERENCES refdata_industrystd (industrystd);

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

ALTER TABLE refdata_operationtype
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


-- Indexes
create index if not exists datatier_index
    on public.datatier (datatierid, basevalue, supportingvalue1, supportingvalue2, supportingvalue3, supportingvalue4,
                        supportingvalue5, supportingvalue6, supportingvalue7, createddate, dataattributeid,
                        datagentypeid, statusid, createduser, registeredapp);

CREATE INDEX terms_codeset_industrystd_index ON terms_codeset_industrystd USING btree (termcodesetid, codesetsid, createddate, statusid, codevalue, codedesc, industrystd);

CREATE UNIQUE INDEX terms_codeset_industrystd_uindex ON terms_codeset_industrystd USING btree (codesetsid, codevalue, codedesc, industrystd);
