\c people;

--------------------------------------------------------------------------------
-- Create Group
--------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION adiciona_pessoa(nusp INT, us_login INT, pnome VARCHAR(280), snome VARCHAR(280)) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b05_PESSOA (nusp, us_id, pnome, snome) VALUES ($1, $2, $3, $4);
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION vira_professor(pe_nusp INT, status CHAR(2), email email, sala VARCHAR(15), site VARCHAR(50)) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b07_PROFESSOR (pe_nusp, status, email, sala, site) VALUES ($1, $2, $3, $4, $5);
        -- Dar acesso ao perfil de professor
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION vira_aluno(pe_nusp INT) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b09_ALUNO (pe_nusp) VALUES ($1);
        -- Dar acesso ao perfil de aluno
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION vira_admin(pe_nusp INT, email email) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO b10_ADMINISTRADOR (pe_nusp, email) VALUES ($1, $2);
        -- Dar acesso ao perfil de admin
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;


--------------------------------------------------------------------------------
-- Update Group
--------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION muda_pnome(nusp INT, pnome VARCHAR(280)) RETURNS VOID
    AS $$ BEGIN
        UPDATE b05_PESSOA SET pnome=$2 WHERE b05_PESSOA.nusp=$1;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION muda_snome(nusp INT, snome VARCHAR(280)) RETURNS VOID
    AS $$ BEGIN
    UPDATE b05_PESSOA SET snome=$2 WHERE b05_PESSOA.nusp=$1;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION muda_status_prof(pe_nusp INT, status CHAR(2)) RETURNS VOID
    AS $$ BEGIN
        UPDATE b07_PROFESSOR SET status=$2 WHERE b07_PROFESSOR.pe_nusp=$1;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION muda_sala_prof(pe_nusp INT, sala VARCHAR(15)) RETURNS VOID
    AS $$ BEGIN
        UPDATE b07_PROFESSOR SET sala=$2 WHERE b07_PROFESSOR.pe_nusp=$1;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

--------------------------------------------------------------------------------
-- Delete Group
--------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION remove_pessoa(nusp INT) RETURNS VOID
    AS $$ BEGIN
        DELETE FROM b05_PESSOA WHERE b05_PESSOA.nusp=$1;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

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

--------------------------------------------------------------------------------
-- Retrieval Group
--------------------------------------------------------------------------------
