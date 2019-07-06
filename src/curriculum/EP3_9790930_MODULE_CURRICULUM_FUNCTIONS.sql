\c curriculum;

--------------------------------------------------------------------------------
-- Create Group
--------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION adiciona_disciplina(data_inicio CHAR(4), departamento CHAR(3), codigo CHAR(4), jupiter_link VARCHAR(100), nome VARCHAR(100), descricao VARCHAR(100), data_fim CHAR(4), creditos_aula INT, creditos_trabalho INT) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b11_DISCIPLINA (data_inicio, departamento, codigo, jupiter_link, nome, descricao, data_fim, creditos_aula, creditos_trabalho) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9);
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION adiciona_modulo(ano CHAR(4), nome VARCHAR(100)) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b12_MODULO (ano, nome) VALUES ($1, $2);
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION adiciona_trilha(nome varchar(100), ano CHAR(4), min_mods INT, min_dis INT) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b13_TRILHA (nome, ano, min_mods, min_dis) VALUES ($1, $2, $3, $4);
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION adiciona_curriculo(codigo INT, curso VARCHAR(100)) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b14_CURRICULO (codigo, curso) VALUES ($1, $2);
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION relaciona_curriculo_trilha(cur_codigo INT, tri_tri_id INT, obrigatoria BOOLEAN) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b16_REL_CUR_TRI (cur_codigo, tri_tri_id, obrigatoria) VALUES ($1, $2, $3);
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION relaciona_trilha_modulo(tri_tri_id INT, mo_mod_id INT, min_creds INT, obrigatorio BOOLEAN, min_dis INT) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b17_TR_MO (tri_tri_id, mo_mod_id, min_creds, obrigatorio, min_dis) VALUES ($1, $2, $3, $4, $5);
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION relaciona_modulo_disciplina(mo_mod_id INT, dis_data_inicio CHAR(4), dis_departamento CHAR(3), dis_codigo CHAR(4), obrigatorio BOOLEAN) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b18_REL_DIS_MOD (mo_mod_id, dis_data_inicio, dis_departamento, dis_codigo, obrigatorio) VALUES ($1, $2, $3, $4, $5);
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION oferece_ministracao(dis_data_inicio CHAR(4), dis_departamento CHAR(3), dis_codigo CHAR(4), semestre INT, ano INT) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b22_OFERECIMENTO (dis_data_inicio, dis_departamento, dis_codigo, semestre, ano) VALUES ($1, $2, $3, $4, $5);
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

--------------------------------------------------------------------------------
-- Update Group
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Delete Group
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Retrieval Group
--------------------------------------------------------------------------------
