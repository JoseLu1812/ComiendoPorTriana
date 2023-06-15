
-- Admins
insert into user_entity (account_non_expired, account_non_locked, created_at, credentials_non_expired, email, enabled, full_name, last_password_change_at, password, username, id) values ( true, true, '2023-01-31', true, 'luismilopezdam@gmail.com', true, 'Luis Miguel Lopez Magaña', '2023-02-01', '{bcrypt}$2a$12$Db0G4u8PtCoT2MdanNMCxOYMocf1UZms8zIcqyW37gc5SdgJuhZr6', 'LuismiDam', '7174c5b6-50d0-42ea-97db-cc1948f296c3'); --Contra: Debugear_123
insert into user_roles (user_id, roles) values ('7174c5b6-50d0-42ea-97db-cc1948f296c3', 0);

insert into user_entity (account_non_expired, account_non_locked, created_at, credentials_non_expired, email, enabled, full_name, last_password_change_at, password, username, id) values ( true, true, '2023-01-31', true, 'salestriana@gmail.com', true, 'Salesianos San Pedro Triana', '2023-02-01', '{bcrypt}$2a$12$ghbA0nSNCnnEMYO.s1cgPuyl7EB2YGsw.sX01yorBz.b7jFKNryrm', 'SalesianosTriana', 'e48d8ca7-e3a6-42ed-bf93-dd1bacb1ce75'); --Contra: SanPedro_123
insert into user_roles (user_id, roles) values ('e48d8ca7-e3a6-42ed-bf93-dd1bacb1ce75', 0);

insert into user_entity (account_non_expired, account_non_locked, created_at, credentials_non_expired, email, enabled, full_name, last_password_change_at, password, username, id) values ( true, true, '2023-01-31', true, 'joseluishidalgonavas@gmail.com', true, 'José Luis Hidalgo Navas', '2023-02-01', '{bcrypt}$2a$12$bLAE3G3g8PNV.ln9e/rzu.88eEoeWcMeojzFiMFqg/PPx2t4kjKEa', 'JoseluHN', 'dfeab18f-ecbc-401a-ac58-be3c6d2a496e'); --Contra: Usuario_123
insert into user_roles (user_id, roles) values ('dfeab18f-ecbc-401a-ac58-be3c6d2a496e', 0);




-- BARMAN
insert into user_entity (account_non_expired, account_non_locked, created_at, credentials_non_expired, email, enabled, full_name, last_password_change_at, password, username, id) values ( true, true, '2023-01-31', true, 'cjeirenetriana@gmail.com', true, 'Centro Juvenil Eirené', '2023-02-01', '{bcrypt}$2a$12$MDdQ80jBSFBCzQy1EUrrGeXjZ6VpHGTrML8AUPbVdoMgHZxOYlNMO', 'CjEirene', '53395e14-60d3-46d8-804f-fafd86c72a19'); --Contra: Master_1812
insert into user_roles (user_id, roles) values ('53395e14-60d3-46d8-804f-fafd86c72a19', 1);

insert into user_entity (account_non_expired, account_non_locked, created_at, credentials_non_expired, email, enabled, full_name, last_password_change_at, password, username, id) values ( true, true, '2023-02-24', true, 'mauxi@gmail.com', true, 'Maria Auxiliadora de los Cristianos', '2023-02-24', '{bcrypt}$2a$12$xk.4LGVEuCnalA.GkaC5p..RILjvMo85x7w0730H0xTqVMrrTOnky', 'MariaAuxi', '11e2191e-2056-43e7-be3b-b9b77066739e'); -- Salesianos_123
insert into user_roles (user_id, roles) values ('11e2191e-2056-43e7-be3b-b9b77066739e', 1);

insert into user_entity (account_non_expired, account_non_locked, created_at, credentials_non_expired, email, enabled, full_name, last_password_change_at, password, username, id) values ( true, true, '2023-02-11', true, 'cs55@gmail.com', true, 'Carlos Sainz Vazquez de Castro', '2023-02-11', '{bcrypt}$2a$12$vpT8pDiW5t21a4MGq5W/xez2eFTyzWrzOZN8wgWoVz53SBUavogFO', 'CSainz55', '062a6a92-98eb-43c8-bbc0-4089b36962a4'); -- Ferrari_55
insert into user_roles (user_id, roles) values ('062a6a92-98eb-43c8-bbc0-4089b36962a4', 1);

