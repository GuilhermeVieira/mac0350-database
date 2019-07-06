\c peo_cur;

-- criar função de associação entre oferecimento e professor (remoção do atributo pf_cpf de oferecimento)

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

--------------------------------------------------------------------------------
-- Delete Group
--------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION remove_curso(al_pe_nusp INT, cur_codigo INT) RETURNS VOID
AS $$ BEGIN
        DELETE FROM b15_REL_AL_CUR WHERE b15_REL_AL_CUR.al_pe_nusp=$1 AND b15_REL_AL_CUR.cur_codigo=$2;
      END; $$
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path FROM CURRENT;
