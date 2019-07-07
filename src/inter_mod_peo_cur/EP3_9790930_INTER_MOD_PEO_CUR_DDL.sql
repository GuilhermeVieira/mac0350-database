DROP DATABASE IF EXISTS peo_cur;
CREATE DATABASE peo_cur;
\c peo_cur;

CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE EXTENSION IF NOT EXISTS citext;

-- DROP ROLE IF EXISTS dba;
CREATE ROLE dba
  WITH SUPERUSER CREATEDB CREATEROLE
  LOGIN ENCRYPTED PASSWORD 'dba1234'
  VALID UNTIL '2020-07-01';

CREATE SCHEMA IF NOT EXISTS admins;
GRANT USAGE ON SCHEMA admins TO dba;

-- DROP DOMAIN IF EXISTS email CASCADE;
CREATE DOMAIN email AS citext
  CHECK ( value ~ '^[a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$' );

CREATE TABLE IF NOT EXISTS b15_REL_AL_CUR (
	al_pe_nusp			int NOT NULL check (al_pe_nusp between 0 and 999999999),
	cur_codigo			int NOT NULL,
	data_ingresso		int NOT NULL check (data_ingresso >= 1827),
	status				char(1) CHECK (status IN ('A','F','D')),
	CONSTRAINT pk_rel_al_cur PRIMARY KEY (al_pe_nusp, cur_codigo, data_ingresso)
);

CREATE TABLE IF NOT EXISTS b19_PLANEJA (
	al_pe_nusp			int NOT NULL check (al_pe_nusp between 0 and 999999999),
	dis_data_inicio		char(4) NOT NULL,
	dis_departamento	char(3) NOT NULL,
	dis_codigo			char(4) NOT NULL,
	ano					char(4) NOT NULL,
	semestre			int NOT NULL check (semestre between 1 and 2),
	CONSTRAINT pk_planeja PRIMARY KEY (al_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo, ano, semestre)
);

CREATE TABLE IF NOT EXISTS b20_MINISTRA (
	pf_pe_nusp			int NOT NULL check (pf_pe_nusp between 0 and 999999999),
	dis_data_inicio		char(4) NOT NULL,
	dis_departamento	char(3) NOT NULL,
	dis_codigo			char(4) NOT NULL,
	CONSTRAINT pk_ministra PRIMARY KEY (pf_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo)
);

CREATE TABLE IF NOT EXISTS b21_ADMINISTRA (
	ad_pe_nusp			int NOT NULL check (ad_pe_nusp between 0 and 999999999),
	cur_codigo			int NOT NULL,
	inicio_gestao		char(4) NOT NULL,
	fim_gestao			char(4),
	CONSTRAINT pk_administra PRIMARY KEY (ad_pe_nusp, cur_codigo, inicio_gestao)
);

CREATE TABLE IF NOT EXISTS b23_CURSA (
	al_pe_nusp				int NOT NULL check (al_pe_nusp between 0 and 999999999),
  of_id             SERIAL,
  nota					real check (nota between 0.0 and 10.0),
	status					char(1) NOT NULL CHECK (status IN ('T','A', 'R', 'I')),
	CONSTRAINT pk_cursa PRIMARY KEY (al_pe_nusp, of_id)
);

CREATE TABLE IF NOT EXISTS b25_REL_OFER_PROF (
  prof_nusp      int NOT NULL check (prof_nusp between 0 and 999999999),
  ofer_id        SERIAL,
  CONSTRAINT pk_rel_ofer_prof PRIMARY KEY (prof_nusp, ofer_id)
);
