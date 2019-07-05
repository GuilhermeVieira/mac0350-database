DROP FUNCTION IF EXISTS cria_usuario(email, TEXT); --added
DROP FUNCTION IF EXISTS adiciona_pessoa(INT, INT, VARCHAR(280), VARCHAR(280));
DROP FUNCTION IF EXISTS vira_professor(INT, CHAR(2), email, VARCHAR(15),  VARCHAR(50));
DROP FUNCTION IF EXISTS vira_aluno(INT);
DROP FUNCTION IF EXISTS vira_admin(INT, email);
DROP FUNCTION IF EXISTS adiciona_disciplina(CHAR(4), CHAR(3), CHAR(4), VARCHAR(100), VARCHAR(100), VARCHAR(100), CHAR(4), INT, INT);
DROP FUNCTION IF EXISTS adiciona_modulo(CHAR(4), VARCHAR(100));
DROP FUNCTION IF EXISTS adiciona_trilha(varchar(100), CHAR(4), INT, INT);
DROP FUNCTION IF EXISTS adiciona_curriculo(INT, VARCHAR(100));
DROP FUNCTION IF EXISTS inicia_curso(INT, cur_codigo INT, INT, CHAR(1));
DROP FUNCTION IF EXISTS relaciona_curriculo_trilha(INT, INT, BOOLEAN);
DROP FUNCTION IF EXISTS relaciona_trilha_modulo(INT, INT, INT, BOOLEAN, INT);
DROP FUNCTION IF EXISTS relaciona_modulo_disciplina(INT, CHAR(4), CHAR(3), CHAR(4), BOOLEAN);
DROP FUNCTION IF EXISTS planeja_disciplina(INT, CHAR(4), CHAR(3), CHAR(4), CHAR(4), INT);
DROP FUNCTION IF EXISTS inicia_ministracao(INT, CHAR(4), CHAR(3), CHAR(4));
DROP FUNCTION IF EXISTS inicia_administracao(INT, INT, CHAR(4));
DROP FUNCTION IF EXISTS oferece_ministracao(INT, CHAR(4), CHAR(3), CHAR(4), INT, INT);
DROP FUNCTION IF EXISTS cursa_disciplina(INT, INT, CHAR(4), CHAR(3), CHAR(4), INT, INT, REAL, CHAR(1));
DROP FUNCTION IF EXISTS pega_curriculos_admin(INT);
DROP FUNCTION IF EXISTS pega_curriculos_aluno(INT);
DROP FUNCTION IF EXISTS pega_oferecimentos_professor(INT, INT, INT);
DROP FUNCTION IF EXISTS pega_oferecimentos_semestre(INT, INT);
DROP FUNCTION IF EXISTS pega_disciplinas_cursadas_semestre(INT, INT, INT);
DROP FUNCTION IF EXISTS pega_disciplinas_cursadas(INT);
DROP FUNCTION IF EXISTS pega_lista_de_desejos(INT);
DROP FUNCTION IF EXISTS pega_trilhas_de_curriculo(INT);
DROP FUNCTION IF EXISTS pega_modulos_de_trilha(INT);
DROP FUNCTION IF EXISTS pega_disciplinas_de_modulo(INT);
DROP FUNCTION IF EXISTS pega_disciplina(CHAR(3), CHAR(4), CHAR(4));
DROP FUNCTION IF EXISTS pega_alunos_em_curriculo(INT);
DROP FUNCTION IF EXISTS e_aluno(INT);
DROP FUNCTION IF EXISTS e_professor(INT);
DROP FUNCTION IF EXISTS e_admin(INT);
DROP FUNCTION IF EXISTS tem_acesso(INT, VARCHAR(280)); --added
DROP FUNCTION IF EXISTS muda_pnome(INT, VARCHAR(280));
DROP FUNCTION IF EXISTS muda_snome(INT, VARCHAR(280));
DROP FUNCTION IF EXISTS muda_satus_prof(INT, CHAR(2));
DROP FUNCTION IF EXISTS muda_sala_prof(INT, VARCHAR(15));
DROP FUNCTION IF EXISTS muda_status_aluno_no_curso(INT, INT, INT, CHAR(1));
DROP FUNCTION IF EXISTS atualiza_encerramento_administracao(INT, INT, CHAR(4), CHAR(4));
DROP FUNCTION IF EXISTS atualiza_nota_disciplina(INT, INT, CHAR(4), CHAR(3), CHAR(4), INT, INT, REAL);
DROP FUNCTION IF EXISTS atualiza_status_disciplina(INT, INT, CHAR(4), CHAR(3), CHAR(4), INT, INT, CHAR(1));
DROP FUNCTION IF EXISTS remove_pessoa(INT);
DROP FUNCTION IF EXISTS remove_professor(INT);
DROP FUNCTION IF EXISTS remove_aluno(INT);
DROP FUNCTION IF EXISTS remove_admin(INT);
DROP FUNCTION IF EXISTS remove_disciplina(CHAR(4), CHAR(3), CHAR(4));
DROP FUNCTION IF EXISTS remove_modulo(INT);
DROP FUNCTION IF EXISTS remove_trilha(INT);
DROP FUNCTION IF EXISTS remove_curriculo(INT);
DROP FUNCTION IF EXISTS remove_curso(INT, INT);
DROP FUNCTION IF EXISTS remove_rel_curriculo_trilha(INT, INT);
DROP FUNCTION IF EXISTS remove_rel_trilha_modulo(INT, INT);
DROP FUNCTION IF EXISTS remove_rel_modulo_disciplina(INT, CHAR(4), CHAR(3), CHAR(4));
DROP FUNCTION IF EXISTS remove_planejamento(INT, CHAR(4), CHAR(3), CHAR(4));
DROP FUNCTION IF EXISTS remove_ministracao(INT, CHAR(4), CHAR(3), CHAR(4));
DROP FUNCTION IF EXISTS remove_administracao(INT, INT, CHAR(4));
DROP FUNCTION IF EXISTS remove_ministra(INT, CHAR(4), CHAR(3), CHAR(4), INT, INT);
DROP FUNCTION IF EXISTS remove_cursa(INT, INT, CHAR(4), CHAR(3), CHAR(4), INT, INT);


DROP TABLE b23_cursa;
DROP TABLE b22_oferecimento;
DROP TABLE b21_administra;
DROP TABLE b20_ministra;
DROP TABLE b19_planeja;
DROP TABLE b18_rel_dis_mod;
DROP TABLE b17_tr_mo;
DROP TABLE b16_rel_cur_tri;
DROP TABLE b15_rel_al_cur;
DROP TABLE b14_curriculo;
DROP TABLE b13_trilha;
DROP TABLE b12_modulo;
DROP TABLE b11_disciplina;
DROP TABLE b10_administrador;
DROP TABLE b09_aluno;
DROP TABLE b07_professor;
DROP TABLE b05_pessoa;
DROP TABLE b04_us_pf; --added
DROP TABLE b03_pf_se; --added
DROP TABLE b02_servico; --added
DROP TABLE b01_perfil; --added
DROP TABLE users; --added

DROP SCHEMA admins;
DROP DOMAIN email;
DROP ROLE dba;