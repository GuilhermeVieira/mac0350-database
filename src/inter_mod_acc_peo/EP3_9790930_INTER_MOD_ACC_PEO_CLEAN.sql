\c acc_peo;

DROP FUNCTION IF EXISTS relaciona_usuario_pessoa(email, int);
DROP FUNCTION IF EXISTS atualiza_rel_us_pe_email(email, int);
DROP FUNCTION IF EXISTS remove_rel_us_pe(int);
DROP FUNCTION IF EXISTS verifica_email_existe(email);
DROP FUNCTION IF EXISTS recupera_nusp_rel_us_pe(email, int);

DROP TABLE b24_REL_US_PE;

DROP SCHEMA admins;
DROP DOMAIN email;
DROP ROLE dba;
