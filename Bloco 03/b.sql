Create view destino as
Select fk_cep_cep_ as Destino ,COUNT(fk_cep_cep_) as Frequencia
from localizacao
group by fk_cep_cep_
order by Frequencia desc;
