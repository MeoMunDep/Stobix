#!/bin/bash

if ! command -v python3 &> /dev/null; then
    echo "Please install Python version higher than 3.10 first!"
    exit 1
fi

git pull origin main >/dev/null 2>&1
if [ $? -eq 0 ]; then
    print_green "Bot is up to date!"
else
    print_red "Failed to update the bot. Please check your internet connection or Git configuration."
fi

pip3 install -r requirements.txt

if [ ! -f configs.json ]; then
    echo "Creating configs.json..."
    cat > configs.json <<EOL
{
  "delayEachAccount": [5, 8],
  "timeToRestartAllAccounts": 300,
  "howManyAccountsRunInOneTime": 10,
  "doTasks": true
}
EOL
fi

[ ! -f privateKeys.txt ] && echo "# bot_data" > privateKeys.txt
[ ! -f proxies.txt ] && echo "# proxies" > proxies.txt

python3 meomundep.py
