/* Lógico_1: */

CREATE TABLE Usuario (
    login VARCHAR PRIMARY KEY,
    nome VARCHAR,
    matricula_ou_siape VARCHAR,
    telefone VARCHAR,
    email VARCHAR,
    modo_motorista BOOLEAN,
    senha VARCHAR,
    cnh VARCHAR
);

CREATE TABLE Itinerario (
    vaga_usuario INTEGER,
    id INTEGER PRIMARY KEY,
    tempo_ativo TIME,
    FK_local_id VARCHAR
);

CREATE TABLE local (
    local_de_saida VARCHAR,
    horario_saida TIME,
    local_de_retorno VARCHAR,
    horario_retorno TIME,
    id VARCHAR PRIMARY KEY
);

CREATE TABLE veiculo (
    marca VARCHAR,
    modelo VARCHAR,
    cor VARCHAR,
    id INTEGER PRIMARY KEY
);

CREATE TABLE historico (
    nota INTEGER,
    descricao VARCHAR,
    id INTEGER PRIMARY KEY,
    nome_usuario VARCHAR
);

CREATE TABLE Registra (
    FK_Itinerario_id INTEGER,
    FK_Usuario_login VARCHAR
);

CREATE TABLE Busca (
    FK_Itinerario_id INTEGER,
    FK_Usuario_login VARCHAR
);

CREATE TABLE possui_veiculo_Usuario_historico (
    FK_veiculo_id INTEGER,
    FK_Usuario_login VARCHAR,
    FK_historico_id INTEGER
);
 
ALTER TABLE Itinerario ADD CONSTRAINT FK_Itinerario_1
    FOREIGN KEY (FK_local_id)
    REFERENCES local (id)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Registra ADD CONSTRAINT FK_Registra_0
    FOREIGN KEY (FK_Itinerario_id)
    REFERENCES Itinerario (id)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE Registra ADD CONSTRAINT FK_Registra_1
    FOREIGN KEY (FK_Usuario_login)
    REFERENCES Usuario (login)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE Busca ADD CONSTRAINT FK_Busca_0
    FOREIGN KEY (FK_Itinerario_id)
    REFERENCES Itinerario (id)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE Busca ADD CONSTRAINT FK_Busca_1
    FOREIGN KEY (FK_Usuario_login)
    REFERENCES Usuario (login)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE possui_veiculo_Usuario_historico ADD CONSTRAINT FK_possui_veiculo_Usuario_historico_0
    FOREIGN KEY (FK_veiculo_id)
    REFERENCES veiculo (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION;
 
ALTER TABLE possui_veiculo_Usuario_historico ADD CONSTRAINT FK_possui_veiculo_Usuario_historico_1
    FOREIGN KEY (FK_Usuario_login)
    REFERENCES Usuario (login)
    ON DELETE NO ACTION ON UPDATE NO ACTION;
 
ALTER TABLE possui_veiculo_Usuario_historico ADD CONSTRAINT FK_possui_veiculo_Usuario_historico_2
    FOREIGN KEY (FK_historico_id)
    REFERENCES historico (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION;
