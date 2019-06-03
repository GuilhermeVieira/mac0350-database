SELECT * FROM pega_curriculos_admin(5);

SELECT * FROM pega_curriculos_aluno(5);

SELECT * FROM pega_oferecimentos_professor(1, 2018, 1);

SELECT * FROM pega_oferecimentos_semestre(2017, 1);

SELECT * FROM pega_disciplinas_cursadas_semestre(2, 1998, 1);

SELECT * FROM pega_disciplinas_cursadas(2);

SELECT * FROM pega_lista_de_desejos(10);

SELECT * FROM pega_trilhas_de_curriculo(10);

SELECT * FROM pega_modulos_de_trilha(10);

SELECT * FROM pega_disciplinas_de_modulo(8);

SELECT * FROM pega_disciplina('MAE', '0123', '1987');

SELECT * FROM pega_alunos_em_curriculo(10);

SELECT * FROM e_aluno(1);

SELECT * FROM e_professor(1);

SELECT * FROM e_admin(1);