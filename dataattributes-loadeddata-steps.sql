--select * into datatier_sdp_dataatributes_hdr from datatier_sdp_dataattributes
--select count(*) from datatier_sdp_dataatributes_hdr
--select * into datatier_sdp_dataatributes_master from datatier_sdp_dataattributes
--select count(*) from datatier_sdp_dataatributes_master
--alter table datatier_sdp_dataatributes_master add column dataattributes_dtl_guid varchar(38)
--update datatier_sdp_dataatributes_master set dataattributes_dtl_guid = gen_random_uuid() where status_id is not null

--select datatier_id as sdp_dataattribute_id, basevalue as dataattribute_param,supportingvalue1 as dataattribute_value,
--      created_date,status_id,dataattribute_id, created_user, registeredapp_guid,
--       registeredapp_guid as organization_guid
--       into datatier_sdp_attributes_metadata from datatier_sdp_dataattributes

create table if not exists datatier_sdp_attributes_metadata
(
    sdp_dataattribute_id bigint default nextval('datatier_sdp_attributes_seq'::regclass),
    dataattribute_param  varchar(99),
    dataattribute_value  varchar(169),
    created_date         timestamp default CURRENT_TIMESTAMP,
    status_id            varchar(10) default 'Active',
    dataattribute_id     char(38),
    created_user         varchar(20) default 'platform',
    registeredapp_guid   char(38),
    organization_guid    char(38),
    primary key (sdp_dataattribute_id)
);

-- Last Names: Last Names
select 'Last Name' as dataatribute_param, basevalue as dataattribute_value, dataattribute_id
from datatier_sdp_dataattributes where dataattribute_id='0aab5e78-5a12-462c-9226-606a2f8482bf '

-- Area Codes: Area Code
select 'Area Code' as dataatribute_param, basevalue as dataattribute_value, dataattribute_id
from datatier_sdp_dataattributes where dataattribute_id='9315b38d-bac2-44b4-b661-65b785b01b3d  '

