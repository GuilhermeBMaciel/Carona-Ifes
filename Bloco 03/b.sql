
Create view destino as
Select fk_cep_cep_chegada,COUNT(fk_cep_cep_chegada) as FreqChegada
from localizacao
group by fk_cep_cep_chegada
order by FreqChegada desc;
