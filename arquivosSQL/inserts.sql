INSERT INTO carona (vaga_motorista, vaga_usuario, id, tempo_ativo, nota_avaliacao, fk_local_id) VALUES 
('luiz12', 4, 1, '00:10', 1, 1),
('1', 3, 2, '00:05', 4, 2),
('1', 3, 3, '00:10', 5, 3),
('1', 1, 4, '00:15', 3, 4);

INSERT INTO possui (fk_carona_id, fk_usuario_login) VALUES 
(1, 'luiz12'),
(2, 'carlos1'),
(3, 'pehe'),
(4, 'ssa1');

INSERT INTO local (local_de_saida, horario_saida, local_de_retorno, horario_retorno, id) VALUES 
('em frente tal lugar', '11:00:00', 'perto de tal lugar', '18:00:00', 1),
('ao lado de tal lugar', '11:30:00', 'perto de tal lugar', '20:00:00', 2),
('rua tal', '12:00:00', 'perto de tal lugar', '18:00:00', 3),
('em frente tal escola', '14:00:00', 'porta de tal shopping', '15:00:00', 4);

INSERT INTO veiculo_motorista (fk_veiculo_id, fk_motorista_fk_usuario_login) 
VALUES (1, 'luiz12');

INSERT INTO motorista (cnh, fk_usuario_login) 
VALUES ('69937477734', 'luiz12');

INSERT INTO veiculo (marca, modelo, cor, id) VALUES 
('Fiat', 'Palio', 'azul', 1),
('Fiat', 'Uno', 'preto', 2),
('Volkswagen', 'Gol', 'branco', 3),
('Fiat', 'Siena', 'azul', 4),
('Hyundai', 'HB20', 'vermelho', 5);

INSERT INTO usuario (login, nome, matricula_ou_siape, telefone, email, modo_motorista, senha)
VALUES  ('luiz12', 'Luiz Gonçalves', '20181bsi0178', '(27)99626375','luizgoncalves@gmail.com', true, 'password');

INSERT INTO usuario (login, nome, matricula_ou_siape, telefone, email, modo_motorista, senha)
VALUES ('carlos1', 'Carlos Patricio', '20181bsi0179', '(27)88626375', 'carlospatricio@gmail.com', false, 'password1');

INSERT INTO usuario (login, nome, matricula_ou_siape, telefone, email, modo_motorista, senha)
VALUES ('pehe', 'Pedro Henrique', '20181bsi0180', '(27)99696375', 'pedrohenrique@gmail.com', false, 'password2');

INSERT INTO usuario (login, nome, matricula_ou_siape, telefone, email, modo_motorista, senha)
VALUES ('clara2', 'Maria Clara', '20181bsi0181', '(27)89620775', 'mariaclara@gmail.com', false, 'password3');

INSERT INTO usuario (login, nome, matricula_ou_siape, telefone, email, modo_motorista, senha)
VALUES ('ssa1', 'Sergio Silva', '20181bsi0182', '(27)88329475', 'sergiosilva@gmail.com', false, 'password4');

INSERT INTO usuario (login, nome, matricula_ou_siape, telefone, email, modo_motorista, senha)
VALUES ('clua', 'Clara Luiza', '20181bsi0183', '(27)94626375', 'claraluiza@gmail.com', false, 'password5');

INSERT INTO usuario (login, nome, matricula_ou_siape, telefone, email, modo_motorista, senha)
VALUES ('furto', 'Marcela Furtado', '20181bsi0184', '(27)91626375', 'marcelafurtado@gmail.com', true, 'password6');

INSERT INTO usuario (login, nome, matricula_ou_siape, telefone, email, modo_motorista, senha)
VALUES ('pedro12', 'Pedro Paulo', '20181bsi0185', '(27)94326375', 'pedropaulo@gmail.com', false, 'password7');

INSERT INTO usuario (login, nome, matricula_ou_siape, telefone, email, modo_motorista, senha)
VALUES('ciare', 'Luciano Pereira', '20181bsi0186', '(27)99644375', 'lucianopereira@gmail.com', true, 'password8');

INSERT INTO usuario (login, nome, matricula_ou_siape, telefone, email, modo_motorista, senha)
VALUES('mmlo', 'Marcelo Silva', '20181bsi0187', '(27)99666675', 'marcelosilva@gmail.com', false, 'password9');

