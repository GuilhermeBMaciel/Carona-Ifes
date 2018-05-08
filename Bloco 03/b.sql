
Create view destino as
Select fk_cep_cep_chegada as Destino ,COUNT(fk_cep_cep_chegada) as Frequencia
from localizacao
group by fk_cep_cep_chegada
order by Frequencia desc;
