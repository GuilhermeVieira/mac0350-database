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

CREATE OR REPLACE FUNCTION oferece_ministracao(prof_nusp int, dis_data_inicio CHAR(4), dis_departamento CHAR(3), dis_codigo CHAR(4), semestre INT, ano INT) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b22_OFERECIMENTO (pf_nusp, dis_data_inicio, dis_departamento, dis_codigo, semestre, ano) VALUES ($1, $2, $3, $4, $5, $6);
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

CREATE OR REPLACE FUNCTION remove_disciplina(data_inicio CHAR(4), departamento CHAR(3), codigo CHAR(4)) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b11_DISCIPLINA WHERE b11_DISCIPLINA.data_inicio=$1 AND b11_DISCIPLINA.departamento=$2 AND b11_DISCIPLINA.codigo=$3;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION remove_modulo(mod_id INT) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b12_MODULO WHERE b12_MODULO.mod_id=$1;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION remove_trilha(tri_id INT) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b13_TRILHA WHERE b13_TRILHA.tri_id=$1;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION remove_curriculo(codigo INT) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b14_CURRICULO WHERE b14_CURRICULO.codigo=$1;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION remove_rel_curriculo_trilha(cur_codigo INT, tri_tri_id INT) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b16_REL_CUR_TRI WHERE b16_REL_CUR_TRI.cur_codigo=$1 AND b16_REL_CUR_TRI.tri_tri_id=$2;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION remove_rel_trilha_modulo(tri_tri_id INT, mo_mod_id INT) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b17_TR_MO WHERE b17_TR_MO.tri_tri_id=$1 AND b17_TR_MO.mo_mod_id=$2;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION remove_rel_modulo_disciplina(mo_mod_id INT, dis_data_inicio CHAR(4), dis_departamento CHAR(3), dis_codigo CHAR(4)) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b18_REL_DIS_MOD WHERE b18_REL_DIS_MOD.mo_mod_id=$1 AND b18_REL_DIS_MOD.dis_data_inicio=$2 AND b18_REL_DIS_MOD.dis_departamento=$3 AND b18_REL_DIS_MOD.dis_codigo=$4;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION remove_ministra(pe_nusp INT, dis_data_inicio CHAR(4), dis_departamento CHAR(3), dis_codigo CHAR(4), semestre INT, ano INT) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b22_OFERECIMENTO WHERE pf_nusp=$1 AND b22_OFERECIMENTO.dis_data_inicio=$2 AND b22_OFERECIMENTO.dis_departamento=$3 AND b22_OFERECIMENTO.dis_codigo=$4 AND b22_OFERECIMENTO.semestre=$5 AND b22_OFERECIMENTO.ano=$6;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

--------------------------------------------------------------------------------
-- Retrieval Group
--------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION pega_trilhas_de_curriculo(cur_codigo INT)
  RETURNS TABLE (id INT, nome VARCHAR(100), min_mods INT, min_dis INT, obrigatoria BOOLEAN)
AS $$ BEGIN
        RETURN QUERY
          SELECT b13_TRILHA.tri_id, b13_TRILHA.nome, b13_TRILHA.min_mods, b13_TRILHA.min_dis, b16_REL_CUR_TRI.obrigatoria
          FROM b16_REL_CUR_TRI
          INNER JOIN b13_TRILHA ON tri_id = tri_tri_id
          WHERE b16_REL_CUR_TRI.cur_codigo = $1;
      END; $$
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION pega_modulos_de_trilha(tri_id INT)
  RETURNS TABLE (id INT, nome VARCHAR(100), min_dis INT, min_creds INT, obrigatorio BOOLEAN)
AS $$ BEGIN
        RETURN QUERY
          SELECT b12_MODULO.mod_id, b12_MODULO.nome, b17_TR_MO.min_dis, b17_TR_MO.min_creds, b17_TR_MO.obrigatorio
          FROM b17_TR_MO
          INNER JOIN b12_MODULO ON mod_id = mo_mod_id
          WHERE b17_TR_MO.tri_tri_id = $1;
      END; $$
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION pega_disciplinas_de_modulo(mod_id INT)
  RETURNS TABLE (departamento CHAR(3), codigo CHAR(4), data_inicio CHAR(4), nome VARCHAR(100), obrigatoria BOOLEAN)
AS $$ BEGIN
        RETURN QUERY
          SELECT b11_DISCIPLINA.departamento, b11_DISCIPLINA.codigo, b11_DISCIPLINA.data_inicio, b11_DISCIPLINA.nome, b18_REL_DIS_MOD.obrigatorio
          FROM b18_REL_DIS_MOD
          INNER JOIN b11_DISCIPLINA ON b11_DISCIPLINA.departamento = dis_departamento AND b11_DISCIPLINA.codigo = dis_codigo AND b11_DISCIPLINA.data_inicio = dis_data_inicio
          WHERE b18_REL_DIS_MOD.mo_mod_id = $1;
      END; $$
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION pega_disciplina(departamento CHAR(3), codigo CHAR(4), data_inicio CHAR(4))
  RETURNS TABLE (jupiter_link TEXT, nome varchar(100), descricao varchar(100), data_fim char(4))
AS $$ BEGIN
        RETURN QUERY
          SELECT 'https://uspdigital.usp.br/jupiterweb/obterDisciplina?' || b11_DISCIPLINA.jupiter_link, b11_DISCIPLINA.nome, b11_DISCIPLINA.descricao, b11_DISCIPLINA.data_fim
          FROM b11_DISCIPLINA
          WHERE b11_DISCIPLINA.departamento = $1 AND b11_DISCIPLINA.codigo = $2 AND b11_DISCIPLINA.data_inicio = $3;
      END; $$
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION pega_ofer_id(IN prof_nusp int, IN data_ini char(4), IN departamento char(3), IN codigo char(4), IN semestre int, IN ano int,  OUT ofer_id int)
    RETURNS int AS
    $$
        SELECT ofer_id FROM b22_OFERECIMENTO WHERE (pf_nusp, dis_data_inicio, dis_departamento, dis_codigo, semestre, ano) = ($1, $2, $3, $4, $5, $6)
    $$
    LANGUAGE sql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION pega_ofer_info(IN ofer_id INT, OUT pf_nusp INT, OUT data_ini CHAR(4), OUT departamento CHAR(3), OUT codigo CHAR(4), OUT semestre INT, OUT ano INT, OUT ofer_id INT)
    RETURNS SETOF RECORD AS
    $$
    SELECT (pf_nusp, dis_data_inicio, dis_departamento, dis_codigo, semestre, ano) FROM b22_OFERECIMENTO WHERE ofer_id = $1
    $$
    LANGUAGE sql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION pega_oferecimentos_semestre(of_ano INT, of_semestre INT)
    RETURNS TABLE (of_id INT, departamento CHAR(3), codigo CHAR(4), data_inicio CHAR(4), pf_nusp INT)
    AS $$ BEGIN
        RETURN QUERY
        SELECT ofer_id, dis_departamento, dis_codigo, dis_data_inicio, pf_nusp
        FROM b22_OFERECIMENTO
        WHERE ano = $1 AND semestre = $2;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;
