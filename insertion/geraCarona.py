#Gera fake usuario
import string
import random



def geraAvaliacao(n):
	r = ""
	if(n>=0 and n<=2):
		r= "ruim"
	elif(n>2 and n<4):
		r= "mediano"
	else:
		r= "bom"
	return r
	
def geraNota():
	return random.randint(0,5)

def geraQtdVaga():
	return random.randint(1,4)

def geraFkLocalizacao():
	return random.randint(1,100000)
	
	
def main(args):
	i = geraNota()
	print(i)
	print(geraAvaliacao(i))
	return 0

if __name__ == '__main__':
    import sys
    sys.exit(main(sys.argv))
