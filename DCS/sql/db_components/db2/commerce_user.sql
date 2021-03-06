


--  @version $Id: //product/DCS/version/10.0.3/templates/DCS/sql/commerce_user.xml#2 $$Change: 651448 $

create table dps_credit_card (
	id	varchar(40)	not null,
	credit_card_number	varchar(40)	default null,
	credit_card_type	varchar(40)	default null,
	expiration_month	varchar(20)	default null,
	exp_day_of_month	varchar(20)	default null,
	expiration_year	varchar(20)	default null,
	billing_addr	varchar(40)	default null
,constraint dps_credit_card_p primary key (id));

create index dps_crcdba_idx on dps_credit_card (billing_addr);

create table dcs_user (
	user_id	varchar(40)	not null,
	allow_partial_ship	numeric(1,0)	default null,
	default_creditcard	varchar(40)	default null,
	daytime_phone_num	varchar(30)	default null,
	express_checkout	numeric(1,0)	default null,
	default_carrier	varchar(256)	default null,
	price_list	varchar(40)	default null,
	sale_price_list	varchar(40)	default null
,constraint dcs_user_p primary key (user_id)
,constraint dcs_usrdeflt_cr_f foreign key (default_creditcard) references dps_credit_card (id)
,constraint dcs_user1_c check (allow_partial_ship in (0,1))
,constraint dcs_user2_c check (express_checkout in (0,1)));

create index dcs_usrdcc_idx on dcs_user (default_creditcard);

create table dps_usr_creditcard (
	user_id	varchar(40)	not null,
	tag	varchar(42)	not null,
	credit_card_id	varchar(40)	not null
,constraint dps_usr_creditca_p primary key (user_id,tag)
,constraint dps_usrccredt_cr_f foreign key (credit_card_id) references dps_credit_card (id)
,constraint dps_usrcusr_d_f foreign key (user_id) references dps_user (id));

create index dps_ucccid_idx on dps_usr_creditcard (credit_card_id);
create index dps_uccuid_idx on dps_usr_creditcard (user_id);
commit;


