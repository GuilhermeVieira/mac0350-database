\c access;

DROP FUNCTION IF EXISTS cria_usuario(email, TEXT);
DROP FUNCTION IF EXISTS tem_acesso(INT, VARCHAR(280));
DROP FUNCTION IF EXISTS verifica_senha(email, TEXT);

DROP TABLE b04_us_pf;
DROP TABLE b03_pf_se;
DROP TABLE b02_servico;
DROP TABLE b01_perfil;
DROP TABLE users;

DROP SCHEMA admins;
DROP DOMAIN email;
DROP ROLE dba;
