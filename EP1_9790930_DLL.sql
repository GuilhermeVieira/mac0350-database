CREATE TABLE b0_USUARIO (
	login				varchar(20) NOT NULL,
	senha				varchar(280) NOT NULL,
	data_criacao		timestamp,
	CONSTRAINT pk_usuario PRIMARY KEY (login)
);

CREATE TABLE b00_US_EMAIL (
	us_login       		varchar(20) NOT NULL,
	email 				varchar(280) NOT NULL,
	CONSTRAINT pk_us_email PRIMARY KEY (us_login, email),
	CONSTRAINT fk_us FOREIGN KEY (us_login)
		REFERENCES b0_USUARIO(login)

);

CREATE TABLE b01_PERFIL (
	tipo				varchar(280) NOT NULL,
	CONSTRAINT pk_perfil PRIMARY KEY (tipo)

);

CREATE TABLE b02_SERVICO (
	id SERIAL,
	nome         		varchar(280),
	descrição   		varchar(280),
	CONSTRAINT pk_SERVICO PRIMARY KEY (id)
);

CREATE TABLE b03_PF_SE (
	pf_tipo 			varchar(280),
	se_id 				int,
	CONSTRAINT pk_pf_se PRIMARY KEY (se_id, pf_tipo),
	CONSTRAINT fk_pf_se1 FOREIGN KEY (se_id)
		REFERENCES b02_SERVICO(id),
	CONSTRAINT fk_pf_se2 FOREIGN KEY (pf_tipo)
		REFERENCES b01_PERFIL(tipo)
);

CREATE TABLE b04_US_PF (
	us_login 			varchar(20),
	pf_tipo 			varchar(280),
	CONSTRAINT pk_us_pf PRIMARY KEY (us_login, pf_tipo),
	CONSTRAINT fk_us_pf2 FOREIGN KEY (us_login)
		REFERENCES b0_USUARIO(login),
	CONSTRAINT fk_us_pf3 FOREIGN KEY (pf_tipo)
		REFERENCES b01_PERFIL(tipo)

);

CREATE TABLE b05_PESSOA (
	nusp 				int NOT NULL check (nusp between 0 and 999999999),
	us_login 			varchar(20),
	pnome varchar(280),
	CONSTRAINT pk_pessoa PRIMARY KEY (nusp),
	CONSTRAINT fk_pessoa FOREIGN KEY (us_login)
		REFERENCES b0_USUARIO(login)
);

CREATE TABLE b06_PE_SNOME (
	pe_nusp 			int NOT NULL check (pe_nusp between 0 and 999999999),
	snome 				varchar(280),
	CONSTRAINT pk_pe_snome PRIMARY KEY (pe_nusp, snome),
	CONSTRAINT fk_pe_snome FOREIGN KEY (pe_nusp)
		REFERENCES b05_PESSOA(nusp)
);

CREATE TABLE b07_PROFESSOR (
	pe_nusp 			int NOT NULL check (pe_nusp between 0 and 999999999),
	status				char(2) CHECK (status IN ('ap','at','in')),
	email				varchar(30),
	telefone			char(10),
	sala 				varchar(15),
	site				varchar(50),
	CONSTRAINT pk_professor PRIMARY KEY (pe_nusp),
	CONSTRAINT fk_professor FOREIGN KEY (pe_nusp)
		REFERENCES b05_PESSOA(nusp)

);
CREATE TABLE b08_PF_ESPECIALIZACAO (
	pf_pe_nusp 			int NOT NULL check (pf_pe_nusp between 0 and 999999999),
	status				char(2) CHECK (status IN ('ap','at','in')),
	CONSTRAINT pk_pf_especializacao PRIMARY KEY (pf_pe_nusp, status),
	CONSTRAINT fk_pf_especializacao FOREIGN KEY (pf_pe_nusp)
		REFERENCES b07_PROFESSOR(pe_nusp)
);

CREATE TABLE b09_ALUNO (
	pe_nusp 			int NOT NULL check (pe_nusp between 0 and 999999999),
	CONSTRAINT pk_aluno PRIMARY KEY (pe_nusp),
	CONSTRAINT fk_aluno FOREIGN KEY (pe_nusp)
		REFERENCES b05_PESSOA(nusp)
);

CREATE TABLE b10_ADMINISTRADOR (
	pe_nusp 			int NOT NULL check (pe_nusp between 0 and 999999999),
	email				varchar(30),
	CONSTRAINT pk_administrador PRIMARY KEY (pe_nusp),
	CONSTRAINT fk_administrador FOREIGN KEY (pe_nusp)
		REFERENCES b05_PESSOA(nusp)
);

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
CREATE TABLE b12_MODULO (
	mod_id 			SERIAL,
	ano 			char(4) NOT NULL,
	nome			varchar(100) NOT NULL,
	CONSTRAINT pk_modulo PRIMARY KEY (mod_id)
);

CREATE TABLE b13_TRILHA (
	tri_id				SERIAL,
	nome				varchar(100) NOT NULL,
	ano					char(4) NOT NULL,
	min_mods			int NOT NULL check (min_mods between 0 and 1000),
	min_dis				int NOT NULL check (min_dis between 0 and 1000),
	CONSTRAINT pk_trilha PRIMARY KEY (tri_id)
);

