# TRABALHO 01 : Carona IFES
Trabalho desenvolvido durante a disciplina de BD

### 1	COMPONENTES<br>
Guilherme Maciel<br>
Jadson Pereira<br>
João Pedro Viera<br>

### 2	INTRODUÇÃO E MOTIVAÇAO<br>
O sistema tem como objetivo estimular a prática de caronas entre as pessoas que frequentam diariamente o IFES Campus Serra, de forma inteligente e segura. Para isso, é necessário criar uma base de dados com informações dos usuários do sistema e com o itinerário dos usuários, e conectar essas pessoas de forma eficiente. <br>
      
### 3	MINI-MUNDO<br>

No cenário atual do IFES Campus Serra, onde o número de vagas do estacionamento diminui e o número de pessoas circulando pelo campus só aumenta, é observado que muitas pessoas que utilizam carro para ir ao campus estão em sua maioria sozinhas, gerando assim um aproveitamento muito pequeno do potencial de transporte do veículo e um maior número de veículos circulando, o que contribui com os congestionamentos.

A proposta do sistema é unir a pessoa que utiliza o carro como seu meio de transporte para o campus e as pessoas que utilizam de algum outro meio. O motorista do carro define seu itinerário diário, contendo rotas, horários e a quantidade de lugares disponíveis, e esse itinerário fica exposto para os outros usuários do sistema. O usuário que deseja usufruir de uma carona, verifica entre todos os itinerários expostos o que mais lhe agrada e se registra nesse carro. O itinerário fica exposto até um horário limite, assim que esse horário é atingido, o sistema notifica o motorista os locais e as pessoas que ele deve parar para dar a carona. Não pode alocar mais usuários dentro do carro do que o limite definido. <br>

### 4	RASCUNHOS BÁSICOS DA INTERFACE (MOCKUPS)<br>

- [Mockups](https://github.com/GuilhermeBMaciel/Topicos-Trabalho-BD2/blob/master/mockups/Caronaifes.pdf)


### 5	MODELO CONCEITUAL<br>
#### 5.1 NOTACAO ENTIDADE RELACIONAMENTO
![Alt text](https://github.com/GuilhermeBMaciel/Topicos-Trabalho-BD2/blob/master/modelos/conceitual.PNG)
    
#### 5.3 DECISÕES DE PROJETO
    
    a) Tabela "local": foi criada uma tabela local a parte de "carona", para que possa ser reaproveitada em mais de um itinerário,
    casa haja, tendo em vista que mais uma pessoa pode acabar registrando uma carona com o mesmo destino e local de saida. <br>
      
    b) Tabela "motorista": a tabela motorista foi incluida no modelo devido a presença do "cnh" em alguns usuários. Os usuários
    "motoristas" possuem todos os atributos dos "usuarios" regulares, com o acrescimo do "cnh".<br>
    
    c) Tabela "carona"; atributo "avaliacao": serve para armazenar a avalição por escrita feita pelos usuários para um determinado
    motorista, servindo como um historico para este motorista, e possíveis futuras consultas por outros usuários.
   

#### 5.4 DESCRIÇÃO DOS DADOS 

*__USUARIO__*: Tabela que contém os dados do usuário <br>
- *login*: campo que armazena o login do usuario <br>
- *nome*: campo que armazena o nome do usuario <br>
- *telefone*: campo que armazena o telefone do usuario <br>
- *email*: campo que armazena o email do usuario <br>
- *matricula_ou_siape*: campo para armazenamento da matricula ou do siape. <br>
- *senha*: campo que armazena a senha do usuario <br><br>
*__MOTORISTA__*: Tabela que herda de usuario, e contém o cnh do motorista <br>
- *cnh*: armazenará o número de cnh do motorista <br><br>
*__CARONA__*: Tabela que contém os dados do itinerário <br>
- *id*: campo que armazena o número para identificação do itinerário <br>
- *avaliacao*: campo que armazena a avaliação por extenso da carona realizada <br>
- *nota_avaliacao*: campo que armazena a nota de 1 a 5 da avaliação do motorista <br>
- *qtd_vagas*: número inteiro que armazenara a quantidade de vagsa para determinada carona <br>
- *tempo_ativo*: campo que armazena o tempo para que o carona permaneça ativo <br><br>
*__LOCALIZACAO__*: Tabela que contém os dados de localização das caronas <br>
- *id*: campo que armazena o id da localização <br>
- *horario_chegada*: campo que armazena a hora de retorno <br>
- *horario_saida*: campo para o armazenamento da hora de saida  <br><br>
*__CEP__*: Tabela que contém os dados referentes aos ceps <br>
- *cep_saida*: campo que armazena o numero do cep referente a localização de onde a carona sairá, ou seja, terá inicio <br>
- *cep_chegada*: campo que armazeno o numero do cep referente a localização de onde a carona chegará, ou seja, terá fim <br><br>
*__VEICULO__*: Tabela que contém os dados dos veículos dos motoristas <br>
- *marca*: campo que armazena a marca do veículo <br>
- *id*: campo que armazena o id do veículo. <br>
- *modelo*: campo que armazena o nome do modelo do veículo <br> 
- *cor*: campo que armazena a cor do veículo. <br><br>


