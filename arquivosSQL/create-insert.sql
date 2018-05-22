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
    id_carona Serial PRIMARY KEY,
    avaliacao VARCHAR,
    nota_avaliacao INTEGER,
    qtd_vagas INTEGER,
    FK_localizacao_id_localizacao Serial,
    FK_motorista_FK_Usuario_login VARCHAR
);

CREATE TABLE localizacao (
    horario_saida VARCHAR,
    horario_chegada VARCHAR,
    id_localizacao Serial PRIMARY KEY,
    FK_cep_cep VARCHAR,
    FK_cep_cep_ VARCHAR
);

CREATE TABLE veiculo (
    marca VARCHAR,
    modelo VARCHAR,
    cor VARCHAR,
    id_veiculo Serial PRIMARY KEY
);

CREATE TABLE motorista (
    cnh VARCHAR,
    FK_Usuario_login VARCHAR PRIMARY KEY
);

CREATE TABLE cep (
    municipio VARCHAR,
    bairro VARCHAR,
    rua VARCHAR,
    cep VARCHAR PRIMARY KEY
);

CREATE TABLE consulta (
    FK_carona_id_carona Serial,
    FK_Usuario_login VARCHAR
);

CREATE TABLE tem (
    FK_veiculo_id_veiculo Serial,
    FK_motorista_FK_Usuario_login VARCHAR
);
 
ALTER TABLE carona ADD CONSTRAINT FK_carona_1
    FOREIGN KEY (FK_localizacao_id_localizacao)
    REFERENCES localizacao (id_localizacao)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE carona ADD CONSTRAINT FK_carona_2
    FOREIGN KEY (FK_motorista_FK_Usuario_login)
    REFERENCES motorista (FK_Usuario_login)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE localizacao ADD CONSTRAINT FK_localizacao_1
    FOREIGN KEY (FK_cep_cep)
    REFERENCES cep (cep)
    ON DELETE CASCADE ON UPDATE CASCADE;
    
ALTER TABLE localizacao ADD CONSTRAINT FK_localizacao_2
    FOREIGN KEY (FK_cep_cep_)
    REFERENCES cep (cep)
    ON DELETE CASCADE ON UPDATE CASCADE;
    
 
ALTER TABLE motorista ADD CONSTRAINT FK_motorista_1
    FOREIGN KEY (FK_Usuario_login)
    REFERENCES Usuario (login)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE consulta ADD CONSTRAINT FK_consulta_0
    FOREIGN KEY (FK_carona_id_carona)
    REFERENCES carona (id_carona)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE consulta ADD CONSTRAINT FK_consulta_1
    FOREIGN KEY (FK_Usuario_login)
    REFERENCES Usuario (login)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_0
    FOREIGN KEY (FK_veiculo_id_veiculo)
    REFERENCES veiculo (id_veiculo)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_1
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
('calids', 'Carolina Dias', '20181bsi0187', '(27)99666676', 'carolinadias@gmail.com', 'password9'),
('lssa', 'Lucas Santana', '20181bsi0188', '(27)99666677', 'lucasantana@gmail.com', 'password10'),
('pecalo', 'Pedro Carvalho', '20181bsi0189', '(27)99666678', 'pedrocarvalho@gmail.com', 'password11'),
('hecaso', 'Henrique Cardoso', '20181bsi0190', '(27)99666679', 'henriquecardoso@gmail.com', 'password12'),
('mago', 'Marcela Gomes', '20181bsi0191', '(27)99666680', 'marcelagomes@gmail.com', 'password13'),
('dummo', 'Luiz Dummont', '20181bsi0192', '(27)99666681', 'luizdummont@gmail.com', 'password14'),
('valmeida', 'Valdenir Almeida', '20181bsi0193', '(27)99666682', 'valdeniralmeida@gmail.com', 'password15'),
('silva31', 'Carol Silva', '20181bsi0194', '(27)99666683', 'carolsilva@gmail.com', 'password16'),
('furbi', 'Luiza Furbino', '20181bsi0195', '(27)99666684', 'luizafurbino@gmail.com', 'password17'),
('ana3', 'Ana Souza', '20181bsi0196', '(27)99666685', 'anasouza@gmail.com', 'password18'),
('berta', 'Roberta Cruz', '20181bsi0197', '(27)99666686', 'robertacruz@gmail.com', 'password19');

INSERT INTO cep (cep,municipio,bairro,rua) VALUES
('29173-087','Serra','Manguinhos','Rodovia ES-010'),
('29025-220','Vitoria','Vila Rubim','Avenida Duarte Lemos'),
('29070-440','Vitoria','Maria Ortiz','Avenida Professor Fernando Duarte Rabelo'),
('29045-300','Vitoria','Santa Luiza','Rua José Farias'),
('29166-200','Serra','Barcelona','Avenida Região Sudeste'),
('29045-402','Vitoria','Santa Luiza','Avenida Nossa Senhora da Penha'),
('29172-105','Serra','Feu Rosa','Rua dos Cravos'),
('29045-460','Vitoria','Consolação','Avenida Marechal Campos'),
('29122-041','Vilha Velha','Glória','Rua Santa Terezinha'),
('29168-600','Serra','Porto Canoa','Avenida Brasília'),
('29164-050','Serra','Jardim Limoeiro','Avenida Lourival Nunes'),
('29055-260','Vitoria','Praia do canto','Rua Aleixo Netto'),
('29060-500','Vitoria','Jardim da penha','Rua Darcy Grijó'),
('29043-405','Vitória','Tabuazeiro','Avenida Coronel José Martins de Figueiredo'),
('29172-015','Serra','Feu Rosa','Rua das Avencas'),
('29171-237','Serra','Serra Dourada II','Avenida Brasília'),
('29122-030','Vila Velha','Glória','Avenida Getúlio Vargas'),
('29106-595','Vila Velha','Cristovão Colombo','Rua Cristovão Colombo'),
('29152-427','Cariacica','Tucum','Rua Anselmo Lage'),
('29150-340','Cariacica','Itacibá','Rua Anselmo Modenesi');

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

INSERT INTO localizacao (horario_saida, horario_chegada, fk_cep_cep, fk_cep_cep_) VALUES
('13:00','14:00', '29025-220', '29173-087'),
('7:30','13:00', '29070-440', '29173-087'),
('08:00','14:00', '29173-087', '29045-300'),
('14:00','16:00', '29173-087', '29166-200'),
('13:15','19:00', '29173-087', '29045-402'),
('13:20','20:00', '29173-087', '29172-105'),
('08:00','22:00', '29173-087', '29045-460'),
('09:00','12:00', '29122-041', '29173-087'),
('10:20','13:00', '29173-087', '29168-600'),
('12:00','19:00', '29173-087', '29164-050');

INSERT INTO carona (avaliacao, nota_avaliacao, qtd_vagas, fk_localizacao_id_localizacao) VALUES 
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
