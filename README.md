# TRABALHO 01 : Carona IFES
Trabalho desenvolvido durante a disciplina de BD

### 1	COMPONENTES<br>
Guilherme Maciel<br>
Jadson Pereira<br>
João Pedro Viera<br>

### 2	INTRODUÇÃO E MOTIVAÇAO<br>
O sistema tem como objetivo estimular a prática de caronas entre as pessoas que frequentam diariamente o IFES Campus Serra, de forma inteligente e segura. Para isso, é necessário criar uma base de dados com informações dos usuários do sistema e com o itinerário dos usuários, e conectar essas pessoas de forma eficiente. <br>
      
### 3	MINI-MUNDO<br>
No cenário atual do IFES Campus Serra, onde o número de pessoas circulando pelo campus aumenta a cada ano, observa-se que uma quantidade extensa de pessoas utilizam carro para chegar ao campus, e que em sua maioria, fazem o percurso até o IFES, sozinhas. Como consequência deste fato, existe uma grande circulação de carros, que não aproveitam em grande parte, de todo o seu potencial de carregar a maior quantidade de pessoas possíveis. Um maior número de veículos circulando, contribui com o congestionamentos e maiores impactos ambientais. Além disso, existe mais uma questão, as caronas nesse ambiente podem unir mais pessoas, o que é essencial para uma sociedade e fundamental em uma instituição de ensino. 

A proposta do sistema é unir a pessoa que utiliza o carro como seu meio de transporte para o campus e as pessoas que utilizam de algum outro meio. O usuário do sistema que deseja ser um motorista, deve realizar o cadastro do seu cnh no sistema. Após a conclusão deste cadastro, será possível para este usuário, cadastrar um veículo, e só então a criação de uma carona no sistema, definindo o dia, a hora e quantidade de vagas disponíveis. Estas caronas criadas por usuários motoristas, estarão disponíveis para todos os usuários do sistema, em uma tela da aplicação, que exibirá uma lista das próximas caronas do dia, com os horários, o motorista e o seu perfil (contendo suas avaliações de caronas passadas) e a quantidade de vagas disponíveis. O usuário que deseja usufruir desta carona, deve preencher a carona desejada, clicando em em cima da carona, e confirmando o desejo de se cadastrar a essa carona. Caso a quantidade de vagas disponíveis chegue a zero, a carona desaparecerá dessa lista. A cada usuário que cadastrar em uma determinada carona, será notificado ao motorista o usuário em questão, e assim que for atingir a capacidade máxima de “caroneiros” ou assim que a hora da realização da carona estiver chegando, todos os usuários que estiverem relacionados a esta carona, serão notificados pelo sistema. Após o término da carona, os usuários passageiros, poderão realizar uma avaliação sobre o motorista desta carona, informando um número de um a cinco, e uma avaliação por escrita que serão acopladas ao perfil do motorista
 <br>

### 4	RASCUNHOS BÁSICOS DA INTERFACE (MOCKUPS)<br>

- [Mockups](https://github.com/GuilhermeBMaciel/Topicos-Trabalho-BD2/blob/master/mockups/Caronaifes.pdf)


### 5	MODELO CONCEITUAL<br>
#### 5.1 NOTACAO ENTIDADE RELACIONAMENTO
![Alt text](https://github.com/GuilhermeBMaciel/Topicos-Trabalho-BD2/blob/master/modelos/Conceitual_1.PNG)
    
#### 5.3 DECISÕES DE PROJETO
    
    a) Tabela "localizacao": foi criada uma tabela local a parte de "carona", para que possa ser reaproveitada em mais de um itinerário,
    casa haja, tendo em vista que mais uma pessoa pode acabar registrando uma carona com o mesmo destino e local de saida. <br>
      
    b) Tabela "motorista": a tabela motorista foi incluida no modelo devido a presença do "cnh" em alguns usuários. Os usuários
    "motoristas" possuem todos os atributos dos "usuarios" regulares, com o acrescimo do "cnh".<br>
    
    c) Tabela "carona"; atributo "avaliacao": serve para armazenar a avalição por escrita feita pelos usuários para um determinado
    motorista, servindo como um historico para este motorista, e possíveis futuras consultas por outros usuários.
    
    d) Tabela "cep": a tabela cep serve com o propósito de ser a fonte bruta de dados de cep, municipio, bairro e rua dos endereços de
    destino e partida das caronas.
   

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
- *cep*: campo que armazena o numero do cep <br>
- *municipio*: campo que armazenará o nome do municipio de determinado cep <br>
- *bairro*: campo que armazenará o nome do bairro de determinado cep <br>
- *rua*: campo que armazenará o nome da rua de determinado cep <br><br>
*__VEICULO__*: Tabela que contém os dados dos veículos dos motoristas <br>
- *marca*: campo que armazena a marca do veículo <br>
- *id*: campo que armazena o id do veículo. <br>
- *modelo*: campo que armazena o nome do modelo do veículo <br> 
- *cor*: campo que armazena a cor do veículo. <br><br>


