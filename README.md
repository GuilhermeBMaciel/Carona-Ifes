# TRABALHO 01 : Carona IFES
Trabalho desenvolvido durante a disciplina de BD

    O referido projeto poderá ser:
        a) Um novo sistema/projeto 
        b) Uma expansão de sistema/projeto previamente desenvolvido em disciplinas anteriores 
        (ex: Expansão dos módulos do sistema desenvolvidos em BD1 - incremento mínimo de 50% nos 
        requisitos/complexidade)
        c) Nas avaliações parciais do professor, o grupo deverá anotar todas as observaçoes que forem feitas pelo professor 
        e pelo proprio grupo, enviar uma cópia das atividades por e-mail para o grupo e postar imediatamente estas observaçõe
        como tarefas a serem realizadas como tarefas por meio do gerenciador de projetos do git.
        d) Todas as tarefas devem ser realizadas e deve-se atentar para distribuição igualitária de atividades levando-se 
        em consideração o peso destas.
        e) Os tópicos numerados para cada atividade no devem ser removidos do trabalho. Entretanto, os conteúdos de exemplo 
        em cada tópico devem ser substituídos pelo conteúdo do trabalho em desenvolvimento.
        f) sprints de entrega serão quinzenais ou mensais definidos em aula juntamente com o professor
    
    OBS Importantes: 
        a) Os projetos/sistemas propostos serão validados pelo professor e pela turma
        b) Se possível é interessante que os novos sistemas estejam correlacionados com alguma área 
        previamente estudada pelo aluno
        c) Caso dependa de alguma instituição/parceiro externo, a base de dados e informações pertinentes 
        a esta devem ser obtidas no prazo de até 15 dias apos aprovação da proposta do trabalho 
        (caso contrário, nova proposta deverá ser apresentada a turma implicando logicamente em um prazo 
        mais curto para realização das atividades e conclusão do trabalho)
    
DICA: 
    O kickstart normalmente lança inovaçôes em termos de Sofwares e Apps, portanto pode ser interessante 
    olhar os lançamentos recentes para incrementar as possibilidades e aguçar a criatividade, o que pode 
    auxiliar o grupo com novas ideias na solução proposta. Acesse os links abaixo do para explorar sobre apps e softwares no Kickstarter.
    <br>
    https://www.kickstarter.com/discover/categories/technology/software
    <br>
    https://www.kickstarter.com/discover/categories/technology/apps
# Sumário

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
    
    b) Tabela "usuario"; atributo "modo_motorista": O atributo "modo_motorista" na tabela usuario representa o modo como o usuário do 
    sistema o está acessando, mostrando informações que sejam relevantes para o seu modo de utilização, sendo estes modos motorista ou 
    usuario para caronas. <br>
    
    c) Tabela "motorista": a tabela motorista foi incluida no modelo devido a presença do "cnh" em alguns usuários. Os usuários
    "motoristas" possuem todos os atributos dos "usuarios" regulares, com o acrescimo do "cnh".<br>
    
    d) Tabela "carona"; atributo "avaliacao": serve para armazenar a avalição por escrita feita pelos usuários para um determinado
    motorista, servindo como um historico para este motorista, e possíveis futuras consultas por outros usuários.
   

#### 5.4 DESCRIÇÃO DOS DADOS 

*__USUARIO__*: Tabela que contém os dados do usuário <br>
- *id*: campo que armazena o id do usuario <br>
- *login*: campo que armazena o login do usuario <br>
- *nome*: campo que armazena o nome do usuario <br>
- *telefone*: campo que armazena o telefone do usuario <br>
- *email*: campo que armazena o email do usuario <br>
- *matricula_ou_siape*: campo para armazenamento da matricula ou do siape. <br>
- *senha*: campo que armazena a senha do usuario <br>
- *modo_motorista*: armazena um boolean, para saber se o usuário está no modo motorista ou não <br><br>
*__MOTORISTA__*: Tabela que herda de usuario, e contém o cnh do motorista <br>
- *cnh*: armazenará o número de cnh do motorista <br><br>
*__CARONA__*: Tabela que contém os dados do itinerário <br>
- *id*: campo que armazena o número para identificação do itinerário <br>
- *vaga_motorista*: campo que armazena o nome do motorista de determinada carona <br>
- *vaga_usuario*: campo que armazena a quantidade de vagas disponíveis para este itinerário <br>
- *avaliacao*: campo que armazena a avaliação por extenso da carona realizada <br>
- *nota_avaliacao*: campo que armazena a nota de 1 a 5 da avaliação do motorista <br>
- *tempo_ativo*: campo que armazena o tempo para que o itinerário permaneça ativo <br><br>
*__LOCAL__*: Tabela que contém os dados de localização das caronas <br>
- *id*: campo que armazena o id da localização <br>
- *local_de_saida*: campo que armazena a posição de saida da carona <br>
- *horario_retorno*: campo que armazena a hora de retorno <br>
- *horario_saida*: campo para o armazenamento da hora de saida  <br>
- *local_de_retorno*: campo que armazena a posição para o retorno da carona <br><br>
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
```

### 8	INSERT APLICADO NAS TABELAS DO BANCO DE DADOS<br>
#### 8.1 DETALHAMENTO DAS INFORMAÇÕES
- [Script SQL](https://github.com/GuilhermeBMaciel/Topicos-Trabalho-BD2/tree/master/arquivosSQL)
```
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
```
        
#### 8.2 INCLUSÃO DO SCRIPT PARA CRIAÇÃO DE TABELAS E INSERÇÃO DOS DADOS (ARQUIVO ÚNICO COM):
- [Script SQL](https://github.com/GuilhermeBMaciel/Topicos-Trabalho-BD2/blob/master/arquivosSQL/create-insert.sql)

### 9	TABELAS E PRINCIPAIS CONSULTAS<br>
#### 9.1	GERACAO DE DADOS (MÍNIMO DE 10 REGISTROS PARA CADA TABELA NO BANCO DE DADOS)<br>

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