insert into user_entity (account_non_expired, account_non_locked, created_at, credentials_non_expired, email, enabled, full_name, last_password_change_at, password, username, id) values ( true, true, '2023-02-12', true, 'mcampos@gmail.com', true, 'Miguel Campos Rivera', '2023-02-11', '{bcrypt}$2a$12$hk.rJWIH.eBLmqcI63DEUuSr9s5Je/axZ7tANsUIjhlVYQtK8HQiu', 'MiguelC6', 'e70c9108-ddcf-416b-a957-01feed566a64'); -- MisHijos_6
insert into user_roles (user_id, roles) values ('e70c9108-ddcf-416b-a957-01feed566a64', 1);

insert into user_entity (account_non_expired, account_non_locked, created_at, credentials_non_expired, email, enabled, full_name, last_password_change_at, password, username, id) values ( true, true, '2023-02-01', true, 'fjdn@gmail.com', true, 'Francisco Jose Dominguez Navas', '2023-02-01', '{bcrypt}$2a$12$yQyiJvrPoU4K5TfRG7UpVOdjDm36APuJFk6XpywwEq.9XsV3aWDam', 'Franjdn', 'c8d2cf0d-1868-4ced-892a-27bea770def6'); --Contra: Triana_123
insert into user_roles (user_id, roles) values ('c8d2cf0d-1868-4ced-892a-27bea770def6', 1);

insert into user_entity (account_non_expired, account_non_locked, created_at, credentials_non_expired, email, enabled, full_name, last_password_change_at, password, username, id) values ( true, true, '2023-02-02', true, 'jeh@gmail.com', true, 'Julia Estevez Hidalgo', '2023-02-02', '{bcrypt}$2a$12$CPcJtGCLIQzdNqkbSSfnzebwvMnIDgiY0IQ5QZwqkc8ncCXyCFG4u', 'Juliaeh', 'd9554666-0096-469d-96c2-eb20e31dcb23'); --Contra: Cordoba_123
insert into user_roles (user_id, roles) values ('d9554666-0096-469d-96c2-eb20e31dcb23', 1);

insert into user_entity (account_non_expired, account_non_locked, created_at, credentials_non_expired, email, enabled, full_name, last_password_change_at, password, username, id) values ( true, true, '2023-02-10', true, 'pmm@email.com', true, 'Paola Madrid Morata', '2023-02-10', '{bcrypt}$2a$12$/rP9y4dOFIzx/l39Ysm1QuXmxBBajMvD/HNyNouRon0EEMcq7o0cS', 'Paolitamm', '5cbdc9a6-abb7-4b8d-9766-6edc374ed096'); -- Paolita_123
insert into user_roles (user_id, roles) values ('5cbdc9a6-abb7-4b8d-9766-6edc374ed096', 1);

insert into user_entity (account_non_expired, account_non_locked, created_at, credentials_non_expired, email, enabled, full_name, last_password_change_at, password, username, id) values ( true, true, '2023-02-10', true, 'ftorres@gmail.com', true, 'Fernando Torres Sanz', '2023-02-10', '{bcrypt}$2a$12$s3D1SWG7W4/W53vvIXbjaOJdDwXHBLP2J2RzTjgNegevRtWlAkTIe', 'FTorres', '117b5abd-b3e2-4b5e-a12a-f02b76204aee'); -- Atleti_123
insert into user_roles (user_id, roles) values ('117b5abd-b3e2-4b5e-a12a-f02b76204aee', 1);

