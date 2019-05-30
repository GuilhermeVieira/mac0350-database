CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE EXTENSION IF NOT EXISTS citext;

CREATE ROLE dba
	WITH SUPERUSER CREATEDB CREATEROLE
	LOGIN ENCRYPTED PASSWORD 'dba1234'
	VALID UNTIL '2019-07-01';
CREATE SCHEMA IF NOT EXISTS admins;
GRANT admins TO dba;

DROP DOMAIN IF EXISTS email CASCADE;
CREATE DOMAIN email AS citext
  CHECK ( value ~ '^[a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$' );


DROP TABLE IF EXISTS users;
CREATE TABLE users (
	us_id       SERIAL,
	us_email    email,
	us_password TEXT NOT NULL,
	CONSTRAINT pk_user PRIMARY KEY (us_id),
	CONSTRAINT sk_user UNIQUE (us_email)
);

DROP TABLE IF EXISTS b01_PERFIL;
CREATE TABLE b01_PERFIL (
	tipo				varchar(280) NOT NULL,
	CONSTRAINT pk_perfil PRIMARY KEY (tipo)

);

DROP TABLE IF EXISTS b02_SERVICO;
CREATE TABLE b02_SERVICO (
	id SERIAL,
	nome         		varchar(280),
	descrição   		varchar(280),
	CONSTRAINT pk_SERVICO PRIMARY KEY (id)
);

DROP TABLE IF EXISTS b03_PF_SE;
CREATE TABLE b03_PF_SE (
	pf_tipo 			varchar(280),
	se_id 				int,
	CONSTRAINT pk_pf_se PRIMARY KEY (se_id, pf_tipo),
	CONSTRAINT fk_pf_se1 FOREIGN KEY (se_id)
		REFERENCES b02_SERVICO(id),
	CONSTRAINT fk_pf_se2 FOREIGN KEY (pf_tipo)
		REFERENCES b01_PERFIL(tipo)
);

DROP TABLE IF EXISTS b04_US_PF;
CREATE TABLE b04_US_PF (
	us_id 				int,
	pf_tipo 			varchar(280),
	CONSTRAINT pk_us_pf PRIMARY KEY (us_id, pf_tipo),
	CONSTRAINT fk_us_pf2 FOREIGN KEY (us_id)
		REFERENCES users(us_id),
	CONSTRAINT fk_us_pf3 FOREIGN KEY (pf_tipo)
		REFERENCES b01_PERFIL(tipo)

);

DROP TABLE IF EXISTS b05_PESSOA;
CREATE TABLE b05_PESSOA (
	nusp 				int NOT NULL check (nusp between 0 and 999999999),
	us_id 				int,
	pnome 				varchar(280),
	snome 				varchar(280),
	CONSTRAINT pk_pessoa PRIMARY KEY (nusp),
	CONSTRAINT fk_pessoa FOREIGN KEY (us_id)
		REFERENCES users(us_id)
);

DROP TABLE IF EXISTS b07_PROFESSOR;
CREATE TABLE b07_PROFESSOR (
	pe_nusp 			int NOT NULL check (pe_nusp between 0 and 999999999),
	status				char(2) CHECK (status IN ('ap','at','in')),
	email				email,
	sala 				varchar(15),
	site				varchar(50),
	CONSTRAINT pk_professor PRIMARY KEY (pe_nusp),
	CONSTRAINT fk_professor FOREIGN KEY (pe_nusp)
		REFERENCES b05_PESSOA(nusp)

);

DROP TABLE IF EXISTS b09_ALUNO;
CREATE TABLE b09_ALUNO (
	pe_nusp 			int NOT NULL check (pe_nusp between 0 and 999999999),
	CONSTRAINT pk_aluno PRIMARY KEY (pe_nusp),
	CONSTRAINT fk_aluno FOREIGN KEY (pe_nusp)
		REFERENCES b05_PESSOA(nusp)
);

DROP TABLE IF EXISTS b10_ADMINISTRADOR;
CREATE TABLE b10_ADMINISTRADOR (
	pe_nusp 			int NOT NULL check (pe_nusp between 0 and 999999999),
	email				email,
	CONSTRAINT pk_administrador PRIMARY KEY (pe_nusp),
	CONSTRAINT fk_administrador FOREIGN KEY (pe_nusp)
		REFERENCES b05_PESSOA(nusp)
);

DROP TABLE IF EXISTS b11_DISCIPLINA;
CREATE TABLE b11_DISCIPLINA (
	data_inicio			char(4) NOT NULL,
	departamento		char(3) NOT NULL,
	codigo				char(4) NOT NULL,
	jupiter_link		varchar(100),
	nome				varchar(100),
	descricao			varchar(100),
	data_fim			char(4) NOT NULL,
	CONSTRAINT pk_disciplina PRIMARY KEY (data_inicio, departamento, codigo)

);

