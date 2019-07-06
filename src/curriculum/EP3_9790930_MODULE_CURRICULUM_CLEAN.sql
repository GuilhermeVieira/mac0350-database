\c curriculum;

DROP FUNCTION IF EXISTS adiciona_disciplina(CHAR(4), CHAR(3), CHAR(4), VARCHAR(100), VARCHAR(100), VARCHAR(100), CHAR(4), INT, INT);
DROP FUNCTION IF EXISTS adiciona_modulo(CHAR(4), VARCHAR(100));
DROP FUNCTION IF EXISTS adiciona_trilha(varchar(100), CHAR(4), INT, INT);
DROP FUNCTION IF EXISTS adiciona_curriculo(INT, VARCHAR(100));
DROP FUNCTION IF EXISTS relaciona_curriculo_trilha(INT, INT, BOOLEAN);
DROP FUNCTION IF EXISTS relaciona_trilha_modulo(INT, INT, INT, BOOLEAN, INT);
DROP FUNCTION IF EXISTS relaciona_modulo_disciplina(INT, CHAR(4), CHAR(3), CHAR(4), BOOLEAN);
DROP FUNCTION IF EXISTS oferece_ministracao(INT, CHAR(4), CHAR(3), CHAR(4), INT, INT);
DROP FUNCTION IF EXISTS remove_disciplina(CHAR(4), CHAR(3), CHAR(4));
DROP FUNCTION IF EXISTS remove_modulo(INT);
DROP FUNCTION IF EXISTS remove_trilha(INT);
DROP FUNCTION IF EXISTS remove_curriculo(INT);
DROP FUNCTION IF EXISTS remove_rel_curriculo_trilha(INT, INT);
DROP FUNCTION IF EXISTS remove_rel_trilha_modulo(INT, INT);
DROP FUNCTION IF EXISTS remove_rel_modulo_disciplina(INT, CHAR(4), CHAR(3), CHAR(4));
DROP FUNCTION IF EXISTS pega_trilhas_de_curriculo(INT);
DROP FUNCTION IF EXISTS pega_modulos_de_trilha(INT);
DROP FUNCTION IF EXISTS pega_disciplinas_de_modulo(INT);
DROP FUNCTION IF EXISTS pega_disciplina(CHAR(3), CHAR(4), CHAR(4));

DROP TABLE b22_oferecimento;
DROP TABLE b18_rel_dis_mod;
DROP TABLE b17_tr_mo;
DROP TABLE b16_rel_cur_tri;
DROP TABLE b14_curriculo;
DROP TABLE b13_trilha;
DROP TABLE b12_modulo;
DROP TABLE b11_disciplina;

DROP SCHEMA admins;
DROP DOMAIN email;
DROP ROLE dba;