insert into user_entity (account_non_expired, account_non_locked, created_at, credentials_non_expired, email, enabled, full_name, last_password_change_at, password, username, id) values ( true, true, '2023-02-20', true, 'mpnt@gmail.com', true, 'Maria del Pilar Navas Tenor', '2023-02-20', '{bcrypt}$2a$12$67RB4S92tG.MbeyrffgeC.XNT.8/u/tV1xVZvp6SeejovhEAIbayu', 'MPilarnt', '9d6076d7-233d-4111-bd19-1c589d2a2764'); -- Mairena_123
insert into user_roles (user_id, roles) values ('9d6076d7-233d-4111-bd19-1c589d2a2764', 1);

insert into user_entity (account_non_expired, account_non_locked, created_at, credentials_non_expired, email, enabled, full_name, last_password_change_at, password, username, id) values ( true, true, '2023-02-21', true, 'enrihn@gmail.com', true, 'Enrique Hidalgo Navas', '2023-02-21', '{bcrypt}$2a$12$WJolP2WdTXRE9NlDQmTVYu4g46K.YZp153YwryQBwfTlivoDBZKCy', 'Enriquehn', '12b34a1e-fdbf-4aa6-8ee6-a441b2312193'); -- Bolita-123
insert into user_roles (user_id, roles) values ('12b34a1e-fdbf-4aa6-8ee6-a441b2312193', 1);

insert into user_entity (account_non_expired, account_non_locked, created_at, credentials_non_expired, email, enabled, full_name, last_password_change_at, password, username, id) values ( true, true, '2023-02-21', true, 'jlhidher@gmail.com', true, 'Jose Luis Hidalgo Herrera', '2023-02-21', '{bcrypt}$2a$12$S3aC/RPMdtCjBH8cOncjRu8UXW9aE8O0mUy19bIAvwyNDteK3vTva', 'UiperoJL', 'bbc620d2-b534-4e6f-91bf-8163a164df43'); -- Uipero_123
insert into user_roles (user_id, roles) values ('bbc620d2-b534-4e6f-91bf-8163a164df43', 1);

insert into user_entity (account_non_expired, account_non_locked, created_at, credentials_non_expired, email, enabled, full_name, last_password_change_at, password, username, id) values ( true, true, '2023-02-22', true, 'anatenor@gmail.com', true, 'Ana Tenor', '2023-02-22', '{bcrypt}$2a$12$xHa4UE02X.dXtmrgifCPnesiZvxMqewVqeiGtKVVg8e.mkedjchf6', 'AbuAna', '683cf076-0f88-4838-8e4f-91de1a78cfae'); -- Badolatosa_123
insert into user_roles (user_id, roles) values ('683cf076-0f88-4838-8e4f-91de1a78cfae', 1);

insert into user_entity (account_non_expired, account_non_locked, created_at, credentials_non_expired, email, enabled, full_name, last_password_change_at, password, username, id) values ( true, true, '2023-02-24', true, 'abupepe@gmail.com', true, 'Abuelo Jose Navas', '2023-02-25', '{bcrypt}$2a$12$BzfJmbuan87SOLndrlX1ket/221c5pDQtlKUotxZRgGMHrFVoEl4a', 'AbueloPepe', '323cddc9-09a1-4107-8e6d-9199aa2f7baf'); -- Chaquetero_123
insert into user_roles (user_id, roles) values ('323cddc9-09a1-4107-8e6d-9199aa2f7baf', 1);

insert into user_entity (account_non_expired, account_non_locked, created_at, credentials_non_expired, email, enabled, full_name, last_password_change_at, password, username, id) values ( true, true, '2023-02-16', true, 'mllorente@gmail.com', true, 'Marcos Llorente Moreno', '2023-02-16', '{bcrypt}$2a$12$PAzJEYo3z8ZpGiuTjIdT7.lYGT9PY61uLlEM8nemXTqiIqjBcxN/u', 'MarcosLlorente14', '9f771c2e-01b0-4fe1-adb7-45aa09eb4c1e'); -- Colchonero_123
insert into user_roles (user_id, roles) values ('9f771c2e-01b0-4fe1-adb7-45aa09eb4c1e', 1);

