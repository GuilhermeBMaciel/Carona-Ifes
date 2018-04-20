/* Creates: */

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
    qtd_vagas INTEGER,
    FK_localizacao_id SERIAL
);

CREATE TABLE localizacao (
    horario_saida TIME,
    horario_chegada TIME,
    id SERIAL PRIMARY KEY,
    FK_cep_cep VARCHAR
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

CREATE TABLE cep (
    cep VARCHAR PRIMARY KEY,
    municipio VARCHAR,
    bairro VARCHAR,
    rua VARCHAR
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
    FOREIGN KEY (FK_localizacao_id)
    REFERENCES localizacao (id)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE localizacao ADD CONSTRAINT FK_localizacao_1
    FOREIGN KEY (FK_cep_cep)
    REFERENCES cep (cep)
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
truncate carona restart identity cascade;
truncate veiculo restart identity cascade;
truncate localizacao restart identity cascade;
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
('calids', 'Carolina Dias', '20181bsi0187', '(27)99666676', 'carolinadias@gmail.com', 'password9');
('lssa', 'Lucas Santana', '20181bsi0188', '(27)99666677', 'lucasantana@gmail.com', 'password10');
('pecalo', 'Pedro Carvalho', '20181bsi0189', '(27)99666678', 'pedrocarvalho@gmail.com', 'password11');
('hecaso', 'Henrique Cardoso', '20181bsi0190', '(27)99666679', 'henriquecardoso@gmail.com', 'password12');
('mago', 'Marcela Gomes', '20181bsi0191', '(27)99666680', 'marcelagomes@gmail.com', 'password13');
('dummo', 'Luiz Dummont', '20181bsi0192', '(27)99666681', 'luizdummont@gmail.com', 'password14');
('valmeida', 'Valdenir Almeida', '20181bsi0193', '(27)99666682', 'valdeniralmeida@gmail.com', 'password15');
('silva31', 'Carol Silva', '20181bsi0194', '(27)99666683', 'carolsilva@gmail.com', 'password16');
('furbi', 'Luiza Furbino', '20181bsi0195', '(27)99666684', 'luizafurbino@gmail.com', 'password17');
('ana3', 'Ana Souza', '20181bsi0196', '(27)99666685', 'anasouza@gmail.com', 'password18');
('berta', 'Roberta Cruz', '20181bsi0197', '(27)99666686', 'robertacruz@gmail.com', 'password19');

INSERT INTO cep (cep_saida, cep_chegada) VALUES
();

INSERT INTO motorista (cnh, fk_usuario_login) VALUES
('59089813750', 'luiz12'),
('99174897977', 'carlos1'),
('52878184605', 'clara2'),
('87346404512', 'berta'),
('87346404512', 'mago'),
('20888971453', 'ana3'),
('19206688249', 'calids'),
('22674071627', 'silva31'),
('16437512555', 'dummo'),
('65988821658', 'furto');

INSERT INTO localizacao (cep_saida, horario_chegada, horario_saida, cep_chegada) VALUES 
();

INSERT INTO carona (avaliacao, nota_avaliacao, qtd_vagas, fk_localizacao_id) VALUES 
('bom motorista', 4, 3, 1),
('pessima carona', 1, 2, 2),
('horrivel', 1, 3, 3),
('nada', 3, 1, 4),
('boa carona', 3, 2, 5),
('muito bom!', 5, 2, 6),
('excelente.', 5, 3, 7),
('nao gostei', 1, 2, 8),
('recomendo', 4, 1, 9),
('gente boa', 4, 1, 10);

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