DROP TABLE IF EXISTS b12_MODULO;
CREATE TABLE b12_MODULO (
	mod_id 			SERIAL,
	ano 			char(4) NOT NULL,
	nome			varchar(100) NOT NULL,
	CONSTRAINT pk_modulo PRIMARY KEY (mod_id)
);

DROP TABLE IF EXISTS b13_TRILHA;
CREATE TABLE b13_TRILHA (
	tri_id				SERIAL,
	nome				varchar(100) NOT NULL,
	ano					char(4) NOT NULL,
	min_mods			int NOT NULL check (min_mods between 0 and 1000),
	min_dis				int NOT NULL check (min_dis between 0 and 1000),
	CONSTRAINT pk_trilha PRIMARY KEY (tri_id)
);

DROP TABLE IF EXISTS b14_CURRICULO;
CREATE TABLE b14_CURRICULO (
	codigo				int NOT NULL,
	curso				varchar(100) NOT NULL,
	CONSTRAINT pk_curriculo PRIMARY KEY (codigo)
);

DROP TABLE IF EXISTS b15_REL_AL_CUR;
CREATE TABLE b15_REL_AL_CUR (
	al_pe_nusp			int NOT NULL check (al_pe_nusp between 0 and 999999999),
	cur_codigo			int NOT NULL,
	data_ingresso		int NOT NULL check (data_ingresso >= 1827),
	status				char(1) CHECK (status IN ('A','F','D')),
	CONSTRAINT pk_rel_al_cur PRIMARY KEY (al_pe_nusp, cur_codigo),
	CONSTRAINT fk_rel_al_cur01 FOREIGN KEY (al_pe_nusp)
		REFERENCES b09_ALUNO(pe_nusp),
	CONSTRAINT fk_rel_al_cur02 FOREIGN KEY (cur_codigo)
		REFERENCES b14_CURRICULO(codigo)
	
);

DROP TABLE IF EXISTS b16_REL_CUR_TRI;
CREATE TABLE b16_REL_CUR_TRI (
	cur_codigo			int NOT NULL,
	tri_tri_id			int NOT NULL,
	obrigatoria			BOOLEAN NOT NULL,
	CONSTRAINT pk_rel_cur_tri PRIMARY KEY (cur_codigo, tri_tri_id),
	CONSTRAINT fk_rel_cur_tri01 FOREIGN KEY (tri_tri_id)
		REFERENCES b13_TRILHA(tri_id),
	CONSTRAINT fk_rel_cur_tri02 FOREIGN KEY (cur_codigo)
		REFERENCES b14_CURRICULO(codigo)
);

DROP TABLE IF EXISTS b17_TR_MO;
CREATE TABLE b17_TR_MO (
	tri_tri_id			int NOT NULL,
	mo_mod_id			int NOT NULL,
	min_creds			int NOT NULL check (min_creds between 0 and 1000),
	obrigatorio			BOOLEAN NOT NULL,
	min_dis				int NOT NULL check (min_dis between 0 and 1000),
	CONSTRAINT pk_tr_mo PRIMARY KEY (tri_tri_id, mo_mod_id),
	CONSTRAINT fk_tr_mo01 FOREIGN KEY (tri_tri_id)
		REFERENCES b13_TRILHA(tri_id),
	CONSTRAINT fk_rtr_mo02 FOREIGN KEY (mo_mod_id)
		REFERENCES b12_MODULO(mod_id)
);

DROP TABLE IF EXISTS b18_REL_DIS_MOD;
CREATE TABLE b18_REL_DIS_MOD (
	mo_mod_id			int NOT NULL,
	dis_data_inicio		char(4) NOT NULL,
	dis_departamento	char(3) NOT NULL,
	dis_codigo			char(4) NOT NULL,
	obrigatorio			BOOLEAN NOT NULL,
	CONSTRAINT pk_rel_dis_mod PRIMARY KEY (mo_mod_id, dis_data_inicio, dis_departamento, dis_codigo),
	CONSTRAINT fk_rel_dis_mod01 FOREIGN KEY (mo_mod_id)
		REFERENCES b12_MODULO(mod_id),
	CONSTRAINT fk_rel_dis_mod02 FOREIGN KEY (dis_data_inicio, dis_departamento, dis_codigo)
		REFERENCES b11_DISCIPLINA(data_inicio, departamento, codigo)
);

