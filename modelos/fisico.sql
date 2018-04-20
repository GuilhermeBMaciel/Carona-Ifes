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
