\c acc_peo;

--------------------------------------------------------------------------------
-- Create Group
--------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION relaciona_usuario_pessoa (IN us_email email, INOUT pe_nusp int)
  RETURNS int AS
  $$
  INSERT INTO b24_REL_US_PE(us_email, pe_nusp) VALUES ($1, $2)
  RETURNING pe_nusp
  $$
  LANGUAGE sql
  SECURITY DEFINER
  SET search_path FROM CURRENT;

--------------------------------------------------------------------------------
-- Update Group
--------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION atualiza_rel_us_pe_email (INOUT us_email email, INOUT pe_nusp int)
  RETURNS SETOF RECORD AS
  $$
  UPDATE b24_REL_US_PE SET us_email = $1 WHERE pe_nusp = $2
  RETURNING us_email, pe_nusp
  $$
  LANGUAGE sql
  SECURITY DEFINER
  SET search_path FROM CURRENT;

--------------------------------------------------------------------------------
-- Delete Group
--------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION remove_rel_us_pe (INOUT pe_nusp int)
  RETURNS int AS
  $$
  DELETE FROM b24_REL_US_PE WHERE pe_nusp = $1
  RETURNING pe_nusp
  $$
  LANGUAGE sql
  SECURITY DEFINER
  SET search_path FROM CURRENT;

--------------------------------------------------------------------------------
-- Retrieval Group
--------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION verifica_email_existe (IN us_email email)
  RETURNS boolean AS
  $$
  SELECT EXISTS(SELECT * FROM b24_REL_US_PE WHERE us_email = $1)
  $$
  LANGUAGE sql
  SECURITY DEFINER
  SET search_path FROM CURRENT;
