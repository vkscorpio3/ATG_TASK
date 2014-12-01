// the source file for this section is
// atg/projects/Artemis/sql/db2/RepositoryRoutingManager_DDL.sql

----------------------------------------
-- This file contains create table statements,
-- which will configure your database for use with the
-- SQL Repository based Routing Manager schema.
--
-- This script needs to be manually executed before
-- configuring Dynamo to utilize the GSA Repository
-- based RepositoryRoutingManager component.
--
-- @version $Id: //product/DAS/version/10.0.3/release/EAI/sql/db2/RepositoryRoutingManager_DDL.sql#2 $$Change: 651448 $
--

CREATE TABLE eai_transform (
	id 			VARCHAR(32)	NOT NULL,
	reference 		VARCHAR(255)	WITH DEFAULT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE eai_map (
	id 			VARCHAR(32)	NOT NULL,
	reference 		VARCHAR(255)	WITH DEFAULT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE eai_channel (
	id 			VARCHAR(32)	NOT NULL,
	reference 		VARCHAR(255)	NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE eai_parser (
	id 			VARCHAR(32)	NOT NULL,
	reference 		VARCHAR(255)	WITH DEFAULT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE eai_renderer (
	id 			VARCHAR(32)	NOT NULL,
	reference 		VARCHAR(255)	WITH DEFAULT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE eai_route (
	id 			VARCHAR(32)	NOT NULL,
	type 			INTEGER	NOT NULL,
	name 			VARCHAR(32)	WITH DEFAULT NULL,
	jms_type 		VARCHAR(255)	WITH DEFAULT NULL,
	channel_id 		VARCHAR(32)	NOT NULL REFERENCES eai_channel(id),
	PRIMARY KEY(id)
);

CREATE TABLE eai_transform_list (
	route_id 		VARCHAR(32)	NOT NULL REFERENCES eai_route(id),
	idx 			INTEGER	NOT NULL,
	transform_id 		VARCHAR(32)	WITH DEFAULT NULL REFERENCES eai_transform(id),
	PRIMARY KEY(route_id, idx)
);

CREATE INDEX eai_transform_list_route_idx ON eai_transform_list(route_id);

CREATE TABLE eai_map_list (
	route_id 		VARCHAR(32)	NOT NULL REFERENCES eai_route(id),
	idx 			INTEGER	NOT NULL,
	map_id 			VARCHAR(32)	WITH DEFAULT NULL REFERENCES eai_map(id),
	PRIMARY KEY(route_id, idx)
);

CREATE INDEX eai_map_list_route_idx ON eai_map_list(route_id);

CREATE TABLE eai_outgoing (
	route_id 		VARCHAR(32)	NOT NULL REFERENCES eai_route(id),
	render_id 		VARCHAR(32)	WITH DEFAULT NULL REFERENCES eai_renderer(id),
	PRIMARY KEY(route_id)
);

CREATE INDEX eai_outgoing_route_idx ON eai_outgoing(route_id);

CREATE TABLE eai_incoming (
	route_id 		VARCHAR(32)	NOT NULL REFERENCES eai_route(id),
	parser_id 		VARCHAR(32)	WITH DEFAULT NULL REFERENCES eai_parser(id),
	PRIMARY KEY(route_id)
);

CREATE INDEX eai_incoming_route_idx ON eai_incoming(route_id);

COMMIT;