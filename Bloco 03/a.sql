
/*inner join:*/

select 	motorista.fk_usuario_login as "Motorista", carona.id_carona as "carona", carona.avaliacao as "Avaliacao", carona.nota_avaliacao as "Nota"
from motorista inner join carona on (motorista.fk_usuario_login = carona.fk_motorista_fk_usuario_login);


/*right join:*/



/*left join:*/