### 6	MODELO LÓGICO<br>
![Alt text](https://github.com/GuilhermeBMaciel/Topicos-Trabalho-BD2/blob/master/modelos/logico.PNG)
### 7	MODELO FÍSICO<br>
- [Modelo físico](https://github.com/GuilhermeBMaciel/Topicos-Trabalho-BD2/blob/master/modelos/fisico.sql)
<br>

```
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
```

### 8	INSERT APLICADO NAS TABELAS DO BANCO DE DADOS<br>
#### 8.1 DETALHAMENTO DAS INFORMAÇÕES
- [Script SQL](https://github.com/GuilhermeBMaciel/Topicos-Trabalho-BD2/tree/master/arquivosSQL)
```
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

INSERT INTO cep (cep_saida, cep_chegada) VALUES
('29173-087','29016-020'),
('29173-087','29090-560'),
('29173-087','29060-060'),
('29173-087','29175-789');

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

INSERT INTO localizacao (fk_cep_cep_saida, horario_chegada, horario_saida, fk_cep_cep_chegada) VALUES 
('29173-087','14:30','13:00','29016-020'),
('29173-087','17:00','16:30','29175-789'),
('29173-087','15:00','14:00','29090-560'),
('29173-087','18:00','17:30','29060-060'),
('29173-087','15:00','13:00','29016-020'),
('29173-087','18:00','17:00','29175-789'),
('29173-087','11:00','10:00','29090-560'),
('29173-087','9:00','10:30','29060-060'),
('29173-087','9:00','8:00','29090-560'),
('29173-087','8:30','7:00','29060-060');

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
```
        
#### 8.2 INCLUSÃO DO SCRIPT PARA CRIAÇÃO DE TABELAS E INSERÇÃO DOS DADOS (ARQUIVO ÚNICO COM):
- [Script SQL](https://github.com/GuilhermeBMaciel/Topicos-Trabalho-BD2/blob/master/arquivosSQL/create-insert.sql)

### 9	TABELAS E PRINCIPAIS CONSULTAS<br>
#### 9.1	GERACAO DE DADOS (MÍNIMO DE 10 REGISTROS PARA CADA TABELA NO BANCO DE DADOS)<br>
```
    select * from usuario;
```
![Alt text](https://github.com/GuilhermeBMaciel/Topicos-Trabalho-BD2/blob/master/prints/select_usuario.PNG)

```
    select * from motorista;
```
![Alt text](https://github.com/GuilhermeBMaciel/Topicos-Trabalho-BD2/blob/master/prints/select_motorista.PNG)

```
    select * from veiculo;
```
![Alt text](https://github.com/GuilhermeBMaciel/Topicos-Trabalho-BD2/blob/master/prints/select_veiculo.PNG)

```
    select * from localizacao;
```
![Alt text](https://github.com/GuilhermeBMaciel/Topicos-Trabalho-BD2/blob/master/prints/select_localizacao.PNG)

```
    select * from carona;
```
![Alt text](https://github.com/GuilhermeBMaciel/Topicos-Trabalho-BD2/blob/master/prints/select_carona.PNG)
```
    select * from cep;
```
![Alt text](https://github.com/GuilhermeBMaciel/Topicos-Trabalho-BD2/blob/master/prints/select_cep.PNG)

## Data de Entrega: (18/09/2017)

<br>
OBS: Incluir para os tópicos 9.2 e 9.3 as instruções SQL + imagens (print da tela) mostrando os resultados.<br>

#### 9.2	SELECT DAS TABELAS COM PRIMEIROS 10 REGISTROS INSERIDOS <br> 
    Data de Entrega: (Data a ser definida)
<br>

#### 9.3	SELECT DAS VISÕES COM PRIMEIROS 10 REGISTROS DA VIEW <br>
        a) Descrição da view sobre que grupos de usuários (operacional/estratégico) <br>
        e necessidade ela contempla.
        b) Descrição das permissões de acesso e usuários correlacionados (após definição <br>
        destas características)
    Data de Entrega: (Data a ser definida)
        c) as funcionalidades informadas no minimundo ou nos mockups(protótipos), que representarem 
        views do sistema (relatórios, informações disponíveis para os usuários, etc) devem estar 
        presentes aqui. 
<br>

#### 9.4	LISTA DE CODIGOS DAS FUNÇÕES, ASSERÇOES E TRIGGERS<br>
        Detalhamento sobre funcionalidade de cada código.
        a) Objetivo
        b) Código do objeto (função/trigger/asserção)
        c) exemplo de dados para aplicação
        d) resultados em forma de tabela/imagem
<br>

#### 9.5	Administração do banco de dados<br>
        Descrição detalhada sobre como serão executadas no banco de dados as <br>
        seguintes atividades.
        a) Segurança e autorização de acesso:
        b) Estimativas de aquisição de recursos para armazenamento e processamento da informação
        c) Planejamento de rotinas de manutenção e monitoramento do banco
        d) Plano com frequencia de análises visando otimização de performance
