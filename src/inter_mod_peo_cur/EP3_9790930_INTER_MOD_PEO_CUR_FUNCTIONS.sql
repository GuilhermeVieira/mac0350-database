\c peo_cur;

-- criar função de associação entre oferecimento e professor (remoção do atributo pf_cpf de oferecimento)

--------------------------------------------------------------------------------
-- Create Group
--------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION inicia_curso(al_pe_nusp INT, cur_codigo INT, data_ingresso INT) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b15_REL_AL_CUR (al_pe_nusp, cur_codigo, data_ingresso, status) VALUES ($1, $2, $3, 'A');
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION planeja_disciplina(al_nusp INT, dis_data_inicio CHAR(4), dis_departamento CHAR(3), dis_codigo CHAR(4), pl_ano CHAR(4), pl_semestre INT) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b19_PLANEJA (al_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo, ano, semestre) VALUES ($1, $2, $3, $4, $5, $6);
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION inicia_ministracao(pf_pe_nusp INT, dis_data_inicio CHAR(4), dis_departamento CHAR(3), dis_codigo CHAR(4)) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b20_MINISTRA (pf_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo) VALUES ($1, $2, $3, $4);
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION inicia_administracao(ad_pe_nusp INT, cur_codigo INT, inicio_gestao CHAR(4)) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b21_ADMINISTRA (ad_pe_nusp, cur_codigo, inicio_gestao, fim_gestao) VALUES ($1, $2, $3, NULL);
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION oferece_ministracao(pe_nusp INT, dis_data_inicio CHAR(4), dis_departamento CHAR(3), dis_codigo CHAR(4), semestre INT, ano INT) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b22_OFERECIMENTO (pf_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo, semestre, ano) VALUES ($1, $2, $3, $4, $5, $6);
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION cursa_disciplina(al_nusp INT, ofer_id INT, nota REAL, status CHAR(1)) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b23_CURSA (al_pe_nusp, of_id, nota, status) VALUES ($1, $2, $3, $4);
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION relaciona_ofer_prof(INOUT prof_nusp int, INOUT ofer_id int)
    RETURNS SETOF RECORD AS
    $$
      INSERT INTO b25_REL_OFER_PROF(prof_nusp, ofer_id) VALUES ($1, $2)
      RETURNING (prof_nusp, ofer_id)
    $$
    LANGUAGE sql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

--------------------------------------------------------------------------------
-- Update Group
--------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION muda_status_aluno_no_curso(al_pe_nusp INT, cur_codigo INT, data_ingresso INT, status CHAR(1)) RETURNS VOID
    AS $$ BEGIN
        UPDATE b15_REL_AL_CUR SET status=$4 WHERE b15_REL_AL_CUR.al_pe_nusp=$1 AND b15_REL_AL_CUR.cur_codigo=$2 AND b15_REL_AL_CUR.data_ingresso=$3;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION atualiza_encerramento_administracao(ad_pe_nusp INT, cur_codigo INT, inicio_gestao CHAR(4), fim_gestao CHAR(4)) RETURNS VOID
    AS $$ BEGIN
        UPDATE b21_ADMINISTRA SET fim_gestao=$4 WHERE b21_ADMINISTRA.ad_pe_nusp=$1 AND b21_ADMINISTRA.cur_codigo=$2 AND b21_ADMINISTRA.inicio_gestao=$3;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION atualiza_nota_disciplina(al_nusp INT, of_id INT, nota REAL) RETURNS VOID
    AS $$ BEGIN
        UPDATE b23_CURSA SET nota=$3 WHERE al_pe_nusp=$1 AND of_id=$2;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION atualiza_status_disciplina(al_nusp INT, of_id INT, status CHAR(1)) RETURNS VOID
    AS $$ BEGIN
        UPDATE b23_CURSA SET status=$3 WHERE al_pe_nusp=$1 AND of_id=$2;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