DROP TABLE IF EXISTS b19_PLANEJA;
CREATE TABLE b19_PLANEJA (
	al_pe_nusp			int NOT NULL check (al_pe_nusp between 0 and 999999999),
	dis_data_inicio		char(4) NOT NULL,
	dis_departamento	char(3) NOT NULL,
	dis_codigo			char(4) NOT NULL,
	ano					char(4) NOT NULL,
	semestre			int NOT NULL check (semestre between 1 and 2),
	CONSTRAINT pk_planeja PRIMARY KEY (al_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo),
	CONSTRAINT fk_planeja01 FOREIGN KEY (al_pe_nusp)
		REFERENCES b09_ALUNO(pe_nusp),
	CONSTRAINT fk_planeja02 FOREIGN KEY (dis_data_inicio, dis_departamento, dis_codigo)
		REFERENCES b11_DISCIPLINA(data_inicio, departamento, codigo)
);

DROP TABLE IF EXISTS b20_MINISTRA;
CREATE TABLE b20_MINISTRA (
	pf_pe_nusp			int NOT NULL check (pf_pe_nusp between 0 and 999999999),
	dis_data_inicio		char(4) NOT NULL,
	dis_departamento	char(3) NOT NULL,
	dis_codigo			char(4) NOT NULL,
	CONSTRAINT pk_ministra PRIMARY KEY (pf_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo),
	CONSTRAINT fk_ministra01 FOREIGN KEY (pf_pe_nusp)
		REFERENCES b07_PROFESSOR(pe_nusp),
	CONSTRAINT fk_ministra02 FOREIGN KEY (dis_data_inicio, dis_departamento, dis_codigo)
		REFERENCES b11_DISCIPLINA(data_inicio, departamento, codigo)
);

DROP TABLE IF EXISTS b21_ADMINISTRA;
CREATE TABLE b21_ADMINISTRA (
	ad_pe_nusp			int NOT NULL check (ad_pe_nusp between 0 and 999999999),
	cur_codigo			int NOT NULL,
	inicio_gestao		char(4) NOT NULL,
	fim_gestao			char(4),
	CONSTRAINT pk_adminsitra PRIMARY KEY (ad_pe_nusp, cur_codigo),
	CONSTRAINT fk_adminsitra01 FOREIGN KEY (ad_pe_nusp)
		REFERENCES b10_ADMINISTRADOR(pe_nusp),
	CONSTRAINT fk_adminsitra02 FOREIGN KEY (cur_codigo)
		REFERENCES b14_CURRICULO(codigo)
);

DROP TABLE IF EXISTS b22_OFERECIMENTO;
CREATE TABLE b22_OFERECIMENTO (
	pf_pe_nusp			int NOT NULL check (pf_pe_nusp between 0 and 999999999),
	dis_data_inicio		char(4) NOT NULL,
	dis_departamento	char(3) NOT NULL,
	dis_codigo			char(4) NOT NULL,
	semestre			int NOT NULL check (semestre between 1 and 2),
	ano					int NOT NULL check (ano >= 1827),
	CONSTRAINT pk_oferecimento PRIMARY KEY (pf_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo, semestre, ano),
	CONSTRAINT fk_oferecimento01 FOREIGN KEY (pf_pe_nusp)
		REFERENCES b07_PROFESSOR(pe_nusp),
	CONSTRAINT fk_oferecimento02 FOREIGN KEY (dis_data_inicio, dis_departamento, dis_codigo)
		REFERENCES b11_DISCIPLINA(data_inicio, departamento, codigo)
);

DROP TABLE IF EXISTS b23_CURSA;
CREATE TABLE b23_CURSA (
	al_pe_nusp				int NOT NULL check (al_pe_nusp between 0 and 999999999),
	of_pf_pe_nusp			int NOT NULL check (of_pf_pe_nusp between 0 and 999999999),
	of_dis_data_inicio		char(4) NOT NULL,
	of_dis_departamento		char(3) NOT NULL,
	of_dis_codigo			char(4) NOT NULL,
	of_semestre				int NOT NULL check (of_semestre between 1 and 2),
	of_ano					int NOT NULL check (of_ano >= 1827),
	nota					real check (nota between 0.0 and 10.0),
	status					char(1) NOT NULL CHECK (status IN ('T','A', 'R', 'I')),
	CONSTRAINT pk_cursa PRIMARY KEY (al_pe_nusp, of_pf_pe_nusp, of_dis_data_inicio, of_dis_departamento, of_dis_codigo),
	CONSTRAINT fk_cursa01 FOREIGN KEY (al_pe_nusp)
		REFERENCES b09_ALUNO(pe_nusp),
	CONSTRAINT fk_cursa03 FOREIGN KEY (of_pf_pe_nusp, of_dis_data_inicio, of_dis_departamento, of_dis_codigo, of_semestre, of_ano)
		REFERENCES b22_OFERECIMENTO(pf_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo, semestre, ano)
);




