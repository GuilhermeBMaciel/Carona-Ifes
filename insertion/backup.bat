echo "inicio do processo" %time%
set TEMP_INICIO=%time%

pg_dump -h localhost -Fc  -U postgres -W -d carona > C:\Users\User\Desktop\bd2\carona.bkp 

echo "inicio do processo" %TEMP_INICIO%
echo "fim do processo" %time%
pause()