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

CREATE TABLE IF NOT EXISTS b25_REL_OFER_PROF (
  prof_nusp      int NOT NULL check (prof_nusp between 0 and 999999999),
  ofer_id        SERIAL,
  CONSTRAINT pk_rel_ofer_prof PRIMARY KEY (prof_nusp, ofer_id)
);
