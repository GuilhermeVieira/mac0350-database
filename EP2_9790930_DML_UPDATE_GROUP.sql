CREATE OR REPLACE FUNCTION muda_pnoma(nusp INT, pnome VARCHAR(280)) RETURNS VOID
    AS $$ BEGIN
        UPDATE b05_PESSOA SET pnome=$2 WHERE nusp=$1;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION muda_snome(nusp INT, snome VARCHAR(280)) RETURNS VOID
    AS $$ BEGIN
        UPDATE b05_PESSOA SET snome=$2 WHERE nusp=$1;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION muda_satus_prof(pe_nusp INT, status CHAR(2)) RETURNS VOID
    AS $$ BEGIN
        UPDATE b07_PROFESSOR SET status=$2 WHERE pe_nusp=$1;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION muda_sala_prof(pe_nusp INT, sala VARCHAR(15)) RETURNS VOID
    AS $$ BEGIN
        UPDATE b07_PROFESSOR SET sala=$2 WHERE pe_nusp=$1;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;


CREATE OR REPLACE FUNCTION muda_status_aluno_no_curso(al_pe_nusp INT, cur_codigo INT, data_ingresso CHAR(4)) RETURNS VOID
    AS $$ BEGIN
        UPDATE b15_REL_AL_CUR SET status=$4 WHERE al_pe_nusp=$1 AND cur_codigo=$2 AND data_ingresso=$3;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION atualiza_encerramento_administracao(ad_pe_nusp INT, cur_codigo INT, fim_gestao CHAR(4)) RETURNS VOID
    AS $$ BEGIN
        UPDATE b21_ADMINISTRA SET fim_gestao=$3 WHERE ad_pe_nusp=$1 AND cur_codigo=$2;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION atualiza_nota_disciplina(al_nusp INT, pe_nusp INT, dis_data_inicio CHAR(4), dis_departamento CHAR(3), dis_codigo CHAR(4), of_semestre INT, of_ano CHAR(4), status CHAR(1)) RETURNS VOID
    AS $$ BEGIN
        UPDATE b23_CURSA SET nota=$8 WHERE al_nusp=$1 AND pe_nusp=$2 AND dis_data_inicio=$3 AND dis_departamento=$4 AND dis_codigo=$5 AND of_semestre=$6 AND of_ano=$7;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION atualiza_status_disciplina(al_nusp INT, pe_nusp INT, dis_data_inicio CHAR(4), dis_departamento CHAR(3), dis_codigo CHAR(4), of_semestre INT, of_ano CHAR(4), status CHAR(1)) RETURNS VOID
    AS $$ BEGIN
        UPDATE b23_CURSA SET status=$8 WHERE al_nusp=$1 AND pe_nusp=$2 AND dis_data_inicio=$3 AND dis_departamento=$4 AND dis_codigo=$5 AND of_semestre=$6 AND of_ano=$7;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;