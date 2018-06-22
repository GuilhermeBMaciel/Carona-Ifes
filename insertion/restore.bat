echo "inicio do processo" %time%
set TEMP_INICIO=%time%

pg_restore -h localhost -U postgres -d carona2 < carona.bkp

echo "inicio do processo" %TEMP_INICIO%
echo "fim do processo" %time%
pause()