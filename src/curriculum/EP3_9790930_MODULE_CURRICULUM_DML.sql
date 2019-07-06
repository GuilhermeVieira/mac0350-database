\c curriculum;

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

-- b22_OFERECIMENTO
INSERT INTO b22_OFERECIMENTO (dis_data_inicio, dis_departamento, dis_codigo, semestre, ano) VALUES ('2018','MAT','0256', 1, 2018);
INSERT INTO b22_OFERECIMENTO (dis_data_inicio, dis_departamento, dis_codigo, semestre, ano) VALUES ('1981', 'MAT', '0359', 2, 2000);
INSERT INTO b22_OFERECIMENTO (dis_data_inicio, dis_departamento, dis_codigo, semestre, ano) VALUES ('1987', 'MAE', '0123', 1, 1999);
INSERT INTO b22_OFERECIMENTO (dis_data_inicio, dis_departamento, dis_codigo, semestre, ano) VALUES ('2011', 'MAE', '9889', 2, 2012);
INSERT INTO b22_OFERECIMENTO (dis_data_inicio, dis_departamento, dis_codigo, semestre, ano) VALUES ('2016', 'MAC', '0300', 1, 2017);
INSERT INTO b22_OFERECIMENTO (dis_data_inicio, dis_departamento, dis_codigo, semestre, ano) VALUES ('2005', 'MAE', '0666', 1, 2006);
INSERT INTO b22_OFERECIMENTO (dis_data_inicio, dis_departamento, dis_codigo, semestre, ano) VALUES ('1997', 'MAC', '0350', 2, 1998);
INSERT INTO b22_OFERECIMENTO (dis_data_inicio, dis_departamento, dis_codigo, semestre, ano) VALUES ('1997','MAC','0425', 1, 1998);
INSERT INTO b22_OFERECIMENTO (dis_data_inicio, dis_departamento, dis_codigo, semestre, ano) VALUES ('2005','MAC','0121', 2, 2007);
INSERT INTO b22_OFERECIMENTO (dis_data_inicio, dis_departamento, dis_codigo, semestre, ano) VALUES ('1997','MAC','0425', 1, 2001);
