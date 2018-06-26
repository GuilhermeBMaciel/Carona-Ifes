#Gera fake usuario.
import string
import random
from faker import Factory
import names
fake = Factory.create('pt_BR')

#### Funções para geração de dados.
#Codigo utilizado para gerar os passwords. Não sou o autor.
def password_generator(size=8, chars=string.ascii_letters + string.digits):
    """
    Returns a string of random characters, useful in generating temporary
    passwords for automated password resets.
    
    size: default=8; override to provide smaller/larger passwords
    chars: default=A-Za-z0-9; override to provide more/less diversity
    
    Credit: Ignacio Vasquez-Abrams
    Source: http://stackoverflow.com/a/2257449
    """
    return ''.join(random.choice(chars) for i in range(size))
    
def geraEmail(name,lastname):
	domains = [ "hotmail.com", "gmail.com", "aol.com", "outlook.com" , "uol.com", "yahoo.com"]
	token = ["-",".","_"]
	email = name+token[random.randint(0,len(token)-1)]+lastname+str(random.randint(0,1000000))+"@"+domains[random.randint(0,len(domains)-1)]
	return email	


def fakeLogin(nome):
	return nome+ str(random.randint(0,1000000))
	
def fakeTelefone():
	telefone = "9"+str(random.randint(0,9))+str(random.randint(0,9))+str(random.randint(0,9))+str(random.randint(0,9))+str(random.randint(0,9))+str(random.randint(0,9))+str(random.randint(0,9))+str(random.randint(0,9))
	return telefone
	
def fakeMatricula():
	x = ["bsi","ti","enga","engc","adm"]
	return str(random.randint(1000,9999))+x[random.randint(0,len(x)-1)]+str(random.randint(1000,9999))

def fakeCNH():
	cnh = str(random.randint(0,9))+str(random.randint(0,9))+str(random.randint(0,9))+str(random.randint(0,9))+str(random.randint(0,9))+str(random.randint(0,9))+str(random.randint(0,9))+str(random.randint(0,9))+str(random.randint(0,9))+str(random.randint(0,9))+str(random.randint(0,9))
	return cnh
	
def fakeNota():
	nota = random.randint(0,5)
	return nota	

def fakeAvaliaca(n):
	ava = ""
	if (n<=2):
		ava = "Ruim"
	elif (n<4 and n>2):
		ava = "Razoavel"
	else:
		ava = "Boa"
	return ava

def fakeQtdCarro():
	qtd = random.randint(1,4)
	return qtd	

def fakeLocalizacao():
	loca = random.randint(1,1000)
	return loca


#carro
	
def fakeMarca():
	s = ['Fiat','Honda','Jaguar','Nissan','audi','Renault','Ford','Mercedes']
	return str(s[random.randint(0,len(s)-1)])	
	
def fakeModelo():
	s = ['Sedan','Uno','Conversivel','troll','Rage Rover','Quadrado','Redondo']
	return str(s[random.randint(0,len(s)-1)])

def fakeCor():
	s = ['Amarelo','Azul','Rosa','Vermelho','Verde','Roxo','Branco','Amarelo','Cinza']
	return str(s[random.randint(0,len(s)-1)])
	
#cep
def fakeMunicipioVix():
	s = ['Cariacica','Vitoria','Vila Velha','Viana','Serra']
	return str(s[random.randint(0,len(s)-1)])

def fakeBairroVix():
	s = ['Jardim da penha','Jardim Camburi','Laranjeiras','Praia do canto','Mata da praia','Serra Dourada','Itaparica','veneza']
	return str(s[random.randint(0,len(s)-1)])

def fakeCEP():
	CEP = str(random.randint(0,9))+str(random.randint(0,9))+str(random.randint(0,9))+str(random.randint(0,9))+str(random.randint(0,9))+'-'+str(random.randint(0,9))+str(random.randint(0,9))+str(random.randint(0,9))
	return CEP

def fakeRua():
	s = ['Rua','Avenida']
	nome = fake.first_name()
	sobrenome = fake.last_name()	
	rua = str(s[random.randint(0,len(s)-1)]) + ' '+nome+' '+sobrenome+'.'
	return rua
	
def fakeHora():
	hora = str(random.randint(0,23))+':'+str(random.randint(0,59))
	return hora
	
