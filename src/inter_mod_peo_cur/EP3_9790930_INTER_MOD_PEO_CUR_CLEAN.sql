\c peo_cur;

DROP FUNCTION IF EXISTS inicia_curso(INT, INT, INT);
DROP FUNCTION IF EXISTS planeja_disciplina(INT, CHAR(4), CHAR(3), CHAR(4), CHAR(4), INT);
DROP FUNCTION IF EXISTS inicia_ministracao(INT, CHAR(4), CHAR(3), CHAR(4));
DROP FUNCTION IF EXISTS inicia_administracao(INT, INT, CHAR(4));
DROP FUNCTION IF EXISTS oferece_ministracao(INT, CHAR(4), CHAR(3), CHAR(4), INT, INT);
DROP FUNCTION IF EXISTS cursa_disciplina(INT, INT, REAL, CHAR(1));
DROP FUNCTION IF EXISTS relaciona_ofer_prof(INT, INT);
DROP FUNCTION IF EXISTS muda_status_aluno_no_curso(INT, INT, INT, CHAR(1));
DROP FUNCTION IF EXISTS atualiza_encerramento_administracao(INT, INT, CHAR(4), CHAR(4));
DROP FUNCTION IF EXISTS atualiza_nota_disciplina(INT, INT, REAL);
DROP FUNCTION IF EXISTS atualiza_status_disciplina(INT, INT, CHAR(1));
DROP FUNCTION IF EXISTS remove_curso(INT, INT, INT);
DROP FUNCTION IF EXISTS remove_planejamento(INT, CHAR(4), CHAR(3), CHAR(4));
DROP FUNCTION IF EXISTS remove_ministracao(INT, CHAR(4), CHAR(3), CHAR(4));
DROP FUNCTION IF EXISTS remove_administracao(INT, INT, CHAR(4));
DROP FUNCTION IF EXISTS remove_cursa(INT, INT);
DROP FUNCTION IF EXISTS remove_rel_ofer_prof(INT, INT);
DROP FUNCTION IF EXISTS pega_curriculos_admin(INT);
DROP FUNCTION IF EXISTS pega_curriculos_aluno(INT);
DROP FUNCTION IF EXISTS pega_ofers_ids_professor(INT);
DROP FUNCTION IF EXISTS pega_disciplinas_cursadas(INT);
DROP FUNCTION IF EXISTS pega_lista_de_desejos(INT);
DROP FUNCTION IF EXISTS pega_alunos_em_curriculo(INT);

DROP TABLE b15_REL_AL_CUR;
DROP TABLE b19_PLANEJA;
DROP TABLE b20_MINISTRA;
DROP TABLE b21_ADMINISTRA;
DROP TABLE b23_CURSA;
DROP TABLE b25_REL_OFER_PROF;

DROP SCHEMA admins;
DROP ROLE dba;
DROP DOMAIN email;
