
create view local_hora_carona_saida as select localizacao.horario_saida as "Horario de saida",
cep.cep as "Cep de saída", cep.municipio as "Município de saída", 
cep.bairro as "Bairro de saída", cep.rua as "Rua de saída"from localizacao 
inner join cep on (localizacao.fk_cep_cep_saida = cep.cep)
order by localizacao.horario_saida;

select * from local_hora_carona_saida;