#Criando arq usuario,motorista e possui
arq = open("usuario.sql","w")
arq2 = open("motorista.sql","w")
arq3 = open("consulta.sql","w")
arq4 = open("tem.sql","w")
arq5 = open("veiculo.sql","w")
arq6 = open("cep.sql","w")
arq7 = open("localizacao.sql","w")
arq8 = open("carona.sql","w")
#arq6 = open("carona.sql","w")
# Abrindos os arqs
arq.write('INSERT INTO usuario (login, nome, matricula_ou_siape, telefone, email, senha) VALUES\n')
arq2.write('INSERT INTO motorista (cnh, fk_usuario_idUsuario) VALUES\n')
arq3.write('INSERT INTO consulta (fk_carona_id_carona, fk_usuario_idusuario) VALUES\n')
arq4.write('INSERT INTO tem (fk_veiculo_id_veiculo, fk_motorista_fk_usuario_idusuario) VALUES\n')
arq5.write('INSERT INTO veiculo (marca, modelo,cor) VALUES\n')
arq6.write('INSERT INTO cep (municipio, bairro,rua,cep) VALUES\n')
arq7.write('INSERT INTO localizacao (horario_saida,horario_chegada,fk_cep_cep,fk_cep_cep_) VALUES\n')
arq8.write('INSERT INTO carona (avaliacao,nota_avaliacao,qtd_vagas,fk_localizacao_id_localizacao,fk_motorista_fk_idusuario) VALUES\n')

#Carona
for i in range(1500000):
	vagas = str(fakeQtdCarro())
	nota = (fakeNota())
	avaliacao = (fakeAvaliaca(nota))
	idLocalizaca = str(random.randint(1,999))
	idUsuario = str(random.randint(1,90000))
	if(i<1500000-2):
		arq8.write("\t('"+avaliacao+"','"+str(nota)+"','"+vagas+"','"+idLocalizaca+"','"+idUsuario+"'),\n")
	if (i==1500000-1):
		arq8.write("\t('"+avaliacao+"','"+str(nota)+"','"+vagas+"','"+idLocalizaca+"','"+idUsuario+"')\n\tON CONFLICT DO NOTHING;\n")	
#Arquivo cep e localizacao
lst = []
cont = 0
for i in range (2500):
	municipio = fakeMunicipioVix()
	bairro = fakeBairroVix()
	rua = fakeRua()
	cep = fakeCEP()
	lst.append(cep)
	hora1 = fakeHora()
	hora2 = fakeHora()
			
	if(len(lst)==2 and cont != 1000):
		if(i<1000):
			arq7.write("\t('"+hora1+"','"+hora2+"','"+lst[0]+"','"+lst[1]+"'),\n")
		if (i==1000-1):
			arq7.write("\t('"+hora1+"','"+hora2+"','"+lst[0]+"','"+lst[1]+"')\n\tON CONFLICT DO NOTHING;\n")
		cont += 1
		lst = []
				
	if(i<1000):
		arq6.write("\t('"+municipio+"','"+bairro+"','"+rua+"','"+cep+"'),\n")
		
	if (i==1000-1):
		arq6.write("\t('"+municipio+"','"+bairro+"','"+rua+"','"+cep+"')\n\tON CONFLICT DO NOTHING;\n")	
		
		
#arquivo veiculo
for i in range (1000):
	marca = fakeMarca()
	modelo = fakeModelo()
	cor = fakeCor()
	if(i<1000):
		arq5.write("\t('"+marca+"','"+modelo+"','"+cor+"'),\n")
	if (i==1000-1):
		arq5.write("\t('"+marca+"','"+modelo+"','"+cor+"')\n\tON CONFLICT DO NOTHING;\n")	
	

#Arquivo de consulta
for i in range(100000):
	n1 = str(random.randint(1,950000))
	n2 = str(random.randint(1,99000))
	if(i<100000):
		arq3.write("\t('"+n1+"','"+n2+"'),\n")
	if (i==100000-1):
		arq3.write("\t('"+n1+"','"+n2+"')\n\tON CONFLICT DO NOTHING;\n")
		
#Arquivo de tem
for i in range(1000):
	n1 = str(random.randint(1,999))
	n2 = str(random.randint(1,99000))
	if(i<1000):
		arq4.write("\t('"+n1+"','"+n2+"'),\n")
	if (i==1000-1):
		arq4.write("\t('"+n1+"','"+n2+"')\n\tON CONFLICT DO NOTHING;\n")		

#Arquivo de Motorista e usuário
for i in range(100000):
	nome = fake.first_name()
	sobrenome = fake.last_name()
	nomeCompleto = nome+" "+sobrenome
	password = password_generator();
	email = geraEmail(nome,sobrenome)
	matricula = fakeMatricula()
	login = fakeLogin(nome)
	#
	iD = str(i+1)
	if(i<100000):
		cnh = fakeCNH()
		
		arq2.write("\t('"+cnh+"','"+iD+"'),\n")
	if (i==100000-1):
		cnh = fakeCNH()
		arq2.write("\t('"+cnh+"','"+iD+"')\n\tON CONFLICT DO NOTHING;\n")

	if(i<100000):
		arq.write("\t('"+login+"','"+nomeCompleto+"','"+matricula+"','"+fakeTelefone()+"','"+email+"','"+password+"'),\n")
	if (i==100000 -1):
		arq.write("\t('"+login+"','"+nomeCompleto+"','"+matricula+"','"+fakeTelefone()+"','"+email+"','"+password+"')\n\tON CONFLICT DO NOTHING;\n")
 
 



arq.close()
arq2.close()
arq3.close()
arq4.close()
arq5.close()
arq6.close()
arq7.close()
arq8.close()
