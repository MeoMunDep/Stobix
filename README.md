# 🤖 MeoMunDep stobix Bot - Complete Setup Guide

This comprehensive guide will help you set up and run the MeoMunDep Bot on Windows, macOS, or Linux. The bot automates certain game tasks efficiently and securely.

## 📋 Table of Contents

- [Prerequisites](#prerequisites)
- [Installation Methods](#installation-methods)
- [Configuration](#configuration)
- [Running the Bot](#running-the-bot)
- [Using Proxies](#using-proxies)
- [Troubleshooting](#troubleshooting)
- [Security Recommendations](#security-recommendations)
- [Contact and Support](#contact-and-support)

## Prerequisites

Before setting up the bot, ensure you have the following installed:

- **Python 3.11.9** - Required to run the script
- **Git** (optional) - For cloning the repository
- **Docker** (optional) - For containerized deployment

## Installation Methods

You can choose between standard installation or Docker-based deployment.

<details>
<summary><b>⚙️ Standard Installation</b></summary>

### 1. Install Python

<details>
<summary><b>Windows</b></summary>

- Download Python from [python.org](https://www.python.org/downloads/release/python-3119/)
- During installation, check "Add Python to PATH"
- Verify installation by opening Command Prompt and typing:
  ```bash
  python --version
  ```
  </details>

<details>
<summary><b>macOS</b></summary>

- Install [Homebrew](https://brew.sh/) first:
  ```bash
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```
- Install Python using Homebrew:
  ```bash
  brew install python
  ```
- Verify installation:
  ```bash
  python3 --version
  ```
  </details>

<details>
<summary><b>Linux</b></summary>

- For Ubuntu/Debian:
  ```bash
  sudo apt update
  sudo apt install python3 python3-pip -y
  ```
- For CentOS/RHEL:
  ```bash
  sudo yum install python3 python3-pip -y
  ```
- Verify installation:
  ```bash
  python3 --version
  ```
  </details>

### 2. Install Git (Optional)

<details>
<summary><b>Windows</b></summary>

- Download from [git-scm.com](https://git-scm.com/download/win)
- Use default settings during installation
</details>

<details>
<summary><b>macOS</b></summary>

```bash
brew install git
```

</details>

<details>
<summary><b>Linux (Debian/Ubuntu)</b></summary>

```bash
sudo apt install git -y
```

</details>

### 3. Clone Repository (If using Git)

```bash
git clone https://github.com/MeoMunDep/stobix.git
cd stobix
```

### 4. Install Required Packages

Navigate to the bot folder and run:

<details>
<summary><b>Windows</b></summary>

```bash
pip install -r requirements.txt
```

</details>

<details>
<summary><b>macOS/Linux</b></summary>

```bash
pip3 install -r requirements.txt
```

</details>

</details>

<details>
<summary><b>🐳 Docker Installation</b></summary>

### 1. Install Docker

<details>
<summary><b>Windows/macOS</b></summary>

- Download and install [Docker Desktop](https://www.docker.com/products/docker-desktop)
</details>

<details>
<summary><b>Linux</b></summary>

```bash
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER
newgrp docker
```

</details>

### 2. Create Dockerfile

Create a file named `Dockerfile` with the following content:

```dockerfile
FROM python:3.10.11-alpine3.18

RUN apk add --no-cache build-base libffi-dev openssl-dev

WORKDIR /app

COPY requirements.txt .

RUN pip3 install --upgrade pip setuptools wheel
RUN pip3 install --no-warn-script-location --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "meomundep.py"]
```

### 3. Create docker-compose.yml (Optional)

Create a file named `docker-compose.yml` with the following content:

```yaml
version: '3.8'
services:
  stobix:
    container_name: 'stobix'
    build:
      context: .
    stop_signal: SIGINT
    restart: unless-stopped
    command: 'python meomundep.py -a 1 -m y'
    volumes:
      - .:/app
    working_dir: /app
    tty: true
```

</details>

## Configuration

<details>
<summary><strong>📂 Required Files</strong></summary>

Ensure you have the following files in your folder:

- `meomundep.py` - Main bot script
- `configs.json` - Configuration file
- `privateKeys.txt` - Bot data
- `proxies.txt` - List of proxies (optional)
- `requirements.txt` - List of required packages

</details>

<details>
<summary><strong>📦 requirements.txt Content</strong></summary>

```txt
aiohttp
aiohttp_proxy
beautifulsoup4
base58
cloudscraper
colorama
Cryptodome
nacl
solana
web3
```

</details>

<details>
<summary><strong>⚙️ Configurations (configs.json)</strong></summary>

Edit the `configs.json` file to customize the bot's behavior:

```json
{
  "delayEachAccount": [5, 8],
  "timeToRestartAllAccounts": 300,
  "howManyAccountsRunInOneTime": 10,
  "doTasks": true,
}
```

</details>

<details>
<summary><strong>📊 Configuration Parameters Table</strong></summary>

| Field                         | Type              | Description                                                 | Example Value               |
| ----------------------------- | ----------------- | ----------------------------------------------------------- | --------------------------- |
| `delayEachAccount`            | Array \[min, max] | Random delay range (in seconds) between processing accounts | `[5, 8]`                    |
| `timeToRestartAllAccounts`    | Integer           | Time (in seconds) to wait before restarting all accounts    | `300`                       |
| `howManyAccountsRunInOneTime` | Integer           | Number of accounts to run simultaneously                    | `10`                        |
| `doTasks`                     | Boolean           | Enable automatic task execution                             | `true`                      |

</details>

## ▶️ Running the Bot

<details>
<summary><b>Standard Method</b></summary>

### Windows

```bash
python meomundep.py
```

Or double-click the provided `run.bat` file.

### macOS/Linux

```bash
python3 meomundep.py
```

Or make the script executable and run:

```bash
chmod +x run.sh && ./run.sh
```

For obfuscated versions:

```bash
chmod +x meomundep
./meomundep
```

</details>

<details>
<summary><b>Docker Method</b></summary>

### Build and Run with Docker

```bash
docker build -t meomundep .
docker run -it --rm -v ${PWD}/data:/app/data --name stobix-container stobix-image
```

### Using Docker Compose

```bash
docker-compose up --build
```

</details>

## File Permissions

<details>
<summary><b>Windows</b></summary>

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

</details>

<details>
<summary><b>Linux/macOS</b></summary>

```bash
chmod 600 configs.json privateKeys.txt proxies.txt meomundep.py
```

</details>

<details>
<summary><strong>📄 Private Keys and Proxies</strong></summary>

- [Generate wallets here](https://github.com/MeoMunDep/Automatic-Ultimate-Create-Wallets-for-Airdrop)
- This file contains user data in the following format:

```txt
0x...
0x...
0x...
```

- If you are using proxies, add them to `proxies.txt`. Leave the file blank if not using proxies. Supported formats:
📥 [Free proxy from Webshare](https://www.webshare.io/?referral_code=4l5kb3glsce7)

```txt
http://host:port
https://host:port
socks4://host:port
socks5://host:port
http://user:password@host:port
https://user:password@host:port
socks4://user:password@host:port
socks5://user:password@host:port
```

_Note: each row for each account_
</details>

## Troubleshooting

<details>
<summary><b>Bot crashes on startup</b></summary>

- Ensure all required packages are installed
- Check your Python version (Python 3.11.9 required)
- Verify configuration file format
</details>

<details>
<summary><b>Connection errors</b></summary>

- Check your internet connection
- Verify proxy settings if using proxies
- Check if the required endpoints are accessible
</details>

<details>
<summary><b>Authentication failures</b></summary>

- Ensure your bot data is correct
- Check if your IP or proxy is blocked
</details>

## Security Recommendations

<details>
<summary><b>Recommendations</b></summary>

1. **Data Protection**:

   - Keep your `privateKeys.txt` and configuration files secure
   - Use file permissions to restrict access

2. **Docker Security**:

   - Run Docker containers as non-root user:
     ```bash
     docker run -u 1000:1000 stobix
     ```
   - Keep your Docker installation up-to-date

3. **Proxy Usage**:
   - Use secure proxies from trusted providers
   - Rotate proxies periodically to avoid IP bans

</details>

## Security Notice

The executable file is obfuscated to protect the source code. This is normal and doesn't indicate malicious behavior.

## Contact and Support

- **Support me via** [Referral Link](https://stobix.com/invite/6gau18)
- **Support me via Donate** [Here](https://t.me/KeoAirDropFreeNe/312/27801)
- **Contact for work:** [Telegram](https://t.me/MeoMunDep)
- **Join the support group:** [Join here](https://t.me/KeoAirDropFreeNe)
- **Updates Channel:** [View channel](https://t.me/KeoAirDropFreeNee)
- **YouTube Channel:** [Watch here](https://www.youtube.com/@keoairdropfreene)
- **Instagram:** [Follow me](https://www.instagram.com/meomundep)
- **Tiktok:** [Follow me](https://www.tiktok.com/@meomundep)

⚠️ **Disclaimer**: This code is provided "as is" without any warranties. Use it at your own risk. You are solely responsible for any consequences arising from its use. Redistribution or sale of this code in any form is strictly prohibited.

✨ Thank you for using the bot, hope you earn from my scripts! Good luck! 🚀

---

<p align="center"><a href="#MeoMunDep-stobix-Bot-Complete-Setup-Guide">⬆️ Back to top</a></p>

