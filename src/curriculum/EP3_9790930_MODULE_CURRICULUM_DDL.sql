DROP DATABASE IF EXISTS curriculum;
CREATE DATABASE curriculum;
\c curriculum;

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


CREATE TABLE IF NOT EXISTS b11_DISCIPLINA (
	data_inicio			char(4) NOT NULL,
	departamento		char(3) NOT NULL,
	codigo				char(4) NOT NULL,
	jupiter_link		varchar(100),
	nome				varchar(100),
	descricao			varchar(100),
	data_fim			char(4),
	creditos_aula		INT,
	creditos_trabalho	INT,
	CONSTRAINT pk_disciplina PRIMARY KEY (data_inicio, departamento, codigo)
);

CREATE TABLE IF NOT EXISTS b12_MODULO (
	mod_id 			SERIAL,
	ano 			char(4) NOT NULL,
	nome			varchar(100) NOT NULL,
	CONSTRAINT pk_modulo PRIMARY KEY (mod_id)
);

CREATE TABLE IF NOT EXISTS b13_TRILHA (
	tri_id				SERIAL,
	nome				varchar(100) NOT NULL,
	ano					char(4) NOT NULL,
	min_mods			int NOT NULL check (min_mods between 0 and 1000),
	min_dis				int NOT NULL check (min_dis between 0 and 1000),
	CONSTRAINT pk_trilha PRIMARY KEY (tri_id)
);

CREATE TABLE IF NOT EXISTS b14_CURRICULO (
	codigo				int NOT NULL,
	curso				varchar(100) NOT NULL,
	CONSTRAINT pk_curriculo PRIMARY KEY (codigo)
);

CREATE TABLE IF NOT EXISTS b16_REL_CUR_TRI (
	cur_codigo			int NOT NULL,
	tri_tri_id			int NOT NULL,
	obrigatoria			BOOLEAN NOT NULL,
	CONSTRAINT pk_rel_cur_tri PRIMARY KEY (cur_codigo, tri_tri_id),
	CONSTRAINT fk_rel_cur_tri01 FOREIGN KEY (tri_tri_id)
	REFERENCES b13_TRILHA(tri_id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_rel_cur_tri02 FOREIGN KEY (cur_codigo)
	REFERENCES b14_CURRICULO(codigo) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS b17_TR_MO (
	tri_tri_id			int NOT NULL,
	mo_mod_id			int NOT NULL,
	min_creds			int NOT NULL check (min_creds between 0 and 1000),
	obrigatorio			BOOLEAN NOT NULL,
	min_dis				int NOT NULL check (min_dis between 0 and 1000),
	CONSTRAINT pk_tr_mo PRIMARY KEY (tri_tri_id, mo_mod_id),
	CONSTRAINT fk_tr_mo01 FOREIGN KEY (tri_tri_id)
		REFERENCES b13_TRILHA(tri_id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_rtr_mo02 FOREIGN KEY (mo_mod_id)
		REFERENCES b12_MODULO(mod_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS b18_REL_DIS_MOD (
	mo_mod_id			int NOT NULL,
	dis_data_inicio		char(4) NOT NULL,
	dis_departamento	char(3) NOT NULL,
	dis_codigo			char(4) NOT NULL,
	obrigatorio			BOOLEAN NOT NULL,
	CONSTRAINT pk_rel_dis_mod PRIMARY KEY (mo_mod_id, dis_data_inicio, dis_departamento, dis_codigo),
	CONSTRAINT fk_rel_dis_mod01 FOREIGN KEY (mo_mod_id)
		REFERENCES b12_MODULO(mod_id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_rel_dis_mod02 FOREIGN KEY (dis_data_inicio, dis_departamento, dis_codigo)
		REFERENCES b11_DISCIPLINA(data_inicio, departamento, codigo) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS b22_OFERECIMENTO (
  ofer_id           SERIAL,
	dis_data_inicio		char(4) NOT NULL,
	dis_departamento	char(3) NOT NULL,
	dis_codigo			char(4) NOT NULL,
	semestre			int NOT NULL check (semestre between 1 and 2),
	ano					int NOT NULL check (ano >= 1827),
  CONSTRAINT pk_oferecimento PRIMARY KEY (ofer_id),
	CONSTRAINT sk_oferecimento UNIQUE (dis_data_inicio, dis_departamento, dis_codigo, semestre, ano),
	CONSTRAINT fk_oferecimento02 FOREIGN KEY (dis_data_inicio, dis_departamento, dis_codigo)
	  REFERENCES b11_DISCIPLINA(data_inicio, departamento, codigo) ON DELETE CASCADE ON UPDATE CASCADE
);