insert into user_entity (account_non_expired, account_non_locked, created_at, credentials_non_expired, email, enabled, full_name, last_password_change_at, password, username, id) values ( true, true, '2023-02-18', true, 'falonso14@gmail.com', true, 'Fernando Alonso Diaz', '2023-02-18', '{bcrypt}$2a$12$8v4LjeZuOi1G1K/zt9F.OeG81YORxBJROg0krTbJd159XOYgVnS7W', 'ElNano14', 'e31194db-3c18-47a5-bfdb-172ceebf7660'); -- AstonMartin_14
insert into user_roles (user_id, roles) values ('e31194db-3c18-47a5-bfdb-172ceebf7660', 1);



-- Clients

insert into user_entity (account_non_expired, account_non_locked, created_at, credentials_non_expired, email, enabled, full_name, last_password_change_at, password, username, id) values ( true, true, '2023-02-05', true, 'donboscosales@gmail.com', true, 'Giovanni Melchiorre Bosco', '2023-02-05', '{bcrypt}$2a$12$sOaWyib7becPd9vFF8bbNOBNLSQdZfDtN/FIycjaqa22NDJklPVma', 'DonBosco', 'a0f8d909-7bc4-4871-815a-b5962b9b3dc4'); -- Salesianos_2023
insert into user_roles (user_id, roles) values ('a0f8d909-7bc4-4871-815a-b5962b9b3dc4', 2);

insert into user_entity (account_non_expired, account_non_locked, created_at, credentials_non_expired, email, enabled, full_name, last_password_change_at, password, username, id) values ( true, true, '2023-02-05', true, 'leo10messi@gmail.com', true, 'Lionel Andres Messi Cuccittini', '2023-02-05', '{bcrypt}$2a$12$94w0fDtwmgFVgsMi6TR7uOZJ0NWCJ6oMIM8J7uim2wtNFL03aZiI.', 'D10SMessi', '50c82e8c-d1ce-4a19-9cb0-c86ac638d6af'); -- Argentina_10
insert into user_roles (user_id, roles) values ('50c82e8c-d1ce-4a19-9cb0-c86ac638d6af', 2);

insert into user_entity (account_non_expired, account_non_locked, created_at, credentials_non_expired, email, enabled, full_name, last_password_change_at, password, username, id) values ( true, true, '2023-02-10', true, 'pdelarosa@gmail.com', true, 'Pedro Martinez de la Rosa', '2023-02-10', '{bcrypt}$2a$12$c1qgJRc5OrzUuDaWA9xGLOL85zyjRPv.IXTmvlHFHR2rZZkh0n4Oq', 'PdelaRosa', 'dceb21bb-275b-4255-ae6d-9826fb8c820d'); -- Bahrein_2005
insert into user_roles (user_id, roles) values ('dceb21bb-275b-4255-ae6d-9826fb8c820d', 2);

insert into user_entity (account_non_expired, account_non_locked, created_at, credentials_non_expired, email, enabled, full_name, last_password_change_at, password, username, id) values ( true, true, '2023-02-15', true, 'conchiv@gmail.com', true, 'Concepcion Herrera Viso', '2023-02-15', '{bcrypt}$2a$12$XH1Kslcn8EGCWqxavdWpFOVDGNLRgTZFcP/poL3t6ZTc790O7tOjS', 'ConchiHV', 'dfa72e56-9b25-4344-b8ef-440208aadfda'); --Cordoba_123
insert into user_roles (user_id, roles) values ('dfa72e56-9b25-4344-b8ef-440208aadfda', 2);

insert into user_entity (account_non_expired, account_non_locked, created_at, credentials_non_expired, email, enabled, full_name, last_password_change_at, password, username, id) values ( true, true, '2023-02-15', true, 'paquirri@gmail.com', true, 'Francisco Hidalgo Sanchez', '2023-02-18', '{bcrypt}$2a$12$6yOAPJ92MtllB2TOw.Fq3e1X2JqD9ufAOASXsVB4WLNMKGa9MWcJm', 'PaquirriH', '4479e92b-4278-4d9a-b434-8703033ed298'); -- Arcangel_123
insert into user_roles (user_id, roles) values ('4479e92b-4278-4d9a-b434-8703033ed298', 2);

