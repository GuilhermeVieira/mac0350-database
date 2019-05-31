CREATE OR REPLACE FUNCTION remove_pessoa(nusp INT) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b05_PESSOA WHERE nusp=$1;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION remove_professor(pe_nusp INT) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b07_PROFESSOR WHERE pe_nusp=$1;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION remove_aluno(al_nusp INT) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b09_ALUNO WHERE al_nusp=$1;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION remove_admin(pe_nusp INT) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b10_ADMINISTRADOR WHERE pe_nusp=$1;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION remove_disciplina(data_inicio CHAR(4), departamento CHAR(3), codigo CHAR(4)) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b11_DISCIPLINA WHERE data_inicio=$1 AND departamento=$2 AND codigo=$3;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION remove_modulo(mod_id INT) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b12_MODULO WHERE mod_id=$1;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION remove_trilha(tri_id INT) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b13_TRILHA WHERE tri_id=$1;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION remove_curriculo(codigo INT) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b14_CURRICULO WHERE codigo=$1;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION remove_curso(al_pe_nusp INT, cur_codigo INT) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b15_REL_AL_CUR WHERE al_pe_nusp=$1 AND cur_codigo=$2;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION remove_rel_curriculo_trilha(cur_codigo INT, tri_tri_id INT) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b16_REL_CUR_TRI WHERE cur_codigo=$1 AND tri_tri_id=$2;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION remove_rel_trilha_modulo(tri_tri_id INT, mo_mod_id INT) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b17_TR_MO WHERE tri_tri_id=$1 AND mo_mod_id=$2;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION remove_rel_modulo_disciplina(mo_mod_id INT, dis_data_inicio, CHAR(4), dis_departamento CHAR(3), dis_codigo CHAR(4)) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b18_REL_DIS_MOD WHERE mo_mod_id=$1 AND dis_data_inicio=$2 AND dis_departamento=$3 AND dis_codigo=$4;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION remove_planejamento(al_nusp INT, dis_data_inicio CHAR(4), dis_departamento CHAR(3), dis_codigo CHAR(4)) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b19_PLANEJA WHERE al_pe_nusp=$1 AND dis_data_inicio=$2 AND dis_departamento=$3 AND dis_codigo=$4;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION remove_ministracao(pf_pe_nusp INT, dis_data_inicio CHAR(4), dis_departamento CHAR(3), dis_codigo CHAR(4)) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b20_MINISTRA WHERE pf_pe_nusp=$1 AND dis_data_inicio=$2 AND dis_departamento=$3 AND dis_codigo=$4;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION remove_administracao(ad_pe_nusp INT, cur_codigo INT) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b21_ADMINISTRA WHERE ad_pe_nusp=$1 AND cur_codigo=$2;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION remove_ministra(pe_nusp INT, dis_data_inicio CHAR(4), dis_departamento CHAR(3), dis_codigo CHAR(4), semestre INT, ano INT) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b22_OFERECIMENTO WHERE pf_pe_nusp=$1 AND dis_data_inicio=$2 AND dis_departamento=$3 AND dis_codigo=$4 AND semestre=$5 AND ano=$6;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION remove_cursa(al_nusp INT, pe_nusp INT, dis_data_inicio CHAR(4), dis_departamento CHAR(3), dis_codigo CHAR(4)) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b23_CURSA WHERE al_pe_nusp=$1 AND of_pf_pe_nusp=$2 AND of_dis_data_inicio=$3 AND of_dis_departamento=$4 AND of_dis_codigo=$5;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;