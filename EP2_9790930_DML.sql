

-- users
INSERT INTO users (us_email, us_password) VALUES ('bob@bobson.com', 'ashuidgfashjkgd');
INSERT INTO users (us_email, us_password) VALUES ('glorb@bobson.com', 'ashuidgfashjkgd');
INSERT INTO users (us_email, us_password) VALUES ('blarb@bobson.com', 'ashuidgfashjkgd');
INSERT INTO users (us_email, us_password) VALUES ('snake@bobson.com', 'ashuidgfashjkgd');
INSERT INTO users (us_email, us_password) VALUES ('tallica@bobson.com', 'ashuidgfashjkgd');
INSERT INTO users (us_email, us_password) VALUES ('mengao@bobson.com', 'ashuidgfashjkgd');
INSERT INTO users (us_email, us_password) VALUES ('forbnite@bobson.com', 'ashuidgfashjkgd');
INSERT INTO users (us_email, us_password) VALUES ('ze@bobson.com', 'ashuidgfashjkgd');
INSERT INTO users (us_email, us_password) VALUES ('carlao@bobson.com', 'ashuidgfashjkgd');
INSERT INTO users (us_email, us_password) VALUES ('tonho@bobson.com', 'ashuidgfashjkgd');


-- b01_PERFIL
INSERT INTO b01_PERFIL(tipo) VALUES ('USUARIO'); 
INSERT INTO b01_PERFIL(tipo) VALUES ('ALUNO'); 
INSERT INTO b01_PERFIL(tipo) VALUES ('PROFESSOR'); 
INSERT INTO b01_PERFIL(tipo) VALUES ('ADMIN'); 
INSERT INTO b01_PERFIL(tipo) VALUES ('DBA'); 

-- b02_SERVICO 
INSERT INTO b02_SERVICO(nome) VALUES ('cria_usuario');
INSERT INTO b02_SERVICO(nome) VALUES ('adiciona_pessoa');
INSERT INTO b02_SERVICO(nome) VALUES ('vira_professor');
INSERT INTO b02_SERVICO(nome) VALUES ('vira_aluno');
INSERT INTO b02_SERVICO(nome) VALUES ('vira_admin');
INSERT INTO b02_SERVICO(nome) VALUES ('adiciona_disciplina');
INSERT INTO b02_SERVICO(nome) VALUES ('adiciona_modulo');
INSERT INTO b02_SERVICO(nome) VALUES ('adiciona_trilha');
INSERT INTO b02_SERVICO(nome) VALUES ('adiciona_curriculo');
INSERT INTO b02_SERVICO(nome) VALUES ('inicia_curso');
INSERT INTO b02_SERVICO(nome) VALUES ('relaciona_curriculo_trilha');
INSERT INTO b02_SERVICO(nome) VALUES ('relaciona_trilha_modulo');
INSERT INTO b02_SERVICO(nome) VALUES ('relaciona_modulo_disciplina');
INSERT INTO b02_SERVICO(nome) VALUES ('planeja_disciplina');
INSERT INTO b02_SERVICO(nome) VALUES ('inicia_ministracao');
INSERT INTO b02_SERVICO(nome) VALUES ('inicia_administracao');
INSERT INTO b02_SERVICO(nome) VALUES ('oferece_ministracao');
INSERT INTO b02_SERVICO(nome) VALUES ('cursa_disciplina');
INSERT INTO b02_SERVICO(nome) VALUES ('muda_pnome');
INSERT INTO b02_SERVICO(nome) VALUES ('muda_snome');
INSERT INTO b02_SERVICO(nome) VALUES ('muda_satus_prof');
INSERT INTO b02_SERVICO(nome) VALUES ('muda_sala_prof');
INSERT INTO b02_SERVICO(nome) VALUES ('muda_status_aluno_no_curso');
INSERT INTO b02_SERVICO(nome) VALUES ('atualiza_encerramento_administracao');
INSERT INTO b02_SERVICO(nome) VALUES ('atualiza_nota_disciplina');
INSERT INTO b02_SERVICO(nome) VALUES ('atualiza_status_disciplina');
INSERT INTO b02_SERVICO(nome) VALUES ('remove_pessoa');
INSERT INTO b02_SERVICO(nome) VALUES ('remove_professor');
INSERT INTO b02_SERVICO(nome) VALUES ('remove_aluno');
INSERT INTO b02_SERVICO(nome) VALUES ('remove_admin');
INSERT INTO b02_SERVICO(nome) VALUES ('remove_disciplina');
INSERT INTO b02_SERVICO(nome) VALUES ('remove_modulo');
INSERT INTO b02_SERVICO(nome) VALUES ('remove_trilha');
INSERT INTO b02_SERVICO(nome) VALUES ('remove_curriculo');
INSERT INTO b02_SERVICO(nome) VALUES ('remove_curso');
INSERT INTO b02_SERVICO(nome) VALUES ('remove_rel_curriculo_trilha');
INSERT INTO b02_SERVICO(nome) VALUES ('remove_rel_trilha_modulo');
INSERT INTO b02_SERVICO(nome) VALUES ('remove_rel_modulo_disciplina');
INSERT INTO b02_SERVICO(nome) VALUES ('remove_planejamento');
INSERT INTO b02_SERVICO(nome) VALUES ('remove_ministracao');
INSERT INTO b02_SERVICO(nome) VALUES ('remove_administracao');
INSERT INTO b02_SERVICO(nome) VALUES ('remove_ministra');
INSERT INTO b02_SERVICO(nome) VALUES ('remove_cursa');
INSERT INTO b02_SERVICO(nome) VALUES ('pega_curriculos_admin');
INSERT INTO b02_SERVICO(nome) VALUES ('pega_curriculos_aluno');
INSERT INTO b02_SERVICO(nome) VALUES ('pega_oferecimentos_professor');
INSERT INTO b02_SERVICO(nome) VALUES ('pega_oferecimentos_semestre');
INSERT INTO b02_SERVICO(nome) VALUES ('pega_disciplinas_cursadas');
INSERT INTO b02_SERVICO(nome) VALUES ('pega_lista_de_desejos');
INSERT INTO b02_SERVICO(nome) VALUES ('pega_trilhas_de_curriculo');
INSERT INTO b02_SERVICO(nome) VALUES ('pega_modulos_de_trilha');
INSERT INTO b02_SERVICO(nome) VALUES ('pega_disciplinas_de_modulo');

