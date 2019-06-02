-- falta cria usuário.

-- TESTED
CREATE OR REPLACE FUNCTION remove_pessoa(nusp INT) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b05_PESSOA WHERE b05_PESSOA.nusp=$1;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

-- TESTED

CREATE OR REPLACE FUNCTION remove_professor(pe_nusp INT) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b07_PROFESSOR WHERE b07_PROFESSOR.pe_nusp=$1;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION remove_aluno(al_nusp INT) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b09_ALUNO WHERE pe_nusp=$1;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION remove_admin(pe_nusp INT) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b10_ADMINISTRADOR WHERE b10_ADMINISTRADOR.pe_nusp=$1;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

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

CREATE OR REPLACE FUNCTION remove_curso(al_pe_nusp INT, cur_codigo INT) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b15_REL_AL_CUR WHERE b15_REL_AL_CUR.al_pe_nusp=$1 AND b15_REL_AL_CUR.cur_codigo=$2;
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

CREATE OR REPLACE FUNCTION remove_administracao(ad_pe_nusp INT, cur_codigo INT) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b21_ADMINISTRA WHERE b21_ADMINISTRA.ad_pe_nusp=$1 AND b21_ADMINISTRA.cur_codigo=$2;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION remove_ministra(pe_nusp INT, dis_data_inicio CHAR(4), dis_departamento CHAR(3), dis_codigo CHAR(4), semestre INT, ano INT) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b22_OFERECIMENTO WHERE pf_pe_nusp=$1 AND b22_OFERECIMENTO.dis_data_inicio=$2 AND b22_OFERECIMENTO.dis_departamento=$3 AND b22_OFERECIMENTO.dis_codigo=$4 AND b22_OFERECIMENTO.semestre=$5 AND b22_OFERECIMENTO.ano=$6;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION remove_cursa(al_nusp INT, pe_nusp INT, dis_data_inicio CHAR(4), dis_departamento CHAR(3), dis_codigo CHAR(4), semestre INT, ano INT) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b23_CURSA WHERE al_pe_nusp=$1 AND of_pf_pe_nusp=$2 AND of_dis_data_inicio=$3 AND of_dis_departamento=$4 AND of_dis_codigo=$5 AND of_semestre=$6 AND of_ano=$07;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;