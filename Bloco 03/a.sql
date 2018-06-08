
/*inner join:*/

select 	motorista.fk_usuario_login as "Motorista", carona.id_carona as "carona", carona.avaliacao as "Avaliacao", carona.nota_avaliacao as "Nota"
from motorista inner join carona on (motorista.fk_usuario_login = carona.fk_motorista_fk_usuario_login);


/*right join:*/



/*left join:*/

select 	consulta.FK_Usuario_login as "Caroneiro", carona.id_carona as "Carona"
from consulta left join carona on (consulta.Fk_carona_id_carona = carona.id_carona);

