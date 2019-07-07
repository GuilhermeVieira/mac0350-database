\c peo_cur;

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

-- b23_CURSA
INSERT INTO b23_CURSA (al_pe_nusp, of_id, nota, status) VALUES (1, 1, NULL, 'I');
INSERT INTO b23_CURSA (al_pe_nusp, of_id, nota, status) VALUES (2, 8, 2.5, 'R');
INSERT INTO b23_CURSA (al_pe_nusp, of_id, nota, status) VALUES (2, 3, 6.0, 'A');
INSERT INTO b23_CURSA (al_pe_nusp, of_id, nota, status) VALUES (3, 1, NULL, 'I');
INSERT INTO b23_CURSA (al_pe_nusp, of_id, nota, status) VALUES (4, 8, 5.0, 'A');
INSERT INTO b23_CURSA (al_pe_nusp, of_id, nota, status) VALUES (4, 1, NULL, 'I');
INSERT INTO b23_CURSA (al_pe_nusp, of_id, nota, status) VALUES (10, 3, 4.9, 'R');
INSERT INTO b23_CURSA (al_pe_nusp, of_id, nota, status) VALUES (9, 8, 10.0, 'A');
INSERT INTO b23_CURSA (al_pe_nusp, of_id, nota, status) VALUES (7, 3, 7.0, 'A');
INSERT INTO b23_CURSA (al_pe_nusp, of_id, nota, status) VALUES (6, 3, 3.4, 'R');

-- b25_REL_OFER_PROF
INSERT INTO b25_REL_OFER_PROF (ofer_id, prof_nusp) VALUES (1, 1);
INSERT INTO b25_REL_OFER_PROF (ofer_id, prof_nusp) VALUES (2, 1);
INSERT INTO b25_REL_OFER_PROF (ofer_id, prof_nusp) VALUES (3, 3);
INSERT INTO b25_REL_OFER_PROF (ofer_id, prof_nusp) VALUES (4, 3);
INSERT INTO b25_REL_OFER_PROF (ofer_id, prof_nusp) VALUES (5, 4);
INSERT INTO b25_REL_OFER_PROF (ofer_id, prof_nusp) VALUES (6, 5);
INSERT INTO b25_REL_OFER_PROF (ofer_id, prof_nusp) VALUES (7, 6);
INSERT INTO b25_REL_OFER_PROF (ofer_id, prof_nusp) VALUES (8, 7);
INSERT INTO b25_REL_OFER_PROF (ofer_id, prof_nusp) VALUES (9, 9);
INSERT INTO b25_REL_OFER_PROF (ofer_id, prof_nusp) VALUES (10, 10);
