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

-- Adicionar: Planeja, Ministra, Administra, Cursa

CREATE TABLE IF NOT EXISTS b15_REL_AL_CUR (
	al_pe_nusp			int NOT NULL check (al_pe_nusp between 0 and 999999999),
	cur_codigo			int NOT NULL,
	data_ingresso		int NOT NULL check (data_ingresso >= 1827),
	status				char(1) CHECK (status IN ('A','F','D')),
	CONSTRAINT pk_rel_al_cur PRIMARY KEY (al_pe_nusp, cur_codigo, data_ingresso),
	CONSTRAINT fk_rel_al_cur01 FOREIGN KEY (al_pe_nusp)
	REFERENCES b09_ALUNO(pe_nusp) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_rel_al_cur02 FOREIGN KEY (cur_codigo)
	REFERENCES b14_CURRICULO(codigo) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS b25_REL_OFER_PROF (
  prof_nusp      int NOT NULL check (prof_nusp between 0 and 999999999),
  ofer_id        SERIAL,
  CONSTRAINT pk_rel_ofer_prof PRIMARY KEY (prof_nusp, ofer_id)
);