CREATE TABLE b14_CURRICULO (
	codigo				int NOT NULL,
	curso				varchar(100) NOT NULL,
	CONSTRAINT pk_curriculo PRIMARY KEY (codigo)
);

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
CREATE TABLE b16_REL_CUR_TRI (
	cur_codigo			int NOT NULL,
	tri_tri_id			int NOT NULL,
	obrigatoria			BOOLEAN NOT NULL DEFAULT TRUE,
	CONSTRAINT pk_rel_cur_tri PRIMARY KEY (cur_codigo, tri_tri_id),
	CONSTRAINT fk_rel_cur_tri01 FOREIGN KEY (tri_tri_id)
		REFERENCES b13_TRILHA(tri_id),
	CONSTRAINT fk_rel_cur_tri02 FOREIGN KEY (cur_codigo)
		REFERENCES b14_CURRICULO(codigo)
);

CREATE TABLE b17_TR_MO (
	tri_tri_id			int NOT NULL,
	mo_mod_id			int NOT NULL,
	min_creds			int NOT NULL check (min_creds between 0 and 1000),
	obrigatorio			BOOLEAN NOT NULL DEFAULT TRUE,
	min_dis				int NOT NULL check (min_dis between 0 and 1000),
	CONSTRAINT pk_tr_mo PRIMARY KEY (tri_tri_id, mo_mod_id),
	CONSTRAINT fk_tr_mo01 FOREIGN KEY (tri_tri_id)
		REFERENCES b13_TRILHA(tri_id),
	CONSTRAINT fk_rtr_mo02 FOREIGN KEY (mo_mod_id)
		REFERENCES b12_MODULO(mod_id)
);

CREATE TABLE b18_REL_DIS_MOD (
	mo_mod_id			int NOT NULL,
	dis_data_inicio		char(4) NOT NULL,
	dis_departamento	char(3) NOT NULL,
	dis_codigo			char(4) NOT NULL,
	obrigatorio			BOOLEAN NOT NULL DEFAULT TRUE,
	CONSTRAINT pk_rel_dis_mod PRIMARY KEY (mo_mod_id, dis_data_inicio, dis_departamento, dis_codigo),
	CONSTRAINT fk_rel_dis_mod01 FOREIGN KEY (mo_mod_id)
		REFERENCES b12_MODULO(mod_id),
	CONSTRAINT fk_rel_dis_mod02 FOREIGN KEY (dis_data_inicio, dis_departamento, dis_codigo)
		REFERENCES b11_DISCIPLINA(data_inicio, departamento, codigo)
);

CREATE TABLE b19_PLANEJA (
	al_pe_nusp			int NOT NULL check (al_pe_nusp between 0 and 999999999),
	dis_data_inicio		char(4) NOT NULL,
	dis_departamento	char(3) NOT NULL,
	dis_codigo			char(4) NOT NULL,
	ano					char(4) NOT NULL,
	semestre			int NOT NULL check (semestre between 1 and 2),
	prioridade			int NOT NULL check (prioridade >= 0),
	CONSTRAINT pk_planeja PRIMARY KEY (al_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo),
	CONSTRAINT fk_planeja01 FOREIGN KEY (al_pe_nusp)
		REFERENCES b09_ALUNO(pe_nusp),
	CONSTRAINT fk_planeja02 FOREIGN KEY (dis_data_inicio, dis_departamento, dis_codigo)
		REFERENCES b11_DISCIPLINA(data_inicio, departamento, codigo)
);

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

CREATE TABLE b21_ADMINISTRA (
	ad_pe_nusp			int NOT NULL check (ad_pe_nusp between 0 and 999999999),
	cur_codigo			int NOT NULL,
	inicio_gestao		DATE NOT NULL,
	fim_gestao			DATE,
	status				char(1) CHECK (status IN ('A','I')),
	CONSTRAINT pk_adminsitra PRIMARY KEY (ad_pe_nusp, cur_codigo),
	CONSTRAINT fk_adminsitra01 FOREIGN KEY (ad_pe_nusp)
		REFERENCES b10_ADMINISTRADOR(pe_nusp),
	CONSTRAINT fk_adminsitra02 FOREIGN KEY (cur_codigo)
		REFERENCES b14_CURRICULO(codigo)
);

CREATE TABLE b22_OFERECIMENTO (
	pf_pe_nusp			int NOT NULL check (pf_pe_nusp between 0 and 999999999),
	dis_data_inicio		char(4) NOT NULL,
	dis_departamento	char(3) NOT NULL,
	dis_codigo			char(4) NOT NULL,
	semestre			int NOT NULL check (semestre between 1 and 2),
	ano					int NOT NULL check (ano >= 1827),
	sala				varchar(10) NOT NULL,
	horario				varchar(100) NOT NULL,
	local				varchar(30) NOT NULL,
	CONSTRAINT pk_oferecimento PRIMARY KEY (pf_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo, semestre, ano),
	CONSTRAINT fk_oferecimento01 FOREIGN KEY (pf_pe_nusp)
		REFERENCES b07_PROFESSOR(pe_nusp),
	CONSTRAINT fk_oferecimento02 FOREIGN KEY (dis_data_inicio, dis_departamento, dis_codigo)
		REFERENCES b11_DISCIPLINA(data_inicio, departamento, codigo)
);

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




