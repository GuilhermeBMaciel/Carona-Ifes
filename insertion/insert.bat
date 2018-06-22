echo "inicio do processo" %time%
set TEMP_INICIO=%time%
psql -h localhost -d carona -U postgres -p 5432 -q -W -f usuario.sql
echo "inicio do processo" %TEMP_INICIO%
echo "fim do processo" %time%
echo ****************************************************************
set TEMP_INICIO=%time%
psql -h localhost -d carona -U postgres -p 5432 -q -W -f motorista.sql
echo "inicio do processo" %TEMP_INICIO%
echo "fim do processo" %time%
echo ****************************************************************
pause()