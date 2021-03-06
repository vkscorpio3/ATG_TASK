


--  @version $Id: //app/portal/version/10.0.3/paf/sql/profile_ddl.xml#2 $$Change: 651448 $

create table paf_gear_user (
	gear_user_id	nvarchar(40)	not null,
	internal_version	integer	default 0 not null,
	gear_id	nvarchar(40)	not null,
	user_id	nvarchar(40)	not null
,constraint paf_gearuserpk primary key (gear_user_id));

create index paf_gu_ugix on paf_gear_user (user_id,gear_id);

create table paf_gu_params (
	gear_user_id	nvarchar(40)	not null,
	tag	nvarchar(42)	not null,
	uparam_value	nvarchar(254)	null
,constraint paf_guparamspk primary key (gear_user_id,tag));


create table paf_user_param (
	user_param_id	nvarchar(40)	not null,
	internal_version	integer	default 0 not null
,constraint paf_userparampk primary key (user_param_id));


create table paf_gr_uparams (
	gear_user_id	nvarchar(40)	not null,
	name	nvarchar(254)	not null,
	user_param_id	nvarchar(40)	not null
,constraint paf_gruparamspk primary key (gear_user_id,user_param_id)
,constraint paf_gr_uparams1_f foreign key (gear_user_id) references paf_gear_user (gear_user_id)
,constraint paf_gr_uparams2_f foreign key (user_param_id) references paf_user_param (user_param_id));

create index paf_grupiddlix on paf_gr_uparams (user_param_id);

create table paf_user_prmvals (
	user_param_id	nvarchar(40)	not null,
	sequence_num	integer	not null,
	param_value	nvarchar(254)	null
,constraint paf_uprmvalspk primary key (user_param_id,sequence_num)
,constraint paf_uprmvals1_f foreign key (user_param_id) references paf_user_param (user_param_id));


create table paf_usr_rgn (
	region_id	nvarchar(40)	not null,
	definition_id	nvarchar(40)	not null,
	internal_version	integer	default 0 not null
,constraint paf_usrrgnpk primary key (region_id));


create table paf_usr_rgn_gr (
	region_id	nvarchar(40)	not null,
	sequence_num	integer	not null,
	gear_id	nvarchar(40)	not null
,constraint paf_usrrgngrpk primary key (region_id,sequence_num));


create table paf_usr_pg (
	page_id	nvarchar(40)	not null,
	user_id	nvarchar(40)	not null,
	source_page_id	nvarchar(40)	null,
	name	nvarchar(254)	null,
	url_name	nvarchar(254)	null,
	folder_id	nvarchar(40)	null,
	community_id	nvarchar(40)	null,
	description	nvarchar(254)	null,
	layout_id	nvarchar(40)	null,
	palette_id	nvarchar(40)	null,
	deleted	tinyint	not null,
	internal_version	integer	default 0 not null,
	creation_date	datetime	null,
	last_modified	datetime	null
,constraint paf_usrrgpk primary key (page_id)
,constraint paf_usrrgdeleted check (deleted in (0,1)));

create index paf_usr_pgusix on paf_usr_pg (user_id,source_page_id);

create table paf_usr_pg_rgn (
	page_id	nvarchar(40)	not null,
	tag	nvarchar(42)	not null,
	region_id	nvarchar(40)	not null
,constraint paf_usrpgrgn primary key (page_id,tag));


create table paf_usr_pgfld (
	folder_id	nvarchar(40)	not null,
	parent_id	nvarchar(40)	null,
	name	nvarchar(254)	not null,
	url_name	nvarchar(254)	not null,
	description	nvarchar(254)	null,
	internal_version	integer	default 0 not null,
	creation_date	datetime	null,
	last_modified	datetime	null
,constraint paf_usrpgfldpk primary key (folder_id));


create table paf_usr_cpgfld (
	folder_id	nvarchar(40)	not null,
	sequence_num	integer	not null,
	child_folder_id	nvarchar(40)	not null
,constraint paf_usrcpgfldpk primary key (folder_id,child_folder_id));


create table paf_usr_ppgfld (
	folder_id	nvarchar(40)	not null,
	sequence_num	integer	not null,
	page_id	nvarchar(40)	not null
,constraint paf_usrppgfldpk primary key (folder_id,page_id));


create table paf_usr_cm (
	community_id	nvarchar(40)	not null,
	user_id	nvarchar(40)	not null,
	source_cm_id	nvarchar(40)	null,
	page_folder_id	nvarchar(40)	not null,
	default_page_id	nvarchar(40)	null,
	internal_version	integer	null,
	creation_date	datetime	null,
	last_modified	datetime	null
,constraint paf_usrcmpk primary key (community_id));

create index paf_usr_cmusix on paf_usr_cm (user_id,source_cm_id);

create table paf_reg_url (
	id	nvarchar(40)	not null,
	regURL	nvarchar(72)	null
,constraint paf_reg_urlpk primary key (id));

commit;


