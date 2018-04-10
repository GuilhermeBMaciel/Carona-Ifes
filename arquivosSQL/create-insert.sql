/* Lógico_1: */

CREATE TABLE Usuario (
    login VARCHAR PRIMARY KEY,
    nome VARCHAR,
    matricula_ou_siape VARCHAR,
    telefone VARCHAR,
    email VARCHAR,
    senha VARCHAR
);

CREATE TABLE carona (
    id SERIAL PRIMARY KEY,
    avaliacao VARCHAR,
    nota_avaliacao INTEGER,
    FK_local_id SERIAL
);

CREATE TABLE local (
    local_de_saida VARCHAR,
    horario_saida TIME,
    local_de_retorno VARCHAR,
    horario_retorno TIME,
    id SERIAL PRIMARY KEY
);

CREATE TABLE veiculo (
    marca VARCHAR,
    modelo VARCHAR,
    cor VARCHAR,
    id SERIAL PRIMARY KEY
);

CREATE TABLE motorista (
    cnh VARCHAR,
    FK_Usuario_login VARCHAR PRIMARY KEY
);

CREATE TABLE consulta (
    FK_carona_id SERIAL,
    FK_Usuario_login VARCHAR
);

CREATE TABLE possui (
    FK_veiculo_id SERIAL,
    FK_motorista_FK_Usuario_login VARCHAR
);

CREATE TABLE registra (
    FK_carona_id SERIAL,
    FK_motorista_FK_Usuario_login VARCHAR
);
 
ALTER TABLE carona ADD CONSTRAINT FK_carona_1
    FOREIGN KEY (FK_local_id)
    REFERENCES local (id)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE motorista ADD CONSTRAINT FK_motorista_1
    FOREIGN KEY (FK_Usuario_login)
    REFERENCES Usuario (login)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE consulta ADD CONSTRAINT FK_consulta_0
    FOREIGN KEY (FK_carona_id)
    REFERENCES carona (id)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE consulta ADD CONSTRAINT FK_consulta_1
    FOREIGN KEY (FK_Usuario_login)
    REFERENCES Usuario (login)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_0
    FOREIGN KEY (FK_veiculo_id)
    REFERENCES veiculo (id)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_1
    FOREIGN KEY (FK_motorista_FK_Usuario_login)
    REFERENCES motorista (FK_Usuario_login)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE registra ADD CONSTRAINT FK_registra_0
    FOREIGN KEY (FK_carona_id)
    REFERENCES carona (id)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE registra ADD CONSTRAINT FK_registra_1
    FOREIGN KEY (FK_motorista_FK_Usuario_login)
    REFERENCES motorista (FK_Usuario_login)
    ON DELETE SET NULL ON UPDATE CASCADE;
    
    
    /* Inserts */
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

INSERT INTO motorista (cnh) VALUES
('59089813750', 'luiz12'),
('99174897977', 'carlos1'),
('52878184605', 'clara2');

INSERT INTO carona (avaliacao, nota_avaliacao) VALUES 
('bom motorista', 4),
('pessima carona', 1),
('horrivel', 1),
('nada', 3),
('boa carona', 3),
('muito bom!', 5),
('excelente.', 5),
('nao gostei', 1),
('recomendo', 4),
('gente boa', 4);

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
