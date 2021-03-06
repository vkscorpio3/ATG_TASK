


-- @version $Id: //hosting-blueprint/B2CBlueprint/version/10.0.3/EStore/sql/ddlgen/store_ddl.xml#1 $$Change: 651360 $

create table crs_store_location (
	asset_version	numeric(19)	not null,
	workspace_id	varchar(40)	not null,
	branch_id	varchar(40)	not null,
	is_head	tinyint	not null,
	version_deleted	numeric(1)	not null,
	version_editable	numeric(1)	not null,
	pred_version	numeric(19)	null,
	checkin_date	datetime	null,
	store_id	nchar varchar(40)	not null,
	site_id	varchar(40)	not null,
	store_name	nchar varchar(250)	not null,
	address_1	nchar varchar(50)	null,
	address_2	nchar varchar(50)	null,
	address_3	nchar varchar(50)	null,
	city	nchar varchar(40)	null,
	county	nchar varchar(40)	null,
	state	nchar varchar(40)	null,
	postal_code	varchar(10)	null,
	country	nchar varchar(40)	null,
	phone_number	varchar(40)	null,
	fax_number	varchar(40)	null,
	email	varchar(255)	null
,constraint crs_store_locatn_p primary key (store_id,asset_version));

create index crs_store_loca_wsx on crs_store_location (workspace_id);
create index crs_store_loca_cix on crs_store_location (checkin_date);
commit;


