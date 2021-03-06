


--  @version $Id: //app/portal/version/10.0.3/communities/sql/communities_ddl.xml#2 $$Change: 651448 $

create table fcg_usercomm_rel (
	id	varchar(40)	not null,
	community_id	varchar(40)	not null,
	sequence_num	integer	not null
,constraint fcg_usercomm_pk primary key (id,community_id))


create table fcg_added_mapper (
	id	varchar(40)	not null,
	tstamp	datetime	null,
	favorite_name	varchar(255)	null,
	gear_id	varchar(40)	null,
	community_id	varchar(40)	null,
	user_id	varchar(40)	null,
	msg_type	varchar(255)	null)

create index fcg_addmap_comid on fcg_added_mapper (community_id)
create index fcg_addmap_gearid on fcg_added_mapper (gear_id)
create index fcg_addmap_usrid on fcg_added_mapper (user_id)

create table fcg_remove_mapper (
	id	varchar(40)	not null,
	tstamp	datetime	null,
	favorite_name	varchar(255)	null,
	gear_id	varchar(40)	null,
	community_id	varchar(40)	null,
	user_id	varchar(40)	null,
	msg_type	varchar(255)	null)

create index fcg_remmap_comid on fcg_remove_mapper (community_id)
create index fcg_remmap_gearid on fcg_remove_mapper (gear_id)
create index fcg_remmap_usrid on fcg_remove_mapper (user_id)


go
