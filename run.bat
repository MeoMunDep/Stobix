@echo off
title Stobix Bot by @MeoMunDep
python --version >nul 2>&1 || (
    echo Please install Python version higher than 3.10 first!
    pause
    exit
)

echo Checking for bot updates...
git pull origin main > nul 2>&1
echo Bot updated!

pip install -r requirements.txt

if not exist configs.json (
    echo Creating configs.json mẫu...
    echo { > configs.json
    echo   "delayEachAccount": [5, 8], >> configs.json
    echo   "timeToRestartAllAccounts": 300, >> configs.json
    echo   "howManyAccountsRunInOneTime": 10, >> configs.json
    echo   "doTasks": true >> configs.json
    echo } >> configs.json
)

if not exist privateKeys.txt echo # game_data > privateKeys.txt
if not exist proxies.txt echo # proxies > proxies.txt

python meomundep.py
pause