-- b03_PF_SE 
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('DBA', 'cria_usuario');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('DBA', 'remove_professor');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('DBA', 'remove_aluno');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('DBA', 'remove_admin');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('DBA', 'remove_curriculo');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('DBA', 'remove_curso');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('DBA', 'remove_ministracao');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('DBA', 'remove_administracao');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('DBA', 'remove_cursa');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('DBA', 'inicia_administracao');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('DBA', 'adiciona_pessoa');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('DBA', 'vira_professor');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('DBA', 'vira_aluno');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('DBA', 'vira_admin');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('DBA', 'adiciona_curriculo');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('DBA', 'muda_satus_prof');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('DBA', 'remove_pessoa');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('DBA', 'atualiza_encerramento_administracao');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('ADMIN', 'adiciona_disciplina');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('ADMIN', 'adiciona_modulo');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('ADMIN', 'adiciona_trilha');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('ADMIN', 'inicia_curso');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('ADMIN', 'relaciona_curriculo_trilha');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('ADMIN', 'oferece_ministracao');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('ADMIN', 'cursa_disciplina');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('ADMIN', 'relaciona_trilha_modulo');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('ADMIN', 'relaciona_modulo_disciplina');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('ADMIN', 'atualiza_status_disciplina');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('ADMIN', 'remove_rel_curriculo_trilha');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('ADMIN', 'remove_rel_trilha_modulo');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('ADMIN', 'remove_rel_modulo_disciplina');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('ADMIN', 'remove_disciplina');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('ADMIN', 'remove_modulo');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('ADMIN', 'remove_trilha');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('ADMIN', 'muda_status_aluno_no_curso');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('ADMIN', 'remove_ministra');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('ALUNO', 'planeja_disciplina');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('ALUNO', 'remove_planejamento');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('USUARIO', 'muda_pnome');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('USUARIO', 'muda_snome');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('PROFESSOR', 'muda_sala_prof');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('PROFESSOR', 'atualiza_nota_disciplina');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('PROFESSOR', 'inicia_ministracao');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('ADMIN', 'pega_curriculos_admin');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('ADMIN', 'pega_curriculos_aluno');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('USUARIO', 'pega_oferecimentos_professor');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('USUARIO', 'pega_oferecimentos_semestre');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('USUARIO', 'pega_disciplinas_cursadas');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('ALUNO', 'pega_lista_de_desejos');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('USUARIO', 'pega_trilhas_de_curriculo');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('USUARIO', 'pega_modulos_de_trilha');
INSERT INTO b03_PF_SE(pf_tipo, se_nome) VALUES ('USUARIO', 'pega_disciplinas_de_modulo');

-- b05_PESSOA
INSERT INTO b05_PESSOA (nusp, us_id, pnome, snome) SELECT 1, us_id, 'Roberto', 'da Guia' FROM users WHERE us_email='bob@bobson.com';
INSERT INTO b05_PESSOA (nusp, us_id, pnome, snome) SELECT 2, us_id, 'Gilberto', 'Mercos' FROM users WHERE us_email='glorb@bobson.com';
INSERT INTO b05_PESSOA (nusp, us_id, pnome, snome) SELECT 3, us_id, 'Pedro', 'Tavares' FROM users WHERE us_email='blarb@bobson.com';
INSERT INTO b05_PESSOA (nusp, us_id, pnome, snome) SELECT 4, us_id, 'João', 'Guets' FROM users WHERE us_email='snake@bobson.com';
INSERT INTO b05_PESSOA (nusp, us_id, pnome, snome) SELECT 5, us_id, 'James', 'Hetfield' FROM users WHERE us_email='tallica@bobson.com';
INSERT INTO b05_PESSOA (nusp, us_id, pnome, snome) SELECT 6, us_id, 'Guilherme', 'da Silva de Carvalho' FROM users WHERE us_email='mengao@bobson.com';
INSERT INTO b05_PESSOA (nusp, us_id, pnome, snome) SELECT 7, us_id, 'Jose', 'Augusto de Oliveira' FROM users WHERE us_email='forbnite@bobson.com';
INSERT INTO b05_PESSOA (nusp, us_id, pnome, snome) SELECT 8, us_id, 'Luis', 'Gomes' FROM users WHERE us_email='ze@bobson.com';
INSERT INTO b05_PESSOA (nusp, us_id, pnome, snome) SELECT 9, us_id, 'Carlos', 'Ferreira' FROM users WHERE us_email='carlao@bobson.com';
INSERT INTO b05_PESSOA (nusp, us_id, pnome, snome) SELECT 10, us_id, 'Carlos', 'da Lua' FROM users WHERE us_email='tonho@bobson.com';


