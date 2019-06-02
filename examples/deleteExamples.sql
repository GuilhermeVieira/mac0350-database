SELECT remove_pessoa(11);

SELECT remove_professor(11);

SELECT remove_aluno(11);

SELECT remove_admin(11);

SELECT remove_disciplina('1988', 'MAC', '0330');

SELECT remove_modulo(21);

SELECT remove_trilha(21);

SELECT remove_curriculo(11);

SELECT remove_curso(11, 1);

SELECT remove_rel_curriculo_trilha(11, 21);

SELECT remove_rel_trilha_modulo(21, 21);

SELECT remove_rel_modulo_disciplina(8, '1988', 'MAC', '0330');

SELECT remove_planejamento(11, '1997', 'MAC', '0350');

SELECT remove_ministracao(11, '1997', 'MAC', '0425'); 

SELECT remove_administracao(11, 11, '2013');

SELECT remove_ministra(11, '1997', 'MAC', '0350', 1, 2019);

SELECT remove_cursa(11, 6, '1997', 'MAC', '0350', 2, 1998); 
