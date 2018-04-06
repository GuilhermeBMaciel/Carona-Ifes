/* Lógico_1: */

CREATE TABLE Usuario (
    login VARCHAR PRIMARY KEY,
    nome VARCHAR,
    matricula_ou_siape VARCHAR,
    telefone VARCHAR,
    email VARCHAR,
    modo_motorista BOOLEAN,
    senha VARCHAR,
    cnh VARCHAR,
    Usuario_TIPO INT
);

CREATE TABLE carona (
    vaga_motorista VARCHAR,
    vaga_usuario INTEGER,
    id INTEGER PRIMARY KEY,
    tempo_ativo INTEGER,
    avaliacao INTEGER,
    nota_avaliacao INTEGER,
    FK_local_id INTEGER
);

CREATE TABLE local (
    local_de_saida VARCHAR,
    horario_saida TIME,
    local_de_retorno VARCHAR,
    horario_retorno VARCHAR,
    id INTEGER PRIMARY KEY
);

CREATE TABLE veiculo (
    marca VARCHAR,
    modelo VARCHAR,
    cor VARCHAR,
    id INTEGER PRIMARY KEY
);

CREATE TABLE possui (
    FK_carona_id INTEGER,
    FK_Usuario_login VARCHAR
);

CREATE TABLE possui (
    FK_veiculo_id INTEGER,
    FK_Usuario_login VARCHAR
);
 
ALTER TABLE carona ADD CONSTRAINT FK_carona_1
    FOREIGN KEY (FK_local_id)
    REFERENCES local (id)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_0
    FOREIGN KEY (FK_carona_id)
    REFERENCES carona (id)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_1
    FOREIGN KEY (FK_Usuario_login)
    REFERENCES Usuario (login)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_0
    FOREIGN KEY (FK_veiculo_id)
    REFERENCES veiculo (id)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_1
    FOREIGN KEY (FK_Usuario_login)
    REFERENCES Usuario (login)
    ON DELETE SET NULL ON UPDATE CASCADE;