--------------------------------------------------------------------------------
-- Delete Group
--------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION remove_curso(al_pe_nusp INT, cur_codigo INT, data_ingresso INT) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b15_REL_AL_CUR WHERE b15_REL_AL_CUR.al_pe_nusp=$1 AND b15_REL_AL_CUR.cur_codigo=$2 AND b15_REL_AL_CUR.data_ingresso=$3;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION remove_planejamento(al_nusp INT, dis_data_inicio CHAR(4), dis_departamento CHAR(3), dis_codigo CHAR(4)) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b19_PLANEJA WHERE al_pe_nusp=$1 AND b19_PLANEJA.dis_data_inicio=$2 AND b19_PLANEJA.dis_departamento=$3 AND b19_PLANEJA.dis_codigo=$4;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION remove_ministracao(pf_pe_nusp INT, dis_data_inicio CHAR(4), dis_departamento CHAR(3), dis_codigo CHAR(4)) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b20_MINISTRA WHERE b20_MINISTRA.pf_pe_nusp=$1 AND b20_MINISTRA.dis_data_inicio=$2 AND b20_MINISTRA.dis_departamento=$3 AND b20_MINISTRA.dis_codigo=$4;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION remove_administracao(ad_pe_nusp INT, cur_codigo INT, inicio_gestao CHAR(4)) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b21_ADMINISTRA WHERE b21_ADMINISTRA.ad_pe_nusp=$1 AND b21_ADMINISTRA.cur_codigo=$2 AND b21_ADMINISTRA.inicio_gestao=$3;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION remove_cursa(al_nusp INT, ofer_id INT) RETURNS VOID
  AS $$ BEGIN
      DELETE FROM b23_CURSA WHERE al_pe_nusp=$1 AND of_id=$2;
  END; $$
  LANGUAGE plpgsql
  SECURITY DEFINER
  SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION remove_rel_ofer_prof(IN nusp INT, IN of_id INT) RETURNS VOID
  AS $$ BEGIN
      DELETE FROM b25_REL_OFER_PROF WHERE (prof_nusp, ofer_id) = ($1, $2);
  END; $$
  LANGUAGE plpgsql
  SECURITY DEFINER
  SET search_path FROM CURRENT;

--------------------------------------------------------------------------------
-- Retrieval Group
--------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION pega_curriculos_admin(pe_nusp INT)
RETURNS TABLE (_codigo INT, _inicio_gestao CHAR(4), _fim_gestao CHAR(4))
    AS $$ BEGIN
        RETURN QUERY
        SELECT (cur_codigo, inicio_gestao, fim_gestao) FROM b21_ADMINISTRA WHERE ad_pe_nusp = $1;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION pega_curriculos_aluno(pe_nusp INT)
RETURNS TABLE (_cur_codigo INT, _data_ingresso INT, _status char(1))
    AS $$ BEGIN
        RETURN QUERY
        SELECT (cur_codigo, data_ingresso, status) FROM b15_REL_AL_CUR WHERE al_pe_nusp = $1;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION pega_ofers_ids_professor(pe_nusp INT)
RETURNS TABLE (_ofer_id INT)
    AS $$ BEGIN
        RETURN QUERY
        SELECT ofer_id FROM b25_REL_OFER_PROF WHERE prof_nusp = $1;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION pega_disciplinas_cursadas(al_nusp INT)
RETURNS TABLE (of_id INT, nota REAL, status CHAR(1))
    AS $$ BEGIN
        RETURN QUERY
        SELECT b23_CURSA.of_id, b23_CURSA.nota, b23_CURSA.status FROM b23_CURSA WHERE al_pe_nusp = $1;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION pega_lista_de_desejos(al_nusp INT)
RETURNS TABLE (departamento CHAR(3), codigo CHAR(4), data_inicio CHAR(4), ano_planejado CHAR(4), semestre_planejado INT)
    AS $$ BEGIN
        RETURN QUERY
        SELECT dis_departamento, dis_codigo, dis_data_inicio, ano, semestre
        FROM b19_PLANEJA
        WHERE al_pe_nusp = $1;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION pega_alunos_em_curriculo(codigo INT)
RETURNS TABLE (nusp INT, data_ingresso INT, status CHAR(1))
    AS $$ BEGIN
        RETURN QUERY
        SELECT (al_pe_nusp, data_ingresso, status) FROM b15_REL_AL_CUR WHERE cur_codigo = $1;
        END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;