-- b04_US_PF
INSERT INTO b04_US_PF(us_id, pf_tipo) SELECT us_id, 'DBA' FROM b05_PESSOA WHERE nusp=1;
INSERT INTO b04_US_PF(us_id, pf_tipo) SELECT us_id, 'ADMIN' FROM b05_PESSOA WHERE nusp=1;
INSERT INTO b04_US_PF(us_id, pf_tipo) SELECT us_id, 'ALUNO' FROM b05_PESSOA WHERE nusp=1;
INSERT INTO b04_US_PF(us_id, pf_tipo) SELECT us_id, 'PROFESSOR' FROM b05_PESSOA WHERE nusp=1;
INSERT INTO b04_US_PF(us_id, pf_tipo) SELECT us_id, 'ADMIN' FROM b05_PESSOA WHERE nusp=2;
INSERT INTO b04_US_PF(us_id, pf_tipo) SELECT us_id, 'ALUNO' FROM b05_PESSOA WHERE nusp=2;
INSERT INTO b04_US_PF(us_id, pf_tipo) SELECT us_id, 'PROFESSOR' FROM b05_PESSOA WHERE nusp=2;
INSERT INTO b04_US_PF(us_id, pf_tipo) SELECT us_id, 'ADMIN' FROM b05_PESSOA WHERE nusp=3;
INSERT INTO b04_US_PF(us_id, pf_tipo) SELECT us_id, 'ALUNO' FROM b05_PESSOA WHERE nusp=3;
INSERT INTO b04_US_PF(us_id, pf_tipo) SELECT us_id, 'PROFESSOR' FROM b05_PESSOA WHERE nusp=3;
INSERT INTO b04_US_PF(us_id, pf_tipo) SELECT us_id, 'ADMIN' FROM b05_PESSOA WHERE nusp=4;
INSERT INTO b04_US_PF(us_id, pf_tipo) SELECT us_id, 'ALUNO' FROM b05_PESSOA WHERE nusp=4;
INSERT INTO b04_US_PF(us_id, pf_tipo) SELECT us_id, 'PROFESSOR' FROM b05_PESSOA WHERE nusp=4;
INSERT INTO b04_US_PF(us_id, pf_tipo) SELECT us_id, 'ADMIN' FROM b05_PESSOA WHERE nusp=5;
INSERT INTO b04_US_PF(us_id, pf_tipo) SELECT us_id, 'ALUNO' FROM b05_PESSOA WHERE nusp=5;
INSERT INTO b04_US_PF(us_id, pf_tipo) SELECT us_id, 'PROFESSOR' FROM b05_PESSOA WHERE nusp=5;
INSERT INTO b04_US_PF(us_id, pf_tipo) SELECT us_id, 'ADMIN' FROM b05_PESSOA WHERE nusp=6;
INSERT INTO b04_US_PF(us_id, pf_tipo) SELECT us_id, 'ALUNO' FROM b05_PESSOA WHERE nusp=6;
INSERT INTO b04_US_PF(us_id, pf_tipo) SELECT us_id, 'PROFESSOR' FROM b05_PESSOA WHERE nusp=6;
INSERT INTO b04_US_PF(us_id, pf_tipo) SELECT us_id, 'ADMIN' FROM b05_PESSOA WHERE nusp=7;
INSERT INTO b04_US_PF(us_id, pf_tipo) SELECT us_id, 'ALUNO' FROM b05_PESSOA WHERE nusp=7;
INSERT INTO b04_US_PF(us_id, pf_tipo) SELECT us_id, 'PROFESSOR' FROM b05_PESSOA WHERE nusp=7;
INSERT INTO b04_US_PF(us_id, pf_tipo) SELECT us_id, 'ADMIN' FROM b05_PESSOA WHERE nusp=8;
INSERT INTO b04_US_PF(us_id, pf_tipo) SELECT us_id, 'ALUNO' FROM b05_PESSOA WHERE nusp=8;
INSERT INTO b04_US_PF(us_id, pf_tipo) SELECT us_id, 'PROFESSOR' FROM b05_PESSOA WHERE nusp=8;
INSERT INTO b04_US_PF(us_id, pf_tipo) SELECT us_id, 'ADMIN' FROM b05_PESSOA WHERE nusp=9;
INSERT INTO b04_US_PF(us_id, pf_tipo) SELECT us_id, 'ALUNO' FROM b05_PESSOA WHERE nusp=9;
INSERT INTO b04_US_PF(us_id, pf_tipo) SELECT us_id, 'PROFESSOR' FROM b05_PESSOA WHERE nusp=9;
INSERT INTO b04_US_PF(us_id, pf_tipo) SELECT us_id, 'ADMIN' FROM b05_PESSOA WHERE nusp=10;
INSERT INTO b04_US_PF(us_id, pf_tipo) SELECT us_id, 'ALUNO' FROM b05_PESSOA WHERE nusp=10;
INSERT INTO b04_US_PF(us_id, pf_tipo) SELECT us_id, 'PROFESSOR' FROM b05_PESSOA WHERE nusp=10;


-- b07_PROFESSOR
INSERT INTO b07_PROFESSOR (pe_nusp, status, email, sala, site) VALUES (1, 'at', 'bob@ime.usp.br', 'A214', 'ime.usp.br/~bob');
INSERT INTO b07_PROFESSOR (pe_nusp, status, email, sala, site) VALUES (2, 'at', 'blorg@ime.usp.br', 'A125', 'ime.usp.br/~blorb');
INSERT INTO b07_PROFESSOR (pe_nusp, status, email, sala, site) VALUES (3, 'at', 'blarb@ime.usp.br', 'C245', 'ime.usp.br/~blarb');
INSERT INTO b07_PROFESSOR (pe_nusp, status, email, sala, site) VALUES (4, 'at', 'ssss@ime.usp.br', 'A214', 'ime.usp.br/~ssss');
INSERT INTO b07_PROFESSOR (pe_nusp, status, email, sala, site) VALUES (5, 'at', 'tallica@ime.usp.br', 'C564', 'ime.usp.br/~tallica');
INSERT INTO b07_PROFESSOR (pe_nusp, status, email, sala, site) VALUES (6, 'at', 'santista76@ime.usp.br', 'D324', 'ime.usp.br/~santista76');
INSERT INTO b07_PROFESSOR (pe_nusp, status, email, sala, site) VALUES (7, 'at', 'ze@ime.usp.br', 'C198', 'ime.usp.br/~ze');
INSERT INTO b07_PROFESSOR (pe_nusp, status, email, sala, site) VALUES (8, 'at', 'ze91@ime.usp.br', 'A123', 'ime.usp.br/~ze91');
INSERT INTO b07_PROFESSOR (pe_nusp, status, email, sala, site) VALUES (9, 'at', 'cf@ime.usp.br', 'B234', 'ime.usp.br/~cf');
INSERT INTO b07_PROFESSOR (pe_nusp, status, email, sala, site) VALUES (10, 'at', 'mitojr@ime.usp.br', 'A234', 'ime.usp.br/~mitojr');

