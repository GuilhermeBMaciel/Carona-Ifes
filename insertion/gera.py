
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
#Criando arq
arq = open("usuario.sql","w")
arq2 = open("motorista.sql","w")

arq.write('INSERT INTO usuario (login, nome, matricula_ou_siape, telefone, email, senha) VALUES\n')
arq2.write('INSERT INTO motorista (cnh, fk_usuario_login) VALUES\n')

for i in range(1500000):
	nome = fake.first_name()
	sobrenome = fake.last_name()
	nomeCompleto = nome+" "+sobrenome
	password = password_generator();
	email = geraEmail(nome,sobrenome)
	matricula = fakeMatricula()
	login = fakeLogin(nome)
	#
	if(i<99998):
		cnh = fakeCNH()
		arq2.write("\t('"+cnh+"','"+login+"'),\n")
	if (i==99999):
		cnh = fakeCNH()
		arq2.write("\t('"+cnh+"','"+login+"')\n\tON CONFLICT DO NOTHING;\n")

	if(i<1500000 -2):
		arq.write("\t('"+login+"','"+nomeCompleto+"','"+matricula+"','"+fakeTelefone()+"','"+email+"','"+password+"'),\n")
	if (i==1500000 -1):
		arq.write("\t('"+login+"','"+nomeCompleto+"','"+matricula+"','"+fakeTelefone()+"','"+email+"','"+password+"')\n\tON CONFLICT DO NOTHING;\n")
 


arq.close()
arq2.close()
