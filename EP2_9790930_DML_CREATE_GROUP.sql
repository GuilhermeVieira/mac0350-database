CREATE OR REPLACE FUNCTION adciona_pessoa(nusp INT, us_login INT, pnome VARCHAR(280), snome VARCHAR(280)) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b05_PESSOA (nusp, us_login, pnome, snome) VALUES ($1, $2, $3);
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION vira_professor(pe_nusp INT, status CHAR(2), email email, sala VARCHAR(15), site VARCHAR(50)) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b07_PROFESSOR (pe_nusp, status, email, sala, site) VALUES ($1, $2, $3, $4, $5);
        -- Dar acesso ao perfil de professor
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION vira_aluno(al_nusp INT) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b09_ALUNO (al_nusp) VALUES ($1);
        -- Dar acesso ao perfil de aluno
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION vira_admin(pe_nusp INT, email email) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b10_ADMINISTRADOR (pe_nusp, email) VALUES ($1, $2);
        -- Dar acesso ao perfil de admin
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION adiciona_disciplina(data_inicio CHAR(4), departamento CHAR(3), codigo CHAR(4), jupiter_link VARCHAR(100), nome VARCHAR(100), descricao VARCHAR(100)) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b11_DISCIPLINA (data_inicio, departamento, codigo, jupiter_link, nome, descricao, data_fim) VALUES ($1, $2, $3, $4, $5);
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION adiciona_modulo(ano CHAR(4), nome VARCHAR(100)) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b12_MODULO (ano, nome) VALUES ($1, $2);
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION adiciona_trilha(nome varchar(100), ano CHAR(4), min_mods INT, min_dis INT) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b13_TRILHA (nome, ano, min_mods, min_dis) VALUES ($1, $2, $3, $4);
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION adiciona_curriculo(codigo INT, curso VARCHAR(100)) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b14_CURRICULO (codigo, curso) VALUES ($1, $2);
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION inicia_curso(al_pe_nusp INT, cur_codigo INT, data_ingresso CHAR(4)) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b15_REL_AL_CUR (al_pe_nusp, cur_codigo, data_ingresso, status) VALUES ($1, $2, $3, 'A');
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION relaciona_curriculo_trilha(cur_codigo INT, tri_tri_id INT, obrigatoria BOOLEAN) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b16_REL_CUR_TRI (cur_codigo, tri_tri_id, obrigatoria) VALUES ($1, $2, $3);
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION relaciona_trilha_modulo(tri_tri_id INT, mo_mod_id INT, min_creds INT, obrigatorio BOOLEAN, min_dis INT) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b17_TR_MO (tri_tri_id, mo_mod_id, min_creds, obrigatorio, min_dis) VALUES ($1, $2, $3, $4, $5);
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION relaciona_modulo_disciplina(mo_mod_id INT, dis_data_inicio CHAR(4), dis_departamento CHAR(3), dis_codigo CHAR(4), obrigatorio BOOLEAN) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b18_REL_DIS_MOD (mo_mod_id, dis_data_inicio, dis_departamento, dis_codigo, obrigatorio) VALUES ($1, $2, $3, $4, $5);
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION planeja_disciplina(al_nusp INT, dis_data_inicio CHAR(4), dis_departamento CHAR(3), dis_codigo CHAR(4), pl_ano CHAR(4), pl_semestre INT) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b19_PLANEJA (al_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo, ano, semestre) VALUES ($1, $2, $3, $4, $5, $6);
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION inicia_ministracao(pf_pe_nusp INT, dis_data_inicio CHAR(4), dis_departamento CHAR(3), dis_codigo CHAR(4)) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b20_MINISTRA (pf_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo) VALUES ($1, $2, $3, $4);
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION inicia_administracao(ad_pe_nusp INT, cur_codigo INT) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b21_ADMINISTRA (ad_pe_nusp, cur_codigo, inicio_gestao, fim_gestao) VALUES ($1, $2, (SELECT EXTRACT(YEAR FROM CURRENT_DATE))::CHAR(4), NULL);
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION oferece_ministracao(pe_nusp INT, dis_data_inicio CHAR(4), dis_departamento CHAR(3), dis_codigo CHAR(4), semestre INT, ano INT) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b22_OFERECIMENTO (pf_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo, semestre, ano) VALUES ($1, $2, $3, $4, $5, $6);
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION cursa_disciplina(al_nusp INT, pe_nusp INT, dis_data_inicio CHAR(4), dis_departamento CHAR(3), dis_codigo CHAR(4), of_semestre INT, of_ano CHAR(4), nota REAL, status CHAR(1)) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b23_CURSA (al_pe_nusp, of_pf_pe_nusp, of_dis_data_inicio, of_dis_departamento, of_dis_codigo, of_semestre, of_ano, nota, status) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9);
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;