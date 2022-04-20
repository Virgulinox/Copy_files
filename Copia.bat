@ECHO OFF
SET ORIGEM= ::Path to copy
SET DESTINO= :: Path to paste

::LIMPA OS LOGS
DEL COPIADO.LOG /Q
DEL FALHA.LOG /Q

for /F "tokens=*" %%A IN (lista.txt) DO CALL :COPIA %%A
GOTO :EOF

:COPIA
echo Verificando %1 ...
IF EXIST %ORIGEM%\%1 (
	:: se existe copia e grava no log copiado
	copy %ORIGEM%\%1 %DESTINO% /Y

	echo %1 >> copiado.log

	:: VAI PARA O PROXIMO ARQUIVO
	GOTO :EOF
)

:: se não existe apenas grava no log falha
echo %1 >> falha.log
	
