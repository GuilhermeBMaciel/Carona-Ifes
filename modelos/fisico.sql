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