<br>

#### 9.6	GERACAO DE DADOS (MÍNIMO DE 1,5 MILHÃO DE REGISTROS PARA PRINCIPAL RELAÇAO)<br>
        a) principal tabela do sistema deve ter no mínimo 1,5 milhão de registros
        b) tabelas diretamente relacionadas a tabela principal 100 mil registros
        c) tabelas auxiliares de relacao multivalorada mínimo de 10 registros
        d) registrar o tempo de inserção em cada uma das tabelas do banco de dados
        e) especificar a quantidade de registros inseridos em cada tabela
        Para melhor compreensão verifiquem o exemplo na base de testes:<br>
        https://github.com/discipbd2/base-de-testes-locadora
        


#### 9.7	Backup do Banco de Dados<br>
        Detalhamento do backup.
        a) Tempo
        b) Tamanho
        c) Teste de restauração (backup)
        d) Tempo para restauração
        e) Teste de restauração (script sql)
        f) Tempo para restauração (script sql)
<br>

Data de Entrega: (Data a ser definida)
<br>

#### 9.8	APLICAÇAO DE ÍNDICES E TESTES DE PERFORMANCE<br>
    a) Lista de índices, tipos de índices com explicação de porque foram implementados nas consultas 
    b) Performance esperada VS Resultados obtidos
    c) Tabela de resultados comparando velocidades antes e depois da aplicação dos índices (constando velocidade esperada com planejamento, sem indice e com índice Vs velocidade de execucao real com índice e sem índice).
    d) Escolher as consultas mais complexas para serem analisadas (consultas com menos de 2 joins não serão aceitas)
    e) As imagens do Explain devem ser inclusas no trabalho, bem como explicações sobre os resultados obtidos.
    f) Inclusão de tabela mostrando as 10 execuções, excluindo-se o maior e menor tempos para cada consulta e 
    obtendo-se a media dos outros valores como resultado médio final.
<br>
    Data de Entrega: (Data a ser definida)
<br>   

#### 9.9	ANÁLISE DOS DADOS COM ORANGE<br>    
        a) captura das informaçõs
        b) integração com banco de dados em desenvolvimento
        c) aplicação de algoritmos e interpretação dos resultados
        c) atualização da documentação do trabalho incluindo a mineração de dados
<br>
    Data de Entrega: (Data a ser definida)
<br>

### 10	ATUALIZAÇÃO DA DOCUMENTAÇÃO/ SLIDES E ENTREGA FINAL<br>
<br>
    Data de Entrega: (Data a ser definida)
<br>

### 11	DIFICULDADES ENCONTRADAS PELO GRUPO<br>  

       
### 12  FORMATACAO NO GIT: https://help.github.com/articles/basic-writing-and-formatting-syntax/
<comentario no git>
    
##### About Formatting
    https://help.github.com/articles/about-writing-and-formatting-on-github/
    
##### Basic Formatting in Git
    
    https://help.github.com/articles/basic-writing-and-formatting-syntax/#referencing-issues-and-pull-requests
    
    
##### Working with advanced formatting
    https://help.github.com/articles/working-with-advanced-formatting/
#### Mastering Markdown
    https://guides.github.com/features/mastering-markdown/

### OBSERVAÇÕES IMPORTANTES

#### Todos os arquivos que fazem parte do projeto (Imagens, pdfs, arquivos fonte, etc..), devem estar presentes no GIT. Os arquivos do projeto vigente não devem ser armazenados em quaisquer outras plataformas.
1. Caso existam arquivos com conteúdos sigilosos, comunicar o professor que definirá em conjunto com o grupo a melhor forma de armazenamento do arquivo.

#### Todos os grupos deverão fazer Fork deste repositório e dar permissões administrativas ao usuário deste GIT, para acompanhamento do trabalho.

#### Os usuários criados no GIT devem possuir o nome de identificação do aluno (não serão aceitos nomes como Eu123, meuprojeto, pro456, etc). Em caso de dúvida comunicar o professor.


Link para BrModelo:<br>
http://sis4.com/brModelo/brModelo/download.html
<br>


Link para curso de GIT<br>
![https://www.youtube.com/curso_git](https://www.youtube.com/playlist?list=PLo7sFyCeiGUdIyEmHdfbuD2eR4XPDqnN2?raw=true "Title")



