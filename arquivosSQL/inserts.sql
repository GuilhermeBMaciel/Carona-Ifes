INSERT INTO usuario (login, nome, matricula_ou_siape, telefone, email, senha)
VALUES  ('luiz12', 'Luiz Gonçalves', '20181bsi0178', '(27)99626375','luizgoncalves@gmail.com', 'password'),
('carlos1', 'Carlos Patricio', '20181bsi0179', '(27)88626375', 'carlospatricio@gmail.com', 'password1'),
('pehe', 'Pedro Henrique', '20181bsi0180', '(27)99696375', 'pedrohenrique@gmail.com', 'password2'),
('clara2', 'Maria Clara', '20181bsi0181', '(27)89620775', 'mariaclara@gmail.com', 'password3'),
('ssa1', 'Sergio Silva', '20181bsi0182', '(27)88329475', 'sergiosilva@gmail.com', 'password4'),
('clua', 'Clara Luiza', '20181bsi0183', '(27)94626375', 'claraluiza@gmail.com', 'password5'),
('furto', 'Marcela Furtado', '20181bsi0184', '(27)91626375', 'marcelafurtado@gmail.com', 'password6'),
('pedro12', 'Pedro Paulo', '20181bsi0185', '(27)94326375', 'pedropaulo@gmail.com', 'password7'),
('ciare', 'Luciano Pereira', '20181bsi0186', '(27)99644375', 'lucianopereira@gmail.com', 'password8'),
('mmlo', 'Marcelo Silva', '20181bsi0187', '(27)99666675', 'marcelosilva@gmail.com', 'password9');

INSERT INTO motorista (cnh, fk_usuario_login) VALUES
('59089813750', 'luiz12'),
('99174897977', 'carlos1'),
('52878184605', 'clara2');

INSERT INTO local (local_de_saida, horario_saida, local_de_retorno, horario_retorno) VALUES 
('em frente ao ifes-serra', '11:00:00', 'perto de tal lugar', '18:00:00'),
('em frente ao ifes-serra', '11:30:00', 'perto de tal lugar', '20:00:00'),
('rua treze', '12:00:00', 'rua doze', '18:00:00'),
('avenida brasil', '13:00:00', 'perto de tal lugar', '18:00:00'),
('avenida dois', '14:00:00', 'perto de tal lugar', '19:00:00'),
('em frente ao ifes-serra', '15:00:00', 'perto de tal lugar', '20:00:00'),
('vila velha', '16:00:00', 'ifes-serra', '23:00:00'),
('ifes', '17:00:00', 'perto de tal lugar', '21:00:00'),
('ifes-serra', '17:30:00', 'perto de tal lugar', '22:00:00'),
('em frente tal escola', '14:00:00', 'porta de tal shopping', '15:00:00');

INSERT INTO carona (avaliacao, nota_avaliacao, fk_local_id) VALUES 
('bom motorista', 4, 41),
('pessima carona', 1, 42),
('horrivel', 1, 43),
('nada', 3, 44),
('boa carona', 3, 45),
('muito bom!', 5, 46),
('excelente.', 5, 47),
('nao gostei', 1, 48),
('recomendo', 4, 49),
('gente boa', 4, 50);

select * from local;

INSERT INTO veiculo (marca, modelo, cor) VALUES 
('Fiat', 'Palio', 'azul'),
('Fiat', 'Uno', 'preto'),
('Volkswagen', 'Gol', 'branco'),
('Fiat', 'Siena', 'azul'),
('Fiat', 'Palio', 'preto'),
('Toyota', 'Corolla', 'branco'),
('Honda', 'Civic', 'preto'),
('Fiat', 'Punto', 'azul'),
('Fit', 'Honda', 'cinza'),
('Hyundai', 'HB20', 'vermelho');
