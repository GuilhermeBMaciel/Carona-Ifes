
set TEMP_INICIO=%time%
psql -h localhost -d carona -U postgres -p 5432 -q -W -f cep.sql
psql -h localhost -d carona -U postgres -p 5432 -q  -W -f veiculo.sql
psql -h localhost -d carona -U postgres -p 5432 -q -W -f usuario.sql
psql -h localhost -d carona -U postgres -p 5432 -q -W -f motorista.sql
psql -h localhost -d carona -U postgres -p 5432 -q -W -f tem.sql
psql -h localhost -d carona -U postgres -p 5432 -q -W -f localizacao.sql
psql -h localhost -d carona -U postgres -p 5432 -q -W -f carona.sql
psql -h localhost -d carona -U postgres -p 5432 -q -W -f consulta.sql

echo "inicio do processo" %TEMP_INICIO%
echo "fim do processo" %time%
pause()