insert into bar (created_at , description , address , image , lat , lng , name , owner_id , id) values ( '2023-02-05', 'Bar de toda la vida al mas puro estilo sevillano. Caracterizado por sus serranitos, también destacar su alioli y su flamenquin.', 'C/Justino Matute, 6', 'cibeles.jpg', 37.381535952951026, -6.005643360850677, 'Bar Cibeles 2', 'c8d2cf0d-1868-4ced-892a-27bea770def6', '80adfa7a-6a63-42f3-8a1e-153039544e7b');
insert into bar (created_at , description , address , image , lat , lng , name , owner_id , id) values ( '2023-02-06', 'Este clasico bar trianero lleva desde 1970 sirviendo codornices fritas y adobadas y son los pajaritos mas celebrados de toda Sevilla.', 'Avenida Santa Cecilia, 2', 'ruperto.jpg', 37.38214412979673, -6.008510962123328,'Bar Ruperto', 'd9554666-0096-469d-96c2-eb20e31dcb23', 'c2dde920-80df-4743-86d4-3545269edcb7');
insert into bar (created_at , description , address , image , lat , lng , name , owner_id , id) values ( '2023-02-10', 'Es de los bares clasicos del barrio y su comida mas clasica todavia. Destaca sin duda por sus tortillitas de camarones, el adobo y las coquinas', 'C/San Jacinto, 4', 'bar-altozano.jpg', 37.38522974391531, -6.0029245896857, 'Cafe Bar Altozano de Triana', '5cbdc9a6-abb7-4b8d-9766-6edc374ed096','625cd031-1a54-4d3d-a6bc-b835909fa18e');
insert into bar (created_at , description , address , image , lat , lng , name , owner_id , id) values ( '2023-02-10', 'Ubicado en el antiguo faro de Triana, Maria Trifulca es una comida de lujo sobre el Guadalquivir y la opcion perfecta para ocasiones especiales.', 'Puente de Triana', 'maria-trifulca.jpg', 37.38577216840654, -6.002757532015348, 'Mariatrifulca', '117b5abd-b3e2-4b5e-a12a-f02b76204aee', 'a7b81431-43a1-4e72-8685-3647f12b3047');
insert into bar (created_at , description , address , image , lat , lng , name , owner_id , id) values ( '2023-02-12', 'Muy versatil, su moderna carta se adapta tanto a cenas romanticas como comidas de empresa, como tener la posibilidad de tomarte una copa etc sin perder ni un apice en modernidad o calidad en el servicio.', 'C/Betis, 69', 'abades.jpg', 37.38189077816309, -5.998056947356217, 'Abades Triana', '062a6a92-98eb-43c8-bbc0-4089b36962a4', 'a3c714bb-8588-4591-a7d1-3fa058304c9c');
insert into bar (created_at , description , address , image , lat , lng , name , owner_id , id) values ( '2023-02-13', 'Un lugar emblematico donde tomar algo, tambien imprescindible en el top ten de bares y restaurantes donde comer de tapas en Triana bien y barato.', 'C/San Jacinto, 16', 'patio-san-eloy.jpg', 37.384739022812035, -6.004143719793098, 'Patio de San Eloy', 'e70c9108-ddcf-416b-a957-01feed566a64', '912b2cb8-389f-408a-889d-95ea65250e67');
insert into bar (created_at , description , address , image , lat , lng , name , owner_id , id) values ( '2023-02-18', 'De los mejores lugares trianeros con diferencia. No es baratisimo pero merece mucho la pena por algunas de las exquisiteces que puedes tomar. Ademas dentro de la comida clasica suelen ser innovadores.', 'C/San Jacinto, 49', 'blanca-paloma.jpg', 37.383365723595006, -6.005873647356186, 'Blanca Paloma', '9d6076d7-233d-4111-bd19-1c589d2a2764', '3bb95209-da68-4f55-9eed-ba0001a1ad3c');
insert into bar (created_at , description , address , image , lat , lng , name , owner_id , id) values ( '2023-02-19', 'El macarron toro, las arepas y la pastela son algunas de las mejores comidas del lugar, por no hablar de los postres. Dejad un hueco (aunque sea complicado) para el cremoso de azafran.', 'C/Vega, 10', 'vega-10.jpg', 37.38082254807065, -5.999638732015498, 'Vega 10', '12b34a1e-fdbf-4aa6-8ee6-a441b2312193', '7055f932-a1ea-4fe7-a4b2-0da9a871f644');
insert into bar (created_at , description , address , image , lat , lng , name , owner_id , id) values ( '2023-02-20', 'Una tasca tradicional de las mas tipicas y uno de los mejores bares de tapas en Triana. Comida casera, con buenas raciones y de calidad.', 'C/Calle Alfareria, 5', 'casa-diego.jpg', 37.384698819773966, -6.004723889685749, ' Antigua Casa Diego', 'bbc620d2-b534-4e6f-91bf-8163a164df43', 'e0469d55-f941-44d0-93ae-1ffed49d300c');
insert into bar (created_at , description , address , image , lat , lng , name , owner_id , id) values ( '2023-02-20', 'Incluimos esta freiduria entre las recomendaciones para comer de tapas en Triana bien y barato, tal y como nos la dieron.', 'C/Rodrigo de Triana, 51', 'freiduria.jpg', 37.3834611978243, -6.002250003180201, 'Freiduria Reina Victoria', '683cf076-0f88-4838-8e4f-91de1a78cfae', 'a8046137-373a-40a7-85f3-8d5f241bbceb');
insert into bar (created_at , description , address , image , lat , lng , name , owner_id , id) values ( '2023-02-22', 'Lugar recomendadisimo en todos los sentidos. El local esta bien decorado y es acogedor. No hay una gran variedad pero eso es lo de menos, porque lo compensa con creces sus tataki de atun y sus croquetas de rabo de toro.', 'C/Victoria, 8', 'victoria.jpg', 37.38342752443011, -6.002539516674651, 'Victoria 8', '323cddc9-09a1-4107-8e6d-9199aa2f7baf', 'bf260a9b-3438-4067-b3d2-030b782b1388');
insert into bar (created_at , description , address , image , lat , lng , name , owner_id , id) values ( '2023-02-16', 'Una taberna donde comer en Triana de tapas o de raciones sentado en su terraza. No te pierdas el adobo, las acedias o el secreto. Tambien recomiendan las bandejas de pescaito frito, el rabo de toro y el arroz negro.', 'C/San Jacinto, 21', 'taberna-miami.jpg', 37.38453687065398, -6.0040166320153805, 'Taberna Miami', '9f771c2e-01b0-4fe1-adb7-45aa09eb4c1e', 'bf7c2b27-6396-4abf-8eed-b93933290621');
insert into bar (created_at , description , address , image , lat , lng , name , owner_id , id) values ( '2023-02-08', 'Su amplia carta tiene manjares tales como: ensaladilla de pulpo, coca de gorgonzola, dados de atún rojo sobre pan, puntas de solomillo iberico y hamburguesa de ternera black angus...', 'C/Manuel Pareja Obregon, 2', 'trianilla.jpg', 37.38644028954386, -6.00933573201529, 'Trianilla', 'e31194db-3c18-47a5-bfdb-172ceebf7660', '464f01c6-7f8b-4afb-b9ba-44fdf9db9631');
insert into bar (created_at , description , address , image , lat , lng , name , owner_id , id) values ( '2023-02-21', 'Un sitio con encanto en pleno corazon del barrio de Triana, donde cocina tradicional se fusiona consiguiendo sabores unicos. Destacan platos como el Tomate Estrellado o el Tartar de Atun y Aguacate con Limoncello. ', 'C/Manuel Pareja Obregon, 4', 'la-cuadra.jpg', 37.38998621424698, -6.009189385323159, 'Bodega La Cuadra Triana', '11e2191e-2056-43e7-be3b-b9b77066739e', '63d502f3-3c5e-4eef-ae9c-21840e243faf');
insert into bar (created_at , description , address , image , lat , lng , name , owner_id , id) values ( '2023-04-16', 'Bar trianero con una amplia variedad de tapas y platos, donde se pueden destacar el gran cachopo casero, el churrasco con mojo picon,el chuleton de ternera o la fritura de pescado. Gran ambiente y buen historico servicio.', 'C/Manuel Arellano, 37', 'gordito.jpg', 37.385511092988935, -6.013123010606633, 'El Gordito de Triana', 'e31194db-3c18-47a5-bfdb-172ceebf7660', 'a6aa5b05-20c6-4690-a326-4de49157f2c4');
insert into bar (created_at , description , address , image , lat , lng , name , owner_id , id) values ( '2023-04-17', 'Esta tasca con cocina vista, ambiente vanguardista y terraza donde destaca un dia soleado, propone platos gourmet de temporada. Alta recomendacion del Arroz meloso de setas, la Ensaladilla y las Natillas de postre.', 'C/Numancia, 5', 'puratasca.jpg', 37.38678780389108, -6.010209658435777, 'Puratasca', 'e31194db-3c18-47a5-bfdb-172ceebf7660', '8b5c0191-f9af-416d-9c13-cdba54fec5fc');
insert into bar (created_at , description , address , image , lat , lng , name , owner_id , id) values ( '2023-05-18', 'Restaurante informal con platos mediterraneos, de raciones variadas y abundantes. El elemento mas representativo del lugar es su gran terraza con vistas al Río Gualdaquivir.', 'Paseo de Ntra. Sra. de la O', 'la-barca.jpg', 37.38792583557006, -6.005590894402366, 'Restaurante La Barca de Calderon', 'e31194db-3c18-47a5-bfdb-172ceebf7660', 'aca2030f-906e-4aad-9521-64d75944248a');
insert into bar (created_at , description , address , image , lat , lng , name , owner_id , id) values ( '2023-05-24', 'En un local familiar donde te sentiras como en casa, llegando a la cocina Asturiana, probando platos como el pulpo a la brasa, la fabada, la picana o las riquisimas torrijas, que nunca dejan insatisfechas a nadie.', 'C/Castilla, 22', 'gascona.jpg', 37.38708190362676, -6.004839875860307, 'Gascona', 'e31194db-3c18-47a5-bfdb-172ceebf7660', '99a28316-f873-4089-a546-316474d99ff3');
insert into bar (created_at , description , address , image , lat , lng , name , owner_id , id) values ( '2023-05-25', 'Restaurante informal con un exterior de azulejos ornamentado, azotea y un menu tradicional. En el corazon de Triana, teniendo una razonable calidad-precio y una exquisita carta donde ninguno de sus platos te dejara insatisfecho.', 'C/Alfareria, 21', 'montalvan.jpg', 37.385027443731644, -6.005011537241351, 'Alfareria-21 Casa Montalvan', 'e31194db-3c18-47a5-bfdb-172ceebf7660', '52f0e191-0b95-49b0-be02-fbc42f292e77');


insert into bar (created_at , description , address , image , lat , lng , name , owner_id , id) values ( '2023-05-29', 'Restaurante informal con un exterior de azulejos ornamentado, azotea y un menu tradicional. En el corazon de Triana, teniendo una razonable calidad-precio y una exquisita carta donde ninguno de sus platos te dejara insatisfecho.', 'C/Alfareria, 21', 'montalvan.jpg', 37.385027443731644, -6.005011537241351, 'Alfareria-21 Casa Montalvan', 'e31194db-3c18-47a5-bfdb-172ceebf7660', '52f0e191-0b95-49b0-be02-fbc42f292e77');

insert into bar (created_at , description , address , image , lat , lng , name , owner_id , id) values ( '2023-06-13', 'Restaurante informal con un exterior de azulejos ornamentado, azotea y un menu tradicional. En el corazon de Triana, teniendo una razonable calidad-precio y una exquisita carta donde ninguno de sus platos te dejara insatisfecho.', 'C/Alfareria, 21', 'montalvan.jpg', 37.385027443731644, -6.005011537241351, 'Alfareria-21 Casa Montalvan', 'e31194db-3c18-47a5-bfdb-172ceebf7660', '52f0e191-0b95-49b0-be02-fbc42f292e77');

