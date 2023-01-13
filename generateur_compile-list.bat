@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

SET "source=.\src"
call :nbDossierInSource "%source%"

ENDLOCAL
goto :eof


::---------------------------------------------------------------::
:: Détermine le nombre de sous dossier dans les dossiers sources ::
::---------------------------------------------------------------::
:nbDossierInSource
    SET /a "nbDossierInSource=0"
    FOR /f %%i IN ('dir "%~1" /b /d') DO (
        :: Afichage de teste
        echo args = %~1 & echo i = %%i & echo.


        IF %%i == "" (
            echo pas de sous dossier
        ) else (
            :: Appelle récursif
            call :nbDossierInSource "%source%\%%i"
        )
    )
goto :eof