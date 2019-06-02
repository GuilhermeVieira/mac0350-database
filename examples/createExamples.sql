SELECT cria_usuario('wakaba@bobson.com', 'ashuidgfashjkgd');

SELECT adiciona_pessoa(11, us_id, 'Benji', 'Wakabayashi') FROM USERS WHERE us_email='wakaba@gmail.com';

SELECT vira_professor(11, 'at', 'wakaba@ime.usp.br', 'C011', 'ime.usp.br/~wakabayashi');

SELECT vira_aluno(11);

SELECT vira_admin(11, 'wakaba@ime.usp.br');

SELECT adiciona_disciplina('1988','MAC', '0330', 'sgldis=MAC0330', 'Algoritmos Algébricos', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '2012');

SELECT adiciona_modulo('2018', 'DBA');

SELECT adiciona_trilha('Lógica', '2018', 2, 6);

SELECT adiciona_curriculo(11, 'Estat 2015');

SELECT inicia_curso(11, 1, 2018, 'A');

SELECT relaciona_curriculo_trilha(11, tri_id, TRUE) FROM b13_trilha WHERE nome = 'Lógica';

SELECT relaciona_trilha_modulo(tri_id, mod_id, 12, TRUE, 3) FROM b13_trilha tr, b12_modulo mo WHERE tr.nome = 'Lógica' AND mo.nome = 'DBA';

SELECT relaciona_modulo_disciplina(mod_id, '1994', 'MAC', '0330', FALSE) FROM b12_modulo WHERE nome = 'Sistemas'; 

SELECT planeja_disciplina(11, '1997', 'MAC', '0350', '2020', 2);

SELECT inicia_ministracao(11, '1997','MAC','0425');

SELECT inicia_administracao(11, 11);

SELECT oferece_ministracao(11, '1997','MAC','0350', 1, 2019);

SELECT cursa_disciplina(11, 6, '1997', 'MAC', '0350', 2, 1998, 4.9, 'A');
