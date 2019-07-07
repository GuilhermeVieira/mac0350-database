\c access;

--------------------------------------------------------------------------------
-- Create Group
--------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION cria_usuario(us_email email, us_password TEXT) RETURNS VOID
    AS $$ BEGIN
        INSERT INTO users (us_email, us_password) VALUES ($1, $2);
        -- Dar acesso ao perfil do dba (?)
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    --SET search_path FROM CURRENT;
    SET search_path FROM CURRENT;

--------------------------------------------------------------------------------
-- Update Group
--------------------------------------------------------------------------------

--funções não prontas
/*
CREATE OR REPLACE FUNCTION muda_senha(nusp INT, pnome VARCHAR(280)) RETURNS VOID
    AS $$ BEGIN
        UPDATE b05_PESSOA SET pnome=$2 WHERE b05_PESSOA.nusp=$1;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION muda_email(nusp INT, pnome VARCHAR(280)) RETURNS VOID
    AS $$ BEGIN
        UPDATE b05_PESSOA SET pnome=$2 WHERE b05_PESSOA.nusp=$1;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

*/

--------------------------------------------------------------------------------
-- Delete Group
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Retrieval Group
--------------------------------------------------------------------------------

-- Verifica se um usuário tem acesso a um serviço
CREATE OR REPLACE FUNCTION tem_acesso(us_id INT, nome VARCHAR(280))
RETURNS BOOLEAN
    AS $$
    DECLARE res BOOLEAN;
    BEGIN
        SELECT COUNT(*) INTO res
        FROM b04_US_PF
        INNER JOIN b01_PERFIL ON b01_PERFIL.tipo = b04_US_PF.pf_tipo
        INNER JOIN b03_PF_SE ON b03_PF_SE.pf_tipo = b01_PERFIL.tipo
        WHERE b04_US_PF.us_id = $1 AND b03_PF_SE.se_nome = $2;
        RETURN res;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;

-- O tipo email foi declarado no DDL
-- Recebe um email e senha e retorna true se as credenciais estão válidas ou zero caso contrário
CREATE OR REPLACE FUNCTION verifica_senha(user_email email, user_password TEXT)
RETURNS BOOLEAN
    AS $$
    DECLARE usuario RECORD;
    BEGIN
        SELECT * FROM users WHERE users.us_email = user_email INTO usuario;
        IF (usuario.us_password = user_password) THEN
            RETURN true;
        ELSE
            RETURN false;
        END IF;
    END; $$
    LANGUAGE plpgsql
    SECURITY DEFINER
    SET search_path FROM CURRENT;