### 6	MODELO LÓGICO<br>
![Alt text](https://github.com/GuilhermeBMaciel/Topicos-Trabalho-BD2/blob/master/modelos/Lógico_1.PNG)
### 7	MODELO FÍSICO<br>
- [Modelo físico](https://github.com/GuilhermeBMaciel/Topicos-Trabalho-BD2/blob/master/modelos/fisico.sql)
<br>

```
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

INSERT INTO carona (avaliacao, nota_avaliacao, qtd_vagas, fk_localizacao_id_localizacao, fk_motorista_fk_usuario_login) VALUES 
('bom motorista', 4, 3, 1, 'luiz12'),
('pessima carona', 1, 2, 2, 'furto'),
('horrivel', 1, 3, 3, 'dummo'),
('nada', 3, 1, 4, 'mago'),
('boa carona', 3, 2, 5, 'mago'),
('muito bom!', 5, 2, 6, 'silva31'),
('excelente.', 5, 3, 7, 'berta'),
('nao gostei', 1, 2, 8, 'dummo'),
('recomendo', 4, 1, 9, 'calids'),
('gente boa', 4, 1, 10, 'silva31');

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

INSERT INTO consulta(fk_carona_id_carona, fk_usuario_login) VALUES
(1,'luiz12'),
(3, 'carlos1'),
(4, 'furto'),
(5,'dummo'),
(6, 'furto'),
(7, 'berta'),
(8, 'berta'),
(9, 'clara2'),
(10, 'furto');

INSERT INTO tem(fk_veiculo_id_veiculo, fk_motorista_fk_usuario_login) VALUES
(1,'luiz12'),
(3, 'carlos1'),
(4, 'furto'),
(5,'dummo'),
(6, 'furto'),
(7, 'berta'),
(8, 'berta'),
(9, 'clara2'),
(10, 'furto');
```
        
#### 8.2 INCLUSÃO DO SCRIPT PARA CRIAÇÃO DE TABELAS E INSERÇÃO DOS DADOS (ARQUIVO ÚNICO COM):
- [Script SQL](https://github.com/GuilhermeBMaciel/Topicos-Trabalho-BD2/blob/master/arquivosSQL/create-insert.sql)

### 9	TABELAS E PRINCIPAIS CONSULTAS<br>
#### 9.1	GERACAO DE DADOS (MÍNIMO DE 10 REGISTROS PARA CADA TABELA NO BANCO DE DADOS)<br>

#### 9.2	SELECT DAS TABELAS COM PRIMEIROS 10 REGISTROS INSERIDOS <br> 

<br>
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

```
    select * from possui;
```
![Alt text](https://github.com/GuilhermeBMaciel/Topicos-Trabalho-BD2/blob/master/prints/select_possui.PNG)





#### 9.3	SELECT DAS VISÕES COM PRIMEIROS 10 REGISTROS DA VIEW <br>

```
    Create view destino as
    Select fk_cep_cep_ as Destino ,COUNT(fk_cep_cep_) as Frequencia
    from localizacao
    group by fk_cep_cep_
    order by Frequencia desc;
```
<br> A view destino foi feita para mapeia os destinos mais frequentados pelos usuários, esta informação pode auxiliar os usuários a se organizar melhor, ou até mesmo para se fixar pontos estratégicos/tomadas de decisões a respeito do destino, um exemplo dessas decisões foi a inserção de placas sinalizadoras em lugares estratégicos dentro e fora da faculdade para auxiliar o sucesso do aplicativo ocorrido no rio de janeiro pela ufrj.<br>

![Alt text](https://github.com/GuilhermeBMaciel/Topicos-Trabalho-BD2/blob/master/prints/views_frequenciaDestino.PNG)

<br>
Verifica se há alguma avaliação com ótimo rendimento.
<br>
```
	select exists (select * from carona c where avaliacao = 'otimo')
```
<br>

![Alt text](https://github.com/GuilhermeBMaciel/Carona-Ifes/blob/master/prints/boas_avaliacoes.PNG)

<br>
Verifica se não há avaliação com nota acima da média.
<br>
```
	select not exists (select * from carona c where nota_avaliacao > 6)
```
<br>

![Alt text](https://github.com/GuilhermeBMaciel/Carona-Ifes/blob/master/prints/not_exist.PNG)

<br>




```
        b) Descrição das permissões de acesso e usuários correlacionados (após definição <br>
        destas características)
    Data de Entrega: (Data a ser definida)
        c) as funcionalidades informadas no minimundo ou nos mockups(protótipos), que representarem 
        views do sistema (relatórios, informações disponíveis para os usuários, etc) devem estar 
        presentes aqui. 
```
<br>

#### 9.4	LISTA DE CODIGOS DAS FUNÇÕES, ASSERÇOES E TRIGGERS<br>
       
   Assertion para validar os inserts na tabela usuario, é fudamental que não ocorra a duplicação de logins.<br>    
```  
/* Trigger 1 */
create function existeUsuario()
returns trigger as $$
begin
	if exists(
		Select usuario.login from usuario 
	)
	then raise exception 'Erro! Usuário já existente';
	end if;
end
$$ LANGUAGE plpgsql;

create trigger checkUsuario
before insert
on usuario
for each row
execute procedure existeUsuario();

insert into usuario(login,nome,matricula_ou_siape,telefone,email,senha) 
values ('luiz12','Luiz carlos','23232bsi4444','(27)11111111','joaoao@gmail.com','passw11');     
```
<br> 
<br>

![Alt text](https://github.com/GuilhermeBMaciel/Carona-Ifes/blob/master/prints/trigger_usuarioexiste.PNG)

<br>

Assertion para validar os inserts na tabela motorista para que não ocorra a duplicação de CNHS.
<br>    

```
/* Trigger 2 */
create function existeCnh()
returns trigger as $$
begin
	if exists(
		Select motorista.cnh from motorista 
	)
	then raise exception 'Erro! Cnh já registrado';
	end if;
end
$$ LANGUAGE plpgsql;

create trigger checarMotorista
before insert
on motorista
for each row
execute procedure existeCnh();

INSERT INTO motorista (cnh, fk_usuario_login) VALUES
('59089813750', 'luiz12')

```
<br>

![Alt text](https://github.com/GuilhermeBMaciel/Carona-Ifes/blob/master/prints/verifica_cnh.PNG)

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



