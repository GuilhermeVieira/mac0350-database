\c people;

DROP FUNCTION IF EXISTS adiciona_pessoa(INT, INT, VARCHAR(280), VARCHAR(280));
DROP FUNCTION IF EXISTS vira_professor(INT, CHAR(2), email, VARCHAR(15),  VARCHAR(50));
DROP FUNCTION IF EXISTS vira_aluno(INT);
DROP FUNCTION IF EXISTS vira_admin(INT, email);
DROP FUNCTION IF EXISTS muda_pnome(INT, VARCHAR(280));
DROP FUNCTION IF EXISTS muda_snome(INT, VARCHAR(280));
DROP FUNCTION IF EXISTS muda_status_prof(INT, CHAR(2));
DROP FUNCTION IF EXISTS muda_sala_prof(INT, VARCHAR(15));
DROP FUNCTION IF EXISTS remove_pessoa(INT);
DROP FUNCTION IF EXISTS remove_professor(INT);
DROP FUNCTION IF EXISTS remove_aluno(INT);
DROP FUNCTION IF EXISTS remove_admin(INT);
DROP FUNCTION IF EXISTS recupera_nome(INT);
DROP FUNCTION IF EXISTS e_aluno(INT);
DROP FUNCTION IF EXISTS e_professor(INT);
DROP FUNCTION IF EXISTS e_admin(INT);


DROP TABLE b10_administrador;
DROP TABLE b09_aluno;
DROP TABLE b07_professor;
DROP TABLE b05_pessoa;

DROP SCHEMA admins;
DROP DOMAiN email;
DROP ROLE dba;
