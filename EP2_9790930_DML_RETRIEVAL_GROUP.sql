-- Pegar todos os currículos que um administrador administra atualmente
CREATE OR REPLACE FUNCTION pega_curriculos_admin(pe_nusp INT)
RETURNS TABLE (codigo INT, curso VARCHAR(100), inicio_gestao CHAR(4))
    AS $$ BEGIN
        RETURN QUERY
        SELECT b14_CURRICULO.codigo, b14_CURRICULO.curso, b21_ADMINISTRA.inicio_gestao
        FROM b21_ADMINISTRA
        INNER JOIN b14_CURRICULO ON cur_codigo = b14_CURRICULO.codigo
        WHERE ad_pe_nusp = $1 AND fim_gestao IS NOT NULL;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

-- select * from pega_curriculos_admin(5);

-- Pegar todos os currículos que um aluno está matriculado/já terminou
CREATE OR REPLACE FUNCTION pega_curriculos_aluno(pe_nusp INT)
RETURNS TABLE (codigo INT, curso VARCHAR(100), data_ingresso INT, status char(1))
    AS $$ BEGIN
        RETURN QUERY
        SELECT b14_CURRICULO.codigo, b14_CURRICULO.curso, b15_REL_AL_CUR.data_ingresso, b15_REL_AL_CUR.status
        FROM b15_REL_AL_CUR
        INNER JOIN b14_CURRICULO ON cur_codigo = b14_CURRICULO.codigo
        WHERE al_pe_nusp = $1;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

-- select * from pega_curriculos_aluno(5);

-- Pegar todos os oferecimentos que um professor ofereceu em determinado semestre
CREATE OR REPLACE FUNCTION pega_oferecimentos_professor(pe_nusp INT, of_ano INT, of_semestre INT)
RETURNS TABLE (departamento CHAR(3), codigo CHAR(4), data_inicio CHAR(4))
    AS $$ BEGIN
        RETURN QUERY
        SELECT dis_departamento, dis_codigo, dis_data_inicio
        FROM b22_OFERECIMENTO
        WHERE pf_pe_nusp = $1 AND ano = $2 AND semestre = $3;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

-- select * from pega_oferecimentos_professor(1, 2018, 1)

-- Pegar todas as disciplinas que foram oferecidas em determinado semestre, junto do professor que ministrou elas
CREATE OR REPLACE FUNCTION pega_oferecimentos_semestre(of_ano INT, of_semestre INT)
RETURNS TABLE (departamento CHAR(3), codigo CHAR(4), data_inicio CHAR(4), pf_nusp INT, pf_nome TEXT)
    AS $$ BEGIN
        RETURN QUERY
        SELECT dis_departamento, dis_codigo, dis_data_inicio, nusp, pnome || ' ' || snome
        FROM b22_OFERECIMENTO
        INNER JOIN b07_PROFESSOR ON pf_pe_nusp = pe_nusp
        INNER JOIN b05_PESSOA ON pe_nusp = nusp
        WHERE ano = $1 AND semestre = $2;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

-- select * from pega_oferecimentos_semestre(2017, 1);

-- Pegar todas as disciplinas que um aluno cursou em determiado semestre, junto com status e nota
CREATE OR REPLACE FUNCTION pega_disciplinas_cursadas(al_nusp INT, of_ano INT, of_semestre INT)
RETURNS TABLE (departamento CHAR(3), codigo CHAR(4), data_inicio CHAR(4), nota REAL, status CHAR(1))
    AS $$ BEGIN
        RETURN QUERY
        SELECT dis_departamento, dis_codigo, dis_data_inicio, b23_CURSA.nota, b23_CURSA.status
        FROM b23_CURSA
        INNER JOIN b22_OFERECIMENTO ON of_pf_pe_nusp = pf_pe_nusp AND of_dis_data_inicio = dis_data_inicio AND of_dis_departamento = dis_departamento AND of_dis_codigo = dis_codigo AND b23_CURSA.of_semestre = semestre AND b23_CURSA.of_ano = ano
        WHERE al_pe_nusp = $1 AND ano = $2 AND semestre = $3;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

-- select * from pega_disciplinas_cursadas(2, 1998, 1);

-- Pegar todas as disciplinas que um aluno deseja cursar, junto com o ano e o semestre planejado
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

-- select * from pega_lista_de_desejos(10);

-- Pegar todas as trilhas de um currículo
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

-- select * pega_trilhas_de_curriculo(10);

-- Pegar todas os módulos de uma trilha
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

-- select * pega_modulos_de_trilha(10);

-- Pegar todas as disciplinas de um módulo
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

-- select * from pega_disciplinas_de_modulo(8);

-- Pegar infos sobre uma disciplina, colocando o prefixo do jupiterweb no atributo jupiter_link