-- b09_ALUNO
INSERT INTO b09_ALUNO (pe_nusp) VALUES (1);
INSERT INTO b09_ALUNO (pe_nusp) VALUES (2);
INSERT INTO b09_ALUNO (pe_nusp) VALUES (3);
INSERT INTO b09_ALUNO (pe_nusp) VALUES (4);
INSERT INTO b09_ALUNO (pe_nusp) VALUES (5);
INSERT INTO b09_ALUNO (pe_nusp) VALUES (6);
INSERT INTO b09_ALUNO (pe_nusp) VALUES (7);
INSERT INTO b09_ALUNO (pe_nusp) VALUES (8);
INSERT INTO b09_ALUNO (pe_nusp) VALUES (9);
INSERT INTO b09_ALUNO (pe_nusp) VALUES (10);

-- b10_ADMINISTRADOR
INSERT INTO b10_ADMINISTRADOR (pe_nusp, email) VALUES (1, 'bob@ime.usp.br');
INSERT INTO b10_ADMINISTRADOR (pe_nusp, email) VALUES (2, 'blorg@ime.usp.br');
INSERT INTO b10_ADMINISTRADOR (pe_nusp, email) VALUES (3, 'blarb@ime.usp.br');
INSERT INTO b10_ADMINISTRADOR (pe_nusp, email) VALUES (4, 'ssss@ime.usp.br');
INSERT INTO b10_ADMINISTRADOR (pe_nusp, email) VALUES (5, 'tallica@ime.usp.br');
INSERT INTO b10_ADMINISTRADOR (pe_nusp, email) VALUES (6, 'santista76@ime.usp.br');
INSERT INTO b10_ADMINISTRADOR (pe_nusp, email) VALUES (7, 'ze@ime.usp.br');
INSERT INTO b10_ADMINISTRADOR (pe_nusp, email) VALUES (8, 'ze91@ime.usp.br');
INSERT INTO b10_ADMINISTRADOR (pe_nusp, email) VALUES (9, 'cf@ime.usp.br');
INSERT INTO b10_ADMINISTRADOR (pe_nusp, email) VALUES (10, 'mitojr@ime.usp.br');

