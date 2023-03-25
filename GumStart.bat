
@echo Clearing Server Cache Files
cd /d C:\...\GumCore_premade
rd /s /q cache

start "GumCore" C:\...\GumCore_premade\artifacts\FXServer.exe +exec server.cfg
