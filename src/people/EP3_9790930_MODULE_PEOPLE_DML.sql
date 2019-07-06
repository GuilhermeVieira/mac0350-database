\c people;

-- b05_PESSOA
INSERT INTO b05_PESSOA (nusp, pnome, snome) VALUES (1, 'Roberto', 'da Guia');
INSERT INTO b05_PESSOA (nusp, pnome, snome) VALUES (2, 'Gilberto', 'Mercos');
INSERT INTO b05_PESSOA (nusp, pnome, snome) VALUES (3, 'Pedro', 'Tavares');
INSERT INTO b05_PESSOA (nusp, pnome, snome) VALUES (4, 'João', 'Guets');
INSERT INTO b05_PESSOA (nusp, pnome, snome) VALUES (5, 'James', 'Hetfield');
INSERT INTO b05_PESSOA (nusp, pnome, snome) VALUES (6, 'Guilherme', 'da Silva de Carvalh');
INSERT INTO b05_PESSOA (nusp, pnome, snome) VALUES (7, 'Jose', 'Augusto de Oliveira');
INSERT INTO b05_PESSOA (nusp, pnome, snome) VALUES (8, 'Luis', 'Gomes');
INSERT INTO b05_PESSOA (nusp, pnome, snome) VALUES (9, 'Carlos', 'Ferreira');
INSERT INTO b05_PESSOA (nusp, pnome, snome) VALUES (10, 'Carlos', 'da Lua');

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