-- b11_DISCIPLINA
INSERT INTO b11_DISCIPLINA (data_inicio, departamento, codigo, jupiter_link, nome, descricao, data_fim, creditos_aula, creditos_trabalho) VALUES ('1987', 'MAE', '0123', 'sgldis=MAE0123', 'Introdução a bob', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '2004', 4, 0);
INSERT INTO b11_DISCIPLINA (data_inicio, departamento, codigo, jupiter_link, nome, descricao, data_fim, creditos_aula, creditos_trabalho) VALUES ('1997','MAC','0350', 'sgldis=MAC0350', 'Melhor matéria', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '2001', 4, 2);
INSERT INTO b11_DISCIPLINA (data_inicio, departamento, codigo, jupiter_link, nome, descricao, data_fim, creditos_aula, creditos_trabalho) VALUES ('2005','MAC','0121', 'sgldis=MAC0121', 'Introdução a algorimos', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', NULL, 4, 0);
INSERT INTO b11_DISCIPLINA (data_inicio, departamento, codigo, jupiter_link, nome, descricao, data_fim, creditos_aula, creditos_trabalho) VALUES ('1997','MAC','0425', 'sgldis=MAC0425', 'Robozinho', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '2003', 4, 2);
INSERT INTO b11_DISCIPLINA (data_inicio, departamento, codigo, jupiter_link, nome, descricao, data_fim, creditos_aula, creditos_trabalho) VALUES ('2018','MAT','0256', 'sgldis=MAT0256', 'Calc Pi', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', NULL, 4, 0);
INSERT INTO b11_DISCIPLINA (data_inicio, departamento, codigo, jupiter_link, nome, descricao, data_fim, creditos_aula, creditos_trabalho) VALUES ('1981','MAT','0359', 'sgldis=MAT0359', 'Logick', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '1999', 4, 2);
INSERT INTO b11_DISCIPLINA (data_inicio, departamento, codigo, jupiter_link, nome, descricao, data_fim, creditos_aula, creditos_trabalho) VALUES ('2005','MAE','0666', 'sgldis=MAE0666', 'Inferno', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', NULL, 6, 0);
INSERT INTO b11_DISCIPLINA (data_inicio, departamento, codigo, jupiter_link, nome, descricao, data_fim, creditos_aula, creditos_trabalho) VALUES ('2011','MAE','9889', 'sgldis=MAE9889', 'Amostragem de dados virtualmente obscuros', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '2014', 4, 0);
INSERT INTO b11_DISCIPLINA (data_inicio, departamento, codigo, jupiter_link, nome, descricao, data_fim, creditos_aula, creditos_trabalho) VALUES ('2016','MAC','0300', 'sgldis=MAC0300', 'Metodos Nabos', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', NULL, 4, 2);
INSERT INTO b11_DISCIPLINA (data_inicio, departamento, codigo, jupiter_link, nome, descricao, data_fim, creditos_aula, creditos_trabalho) VALUES ('1993','MAC', '0460', 'sgldis=MAC0460', 'Intro a Buzzword', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', NULL, 6, 0);

-- b12_MODULO
INSERT INTO b12_MODULO (ano, nome) VALUES ('1975', 'Obrigatorias');
INSERT INTO b12_MODULO (ano, nome) VALUES ('1997', 'Obrigatorias');
INSERT INTO b12_MODULO (ano, nome) VALUES ('2016', 'Obrigatorias');
INSERT INTO b12_MODULO (ano, nome) VALUES ('2016', 'Robos');
INSERT INTO b12_MODULO (ano, nome) VALUES ('2016', 'Pura');
INSERT INTO b12_MODULO (ano, nome) VALUES ('2017', 'Coxa');
INSERT INTO b12_MODULO (ano, nome) VALUES ('2017', 'Nabo');
INSERT INTO b12_MODULO (ano, nome) VALUES ('2018', 'Sistemas');
INSERT INTO b12_MODULO (ano, nome) VALUES ('1986', 'Data Science');
INSERT INTO b12_MODULO (ano, nome) VALUES ('1999', 'Sistemas');

-- b13_TRILHA
INSERT INTO b13_TRILHA (nome, ano, min_mods, min_dis) VALUES ('Obrigatoria','1995', 2, 5);
INSERT INTO b13_TRILHA (nome, ano, min_mods, min_dis) VALUES ('Sisteminhas','2005', 3, 7);
INSERT INTO b13_TRILHA (nome, ano, min_mods, min_dis) VALUES ('Doidera','1980', 2, 10);
INSERT INTO b13_TRILHA (nome, ano, min_mods, min_dis) VALUES ('Obrigatoria','2016', 3, 12);
INSERT INTO b13_TRILHA (nome, ano, min_mods, min_dis) VALUES ('IA','2000', 3, 4);
INSERT INTO b13_TRILHA (nome, ano, min_mods, min_dis) VALUES ('Optativa eletiva','1997', 2 , 42);
INSERT INTO b13_TRILHA (nome, ano, min_mods, min_dis) VALUES ('Teoria','2015', 3, 7);
INSERT INTO b13_TRILHA (nome, ano, min_mods, min_dis) VALUES ('Aquela la','1966', 4, 8);
INSERT INTO b13_TRILHA (nome, ano, min_mods, min_dis) VALUES ('Direito Contitucional','1920', 2, 100);
INSERT INTO b13_TRILHA (nome, ano, min_mods, min_dis) VALUES ('Engengerotreco','1980', 3, 10);

-- b14_CURRICULO
INSERT INTO b14_CURRICULO (codigo, curso) VALUES (1, 'BCC 2016');
INSERT INTO b14_CURRICULO (codigo, curso) VALUES (2, 'BCC 1999');
INSERT INTO b14_CURRICULO (codigo, curso) VALUES (3, 'Estat 2000');
INSERT INTO b14_CURRICULO (codigo, curso) VALUES (4, 'Pura 1996');
INSERT INTO b14_CURRICULO (codigo, curso) VALUES (5, 'Pura 2010');
INSERT INTO b14_CURRICULO (codigo, curso) VALUES (6, 'Lic 1995');
INSERT INTO b14_CURRICULO (codigo, curso) VALUES (7, 'Lic 2004');
INSERT INTO b14_CURRICULO (codigo, curso) VALUES (8, 'Aplicada 1997');
INSERT INTO b14_CURRICULO (codigo, curso) VALUES (9, 'Aplicada 2000');
INSERT INTO b14_CURRICULO (codigo, curso) VALUES (10, 'Estat 2012');

-- b15_REL_AL_CUR
INSERT INTO b15_REL_AL_CUR (al_pe_nusp, cur_codigo, data_ingresso, status) VALUES (1, 1, 2017, 'A');
INSERT INTO b15_REL_AL_CUR (al_pe_nusp, cur_codigo, data_ingresso, status) VALUES (2, 1, 2018, 'A');
INSERT INTO b15_REL_AL_CUR (al_pe_nusp, cur_codigo, data_ingresso, status) VALUES (3, 10, 2017, 'D');
INSERT INTO b15_REL_AL_CUR (al_pe_nusp, cur_codigo, data_ingresso, status) VALUES (4, 10, 2018, 'A');
INSERT INTO b15_REL_AL_CUR (al_pe_nusp, cur_codigo, data_ingresso, status) VALUES (5, 9, 2017, 'A');
INSERT INTO b15_REL_AL_CUR (al_pe_nusp, cur_codigo, data_ingresso, status) VALUES (6, 9, 2016, 'A');
INSERT INTO b15_REL_AL_CUR (al_pe_nusp, cur_codigo, data_ingresso, status) VALUES (7, 5, 2018, 'A');
INSERT INTO b15_REL_AL_CUR (al_pe_nusp, cur_codigo, data_ingresso, status) VALUES (8, 5, 2013, 'F');
INSERT INTO b15_REL_AL_CUR (al_pe_nusp, cur_codigo, data_ingresso, status) VALUES (9, 7, 2017, 'D');
INSERT INTO b15_REL_AL_CUR (al_pe_nusp, cur_codigo, data_ingresso, status) VALUES (10, 7, 2018, 'A');

-- b16_REL_CUR_TRI
INSERT INTO b16_REL_CUR_TRI (cur_codigo, tri_tri_id, obrigatoria) SELECT 1, tri_id, FALSE FROM b13_TRILHA WHERE nome = 'Obrigatoria' LIMIT 1;
INSERT INTO b16_REL_CUR_TRI (cur_codigo, tri_tri_id, obrigatoria) SELECT 2, tri_id, TRUE FROM b13_TRILHA WHERE nome = 'IA';
INSERT INTO b16_REL_CUR_TRI (cur_codigo, tri_tri_id, obrigatoria) SELECT 3, tri_id, TRUE FROM b13_TRILHA WHERE nome = 'Teoria';
INSERT INTO b16_REL_CUR_TRI (cur_codigo, tri_tri_id, obrigatoria) SELECT 4, tri_id, FALSE FROM b13_TRILHA WHERE nome = 'Obrigatoria' LIMIT 1;
INSERT INTO b16_REL_CUR_TRI (cur_codigo, tri_tri_id, obrigatoria) SELECT 5, tri_id, FALSE FROM b13_TRILHA WHERE nome = 'Sisteminhas';
INSERT INTO b16_REL_CUR_TRI (cur_codigo, tri_tri_id, obrigatoria) SELECT 5, tri_id, TRUE FROM b13_TRILHA WHERE nome = 'Optativa eletiva';
INSERT INTO b16_REL_CUR_TRI (cur_codigo, tri_tri_id, obrigatoria) SELECT 5, tri_id, TRUE FROM b13_TRILHA WHERE nome = 'Aquela la';
INSERT INTO b16_REL_CUR_TRI (cur_codigo, tri_tri_id, obrigatoria) SELECT 8, tri_id, FALSE FROM b13_TRILHA WHERE nome = 'Aquela la';
INSERT INTO b16_REL_CUR_TRI (cur_codigo, tri_tri_id, obrigatoria) SELECT 10, tri_id, TRUE FROM b13_TRILHA WHERE nome = 'Obrigatoria' LIMIT 1;
INSERT INTO b16_REL_CUR_TRI (cur_codigo, tri_tri_id, obrigatoria) SELECT 10, tri_id, TRUE FROM b13_TRILHA WHERE nome = 'Aquela la';

-- b17_TR_MO
INSERT INTO b17_TR_MO (tri_tri_id, mo_mod_id, min_creds, obrigatorio, min_dis) SELECT tri_id, mod_id, 10, TRUE, 1000 FROM b13_TRILHA tr, b12_MODULO mo WHERE tr.nome = 'Direito Contitucional' AND mo.nome = 'Obrigatorias' LIMIT 1;
INSERT INTO b17_TR_MO (tri_tri_id, mo_mod_id, min_creds, obrigatorio, min_dis) SELECT tri_id, mod_id, 6, TRUE, 999 FROM b13_TRILHA tr, b12_MODULO mo WHERE tr.nome = 'Obrigatoria' AND mo.nome = 'Robos' LIMIT 1;
INSERT INTO b17_TR_MO (tri_tri_id, mo_mod_id, min_creds, obrigatorio, min_dis) SELECT tri_id, mod_id, 10, FALSE, 998 FROM b13_TRILHA tr, b12_MODULO mo WHERE tr.nome = 'Doidera' AND mo.nome = 'Robos' LIMIT 1;
INSERT INTO b17_TR_MO (tri_tri_id, mo_mod_id, min_creds, obrigatorio, min_dis) SELECT tri_id, mod_id, 14, TRUE, 997 FROM b13_TRILHA tr, b12_MODULO mo WHERE tr.nome = 'Obrigatoria' AND mo.nome = 'Nabo' LIMIT 1;
INSERT INTO b17_TR_MO (tri_tri_id, mo_mod_id, min_creds, obrigatorio, min_dis) SELECT tri_id, mod_id, 30, FALSE, 996 FROM b13_TRILHA tr, b12_MODULO mo WHERE tr.nome = 'Engengerotreco' AND mo.nome = 'Robos' LIMIT 1;
INSERT INTO b17_TR_MO (tri_tri_id, mo_mod_id, min_creds, obrigatorio, min_dis) SELECT tri_id, mod_id, 12, TRUE, 995 FROM b13_TRILHA tr, b12_MODULO mo WHERE tr.nome = 'Aquela la' AND mo.nome = 'Coxa' LIMIT 1;
INSERT INTO b17_TR_MO (tri_tri_id, mo_mod_id, min_creds, obrigatorio, min_dis) SELECT tri_id, mod_id, 24, TRUE, 25 FROM b13_TRILHA tr, b12_MODULO mo WHERE tr.nome = 'Doidera' AND mo.nome = 'Nabo' LIMIT 1;
INSERT INTO b17_TR_MO (tri_tri_id, mo_mod_id, min_creds, obrigatorio, min_dis) SELECT tri_id, mod_id, 8, FALSE, 20 FROM b13_TRILHA tr, b12_MODULO mo WHERE tr.nome = 'Teoria' AND mo.nome = 'Obrigatorias' LIMIT 1;
INSERT INTO b17_TR_MO (tri_tri_id, mo_mod_id, min_creds, obrigatorio, min_dis) SELECT tri_id, mod_id, 20, FALSE, 10 FROM b13_TRILHA tr, b12_MODULO mo WHERE tr.nome = 'Engengerotreco' AND mo.nome = 'Coxa' LIMIT 1;
INSERT INTO b17_TR_MO (tri_tri_id, mo_mod_id, min_creds, obrigatorio, min_dis) SELECT tri_id, mod_id, 30, TRUE, 10 FROM b13_TRILHA tr, b12_MODULO mo WHERE tr.nome = 'Obrigatoria' AND mo.nome = 'Coxa' LIMIT 1;

-- b18_REL_DIS_MOD
INSERT INTO b18_REL_DIS_MOD (mo_mod_id, dis_data_inicio, dis_departamento, dis_codigo, obrigatorio) SELECT mod_id, '1997', 'MAC', '0350', TRUE FROM b12_MODULO WHERE nome = 'Sistemas' LIMIT 1;
INSERT INTO b18_REL_DIS_MOD (mo_mod_id, dis_data_inicio, dis_departamento, dis_codigo, obrigatorio) SELECT mod_id, '2018', 'MAT', '0256', TRUE FROM b12_MODULO WHERE nome = 'Sistemas' LIMIT 1;
INSERT INTO b18_REL_DIS_MOD (mo_mod_id, dis_data_inicio, dis_departamento, dis_codigo, obrigatorio) SELECT mod_id, '2011', 'MAE', '9889', TRUE FROM b12_MODULO WHERE nome = 'Pura' LIMIT 1;
INSERT INTO b18_REL_DIS_MOD (mo_mod_id, dis_data_inicio, dis_departamento, dis_codigo, obrigatorio) SELECT mod_id, '1997', 'MAC', '0350', TRUE FROM b12_MODULO WHERE nome = 'Obrigatorias' LIMIT 1;
INSERT INTO b18_REL_DIS_MOD (mo_mod_id, dis_data_inicio, dis_departamento, dis_codigo, obrigatorio) SELECT mod_id, '1997', 'MAC', '0350', TRUE FROM b12_MODULO WHERE nome = 'Coxa' LIMIT 1;
INSERT INTO b18_REL_DIS_MOD (mo_mod_id, dis_data_inicio, dis_departamento, dis_codigo, obrigatorio) SELECT mod_id, '2005', 'MAE', '0666', TRUE FROM b12_MODULO WHERE nome = 'Sistemas' LIMIT 1;
INSERT INTO b18_REL_DIS_MOD (mo_mod_id, dis_data_inicio, dis_departamento, dis_codigo, obrigatorio) SELECT mod_id, '1981', 'MAT', '0359', TRUE FROM b12_MODULO WHERE nome = 'Robos' LIMIT 1;
INSERT INTO b18_REL_DIS_MOD (mo_mod_id, dis_data_inicio, dis_departamento, dis_codigo, obrigatorio) SELECT mod_id, '1997', 'MAC', '0350', TRUE FROM b12_MODULO WHERE nome = 'Nabo' LIMIT 1;
INSERT INTO b18_REL_DIS_MOD (mo_mod_id, dis_data_inicio, dis_departamento, dis_codigo, obrigatorio) SELECT mod_id, '2016', 'MAC', '0300', TRUE FROM b12_MODULO WHERE nome = 'Sistemas' LIMIT 1;
INSERT INTO b18_REL_DIS_MOD (mo_mod_id, dis_data_inicio, dis_departamento, dis_codigo, obrigatorio) SELECT mod_id, '1993', 'MAC', '0460', TRUE FROM b12_MODULO WHERE nome = 'Data Science' LIMIT 1;

-- b19_PLANEJA
INSERT INTO b19_PLANEJA (al_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo, ano, semestre) VALUES (1, '2016', 'MAC', '0300', '2019', 2);
INSERT INTO b19_PLANEJA (al_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo, ano, semestre) VALUES (3, '2005', 'MAE', '0666', '2019', 2);
INSERT INTO b19_PLANEJA (al_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo, ano, semestre) VALUES (5, '1997', 'MAC', '0350', '2019', 2);
INSERT INTO b19_PLANEJA (al_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo, ano, semestre) VALUES (7, '1987', 'MAE', '0123', '2021', 1);
INSERT INTO b19_PLANEJA (al_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo, ano, semestre) VALUES (8, '1981', 'MAT', '0359', '2021', 1);
INSERT INTO b19_PLANEJA (al_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo, ano, semestre) VALUES (5, '1981', 'MAT', '0359', '2020', 2);
INSERT INTO b19_PLANEJA (al_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo, ano, semestre) VALUES (5, '2005', 'MAE', '0666', '2020', 1);
INSERT INTO b19_PLANEJA (al_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo, ano, semestre) VALUES (10, '1997', 'MAC', '0350', '2020', 1);
INSERT INTO b19_PLANEJA (al_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo, ano, semestre) VALUES (10, '2011', 'MAE', '9889', '2020', 2);
INSERT INTO b19_PLANEJA (al_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo, ano, semestre) VALUES (10, '1981', 'MAT', '0359', '2021', 1);

-- b20_MINISTRA
INSERT INTO b20_MINISTRA (pf_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo) VALUES (1, '2018','MAT','0256');
INSERT INTO b20_MINISTRA (pf_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo) VALUES (1, '1981', 'MAT', '0359');
INSERT INTO b20_MINISTRA (pf_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo) VALUES (3, '1987', 'MAE', '0123');
INSERT INTO b20_MINISTRA (pf_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo) VALUES (3, '2011', 'MAE', '9889');
INSERT INTO b20_MINISTRA (pf_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo) VALUES (4, '2016', 'MAC', '0300');
INSERT INTO b20_MINISTRA (pf_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo) VALUES (5, '2005', 'MAE', '0666');
INSERT INTO b20_MINISTRA (pf_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo) VALUES (6, '1997', 'MAC', '0350');
INSERT INTO b20_MINISTRA (pf_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo) VALUES (7, '1997','MAC','0425');
INSERT INTO b20_MINISTRA (pf_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo) VALUES (9, '2005','MAC','0121');
INSERT INTO b20_MINISTRA (pf_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo) VALUES (10, '1997','MAC','0425');


-- b21_ADMINISTRA
INSERT INTO b21_ADMINISTRA (ad_pe_nusp, cur_codigo, inicio_gestao, fim_gestao) SELECT 1, 1, extract(year from current_timestamp), extract(year from current_timestamp);
INSERT INTO b21_ADMINISTRA (ad_pe_nusp, cur_codigo, inicio_gestao, fim_gestao) SELECT 1, 2, extract(year from current_timestamp), extract(year from current_timestamp);
INSERT INTO b21_ADMINISTRA (ad_pe_nusp, cur_codigo, inicio_gestao, fim_gestao) SELECT 1, 3, extract(year from current_timestamp), extract(year from current_timestamp);
INSERT INTO b21_ADMINISTRA (ad_pe_nusp, cur_codigo, inicio_gestao, fim_gestao) SELECT 5, 4, extract(year from current_timestamp), extract(year from current_timestamp);
INSERT INTO b21_ADMINISTRA (ad_pe_nusp, cur_codigo, inicio_gestao, fim_gestao) SELECT 5, 5, extract(year from current_timestamp), extract(year from current_timestamp);
INSERT INTO b21_ADMINISTRA (ad_pe_nusp, cur_codigo, inicio_gestao, fim_gestao) SELECT 8, 6, extract(year from current_timestamp), extract(year from current_timestamp);
INSERT INTO b21_ADMINISTRA (ad_pe_nusp, cur_codigo, inicio_gestao, fim_gestao) SELECT 9, 7, extract(year from current_timestamp), extract(year from current_timestamp);
INSERT INTO b21_ADMINISTRA (ad_pe_nusp, cur_codigo, inicio_gestao, fim_gestao) SELECT 9, 8, extract(year from current_timestamp), extract(year from current_timestamp);
INSERT INTO b21_ADMINISTRA (ad_pe_nusp, cur_codigo, inicio_gestao, fim_gestao) SELECT 10, 9, extract(year from current_timestamp), extract(year from current_timestamp);
INSERT INTO b21_ADMINISTRA (ad_pe_nusp, cur_codigo, inicio_gestao, fim_gestao) SELECT 2, 10, extract(year from current_timestamp), extract(year from current_timestamp);


-- b22_OFERECIMENTO
INSERT INTO b22_OFERECIMENTO (pf_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo, semestre, ano) VALUES (1, '2018','MAT','0256', 1, 2018);
INSERT INTO b22_OFERECIMENTO (pf_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo, semestre, ano) VALUES (1, '1981', 'MAT', '0359', 2, 2000);
INSERT INTO b22_OFERECIMENTO (pf_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo, semestre, ano) VALUES (3, '1987', 'MAE', '0123', 1, 1999);
INSERT INTO b22_OFERECIMENTO (pf_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo, semestre, ano) VALUES (3, '2011', 'MAE', '9889', 2, 2012);
INSERT INTO b22_OFERECIMENTO (pf_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo, semestre, ano) VALUES (4, '2016', 'MAC', '0300', 1, 2017);
INSERT INTO b22_OFERECIMENTO (pf_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo, semestre, ano) VALUES (5, '2005', 'MAE', '0666', 1, 2006);
INSERT INTO b22_OFERECIMENTO (pf_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo, semestre, ano) VALUES (6, '1997', 'MAC', '0350', 2, 1998);
INSERT INTO b22_OFERECIMENTO (pf_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo, semestre, ano) VALUES (7, '1997','MAC','0425', 1, 1998);
INSERT INTO b22_OFERECIMENTO (pf_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo, semestre, ano) VALUES (9, '2005','MAC','0121', 2, 2007);
INSERT INTO b22_OFERECIMENTO (pf_pe_nusp, dis_data_inicio, dis_departamento, dis_codigo, semestre, ano) VALUES (10, '1997','MAC','0425', 1, 2001);

-- b23_CURSA
INSERT INTO b23_CURSA (al_pe_nusp, of_pf_pe_nusp, of_dis_data_inicio, of_dis_departamento, of_dis_codigo, of_semestre, of_ano, nota, status) VALUES (1, 1, '2018','MAT','0256', 1, 2018, NULL, 'I');
INSERT INTO b23_CURSA (al_pe_nusp, of_pf_pe_nusp, of_dis_data_inicio, of_dis_departamento, of_dis_codigo, of_semestre, of_ano, nota, status) VALUES (2, 7, '1997','MAC','0425', 1, 1998, 2.5, 'R');
INSERT INTO b23_CURSA (al_pe_nusp, of_pf_pe_nusp, of_dis_data_inicio, of_dis_departamento, of_dis_codigo, of_semestre, of_ano, nota, status) VALUES (2, 3, '1987', 'MAE', '0123', 1, 1999, 6.0, 'A');
INSERT INTO b23_CURSA (al_pe_nusp, of_pf_pe_nusp, of_dis_data_inicio, of_dis_departamento, of_dis_codigo, of_semestre, of_ano, nota, status) VALUES (3, 1, '2018','MAT','0256', 1, 2018, NULL, 'I');
INSERT INTO b23_CURSA (al_pe_nusp, of_pf_pe_nusp, of_dis_data_inicio, of_dis_departamento, of_dis_codigo, of_semestre, of_ano, nota, status) VALUES (4, 7, '1997','MAC','0425', 1, 1998, 5.0, 'A');
INSERT INTO b23_CURSA (al_pe_nusp, of_pf_pe_nusp, of_dis_data_inicio, of_dis_departamento, of_dis_codigo, of_semestre, of_ano, nota, status) VALUES (4, 1, '2018','MAT','0256', 1, 2018, NULL, 'I');
INSERT INTO b23_CURSA (al_pe_nusp, of_pf_pe_nusp, of_dis_data_inicio, of_dis_departamento, of_dis_codigo, of_semestre, of_ano, nota, status) VALUES (10, 3, '1987', 'MAE', '0123', 1, 1999, 4.9, 'R');
INSERT INTO b23_CURSA (al_pe_nusp, of_pf_pe_nusp, of_dis_data_inicio, of_dis_departamento, of_dis_codigo, of_semestre, of_ano, nota, status) VALUES (9, 7, '1997','MAC','0425', 1, 1998, 10.0, 'A');
INSERT INTO b23_CURSA (al_pe_nusp, of_pf_pe_nusp, of_dis_data_inicio, of_dis_departamento, of_dis_codigo, of_semestre, of_ano, nota, status) VALUES (7, 3, '1987', 'MAE', '0123', 1, 1999, 7.0, 'A');
INSERT INTO b23_CURSA (al_pe_nusp, of_pf_pe_nusp, of_dis_data_inicio, of_dis_departamento, of_dis_codigo, of_semestre, of_ano, nota, status) VALUES (6, 3, '1987', 'MAE', '0123', 1, 1999, 3.4, 'R');