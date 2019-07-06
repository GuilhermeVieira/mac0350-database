DROP DATABASE IF EXISTS people;
CREATE DATABASE people;
\c people;

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

CREATE TABLE IF NOT EXISTS b05_PESSOA (
	nusp 				int NOT NULL check (nusp between 0 and 999999999),
	pnome 				varchar(280),
	snome 				varchar(280),
	CONSTRAINT pk_pessoa PRIMARY KEY (nusp)
);

CREATE TABLE IF NOT EXISTS b07_PROFESSOR (
	pe_nusp 			int NOT NULL check (pe_nusp between 0 and 999999999),
	status				char(2) CHECK (status IN ('ap','at','in')),
	email				email,
	sala 				varchar(15),
	site				varchar(50),
	CONSTRAINT pk_professor PRIMARY KEY (pe_nusp),
	CONSTRAINT sk_professor UNIQUE (email),
	CONSTRAINT tk_professor UNIQUE (site),
	CONSTRAINT fk_professor FOREIGN KEY (pe_nusp)
		REFERENCES b05_PESSOA(nusp) ON DELETE CASCADE ON UPDATE CASCADE

);

CREATE TABLE IF NOT EXISTS b09_ALUNO (
	pe_nusp 			int NOT NULL check (pe_nusp between 0 and 999999999),
	CONSTRAINT pk_aluno PRIMARY KEY (pe_nusp),
	CONSTRAINT fk_aluno FOREIGN KEY (pe_nusp)
		REFERENCES b05_PESSOA(nusp) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS b10_ADMINISTRADOR (
	pe_nusp 			int NOT NULL check (pe_nusp between 0 and 999999999),
	email				email,
	CONSTRAINT pk_administrador PRIMARY KEY (pe_nusp),
	CONSTRAINT sk_administrador UNIQUE (email),
	CONSTRAINT fk_administrador FOREIGN KEY (pe_nusp)
		REFERENCES b05_PESSOA(nusp) ON DELETE CASCADE ON UPDATE CASCADE
);
