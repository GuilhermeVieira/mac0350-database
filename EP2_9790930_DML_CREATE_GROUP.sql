CREATE OR REPLACE FUNCTION planejar_disciplina(al_nusp TEXT, dis_data_inicio DATA, dis_departamento TEXT, dis_codigo TEXT, pl_ano INT, pl_semestre INT) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b19_PLANEJA (al_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo, ano, semestre, prioridade) VALUES ($1, $2, $3, $4, $5, $6);
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

CREATE OR REPLACE FUNCTION planejar_disciplina(al_nusp TEXT, dis_data_inicio DATA, dis_departamento TEXT, dis_codigo TEXT, pl_ano INT, pl_semestre INT) RETURNS INT
    AS $$ BEGIN
        INSERT INTO b19_PLANEJA (al_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo, ano, semestre, prioridade) VALUES ($1, $2, $3, $4, $5, $6);
        RETURN id;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path = admins, pg_temp;

