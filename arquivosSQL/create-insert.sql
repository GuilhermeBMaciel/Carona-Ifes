-CREATE TABLE Usuario (
-    login VARCHAR PRIMARY KEY,
-    nome VARCHAR,
-    matricula_ou_siape VARCHAR,
-    telefone VARCHAR,
-    email VARCHAR,
-    modo_motorista BOOLEAN,
-    senha VARCHAR
-);
-
-CREATE TABLE carona (
-    vaga_motorista VARCHAR,
-    vaga_usuario INTEGER,
-    id INTEGER PRIMARY KEY,
-    tempo_ativo TIME,
-    avaliacao VARCHAR,
-    nota_avaliacao INTEGER,
-    FK_local_id INTEGER
-);
-
-CREATE TABLE local (
-    local_de_saida VARCHAR,
-    horario_saida TIME,
-    local_de_retorno VARCHAR,
-    horario_retorno TIME,
-    id INTEGER PRIMARY KEY
-);
-
-CREATE TABLE veiculo (
-    marca VARCHAR,
-    modelo VARCHAR,
-    cor VARCHAR,
-    id INTEGER PRIMARY KEY
-);
-
-CREATE TABLE motorista (
-    cnh VARCHAR,
-    FK_Usuario_login VARCHAR PRIMARY KEY
-);
-
-CREATE TABLE possui (
-    FK_carona_id INTEGER,
-    FK_Usuario_login VARCHAR
-);
-
-CREATE TABLE veiculo_motorista (
-    FK_veiculo_id INTEGER,
-    FK_motorista_FK_Usuario_login VARCHAR
-);
- 
-ALTER TABLE carona ADD CONSTRAINT FK_carona_1
-    FOREIGN KEY (FK_local_id)
-    REFERENCES local (id)
-    ON DELETE CASCADE ON UPDATE CASCADE;
- 
-ALTER TABLE motorista ADD CONSTRAINT FK_motorista_1
-    FOREIGN KEY (FK_Usuario_login)
-    REFERENCES Usuario (login)
-    ON DELETE CASCADE ON UPDATE CASCADE;
- 
-ALTER TABLE possui ADD CONSTRAINT FK_possui_0
-    FOREIGN KEY (FK_carona_id)
-    REFERENCES carona (id)
-    ON DELETE SET NULL ON UPDATE CASCADE;
- 
-ALTER TABLE possui ADD CONSTRAINT FK_possui_1
-    FOREIGN KEY (FK_Usuario_login)
-    REFERENCES Usuario (login)
-    ON DELETE SET NULL ON UPDATE CASCADE;
- 
-ALTER TABLE veiculo_motorista ADD CONSTRAINT FK_veiculo_motorista_0
-    FOREIGN KEY (FK_veiculo_id)
-    REFERENCES veiculo (id)
-    ON DELETE SET NULL ON UPDATE CASCADE;
- 
-ALTER TABLE veiculo_motorista ADD CONSTRAINT FK_veiculo_motorista_1
-    FOREIGN KEY (FK_motorista_FK_Usuario_login)
-    REFERENCES motorista (FK_Usuario_login)
-    ON DELETE SET NULL ON UPDATE CASCADE; 

INSERT INTO usuario (login, nome, matricula_ou_siape, telefone, email, modo_motorista, senha)
VALUES  ('luiz12', 'Luiz Gonçalves', '20181bsi0178', '(27)99626375','luizgoncalves@gmail.com', true, 'password'),
('carlos1', 'Carlos Patricio', '20181bsi0179', '(27)88626375', 'carlospatricio@gmail.com', false, 'password1'),
('pehe', 'Pedro Henrique', '20181bsi0180', '(27)99696375', 'pedrohenrique@gmail.com', false, 'password2'),
('clara2', 'Maria Clara', '20181bsi0181', '(27)89620775', 'mariaclara@gmail.com', false, 'password3'),
('ssa1', 'Sergio Silva', '20181bsi0182', '(27)88329475', 'sergiosilva@gmail.com', false, 'password4'),
('clua', 'Clara Luiza', '20181bsi0183', '(27)94626375', 'claraluiza@gmail.com', false, 'password5'),
('furto', 'Marcela Furtado', '20181bsi0184', '(27)91626375', 'marcelafurtado@gmail.com', true, 'password6'),
('pedro12', 'Pedro Paulo', '20181bsi0185', '(27)94326375', 'pedropaulo@gmail.com', false, 'password7'),
('ciare', 'Luciano Pereira', '20181bsi0186', '(27)99644375', 'lucianopereira@gmail.com', true, 'password8'),
('mmlo', 'Marcelo Silva', '20181bsi0187', '(27)99666675', 'marcelosilva@gmail.com', false, 'password9');

INSERT INTO carona (vaga_motorista, vaga_usuario, tempo_ativo, nota_avaliacao) VALUES 
('luiz12', 4, '00:10', 1),
('1', 3, '00:05', 4),
('1', 3, '00:10', 5),
('1', 1, '00:15', 3);

INSERT INTO local (local_de_saida, horario_saida, local_de_retorno, horario_retorno, id) VALUES 
('em frente tal lugar', '11:00:00', 'perto de tal lugar', '18:00:00', 1),
('ao lado de tal lugar', '11:30:00', 'perto de tal lugar', '20:00:00', 2),
('rua tal', '12:00:00', 'perto de tal lugar', '18:00:00', 3),
('em frente tal escola', '14:00:00', 'porta de tal shopping', '15:00:00', 4);

INSERT INTO veiculo (marca, modelo, cor) VALUES 
('Fiat', 'Palio', 'azul'),
('Fiat', 'Uno', 'preto'),
('Volkswagen', 'Gol', 'branco'),
('Fiat', 'Siena', 'azul'),
('Hyundai', 'HB20', 'vermelho');
