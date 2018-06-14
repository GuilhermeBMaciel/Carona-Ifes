''' Checar condições no banco utilizando o operador "Exists" ou "not exists"
EXISTS - verificar os motoristas que tem boas avaliações
select exists (select * from carona c where avaliacao = 'otimo')

NOT EXIST - Verificar os motoristas que não tem avaliação
select exists (select * from carona c where avaliacao = 'horrivel')

se não existe carona acima da media.
select not exists (select nota_avaliacao from carona c where nota_avaliacao = 10)

'''
