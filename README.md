# zdb

Lightweight, self-contained MySQL 8.0 for local development. No Docker, no Homebrew, minimal memory footprint.

Clone, setup, run. Fully portable across Apple Silicon.

```
  ███████╗██████╗ ██████╗ 
  ╚══███╔╝██╔══██╗██╔══██╗
    ███╔╝ ██║  ██║██████╔╝
   ███╔╝  ██║  ██║██╔══██╗
  ███████╗██████╔╝██████╔╝
  ╚══════╝╚═════╝ ╚═════╝ 
  ZDB • MySQL Version: 8.0.46
```

## Quick Start

```bash
./zdb --setup
zdb
```

Running `zdb` without arguments is smart:
* Starts MySQL and displays connection card if stopped
* Displays status and connection details if running
* Prompts to run setup if not initialized

---

## Usage

```bash
zdb                         # Start engine or show connection card
zdb up, -u                  # Start database engine
zdb down, -d                # Stop database engine
zdb status, -s              # Show status and connection details
zdb cli, -c                 # Open interactive MySQL console
zdb backup, -b              # Create database backup
zdb restore <file.sql>      # Restore database from backup
zdb help, -h                # Show help guide
```

### Autostart

```bash
zdb autostart enable        # Start MySQL on login
zdb autostart disable       # Disable login start
zdb autostart status        # Check autostart state
```

---

## Configuration

Settings are configured in `.env` based on `.env.example`:

```ini
MYSQL_PORT=3306
MYSQL_BIND_ADDRESS="127.0.0.1"
MYSQL_ROOT_PASSWORD="root"
MYSQL_USER="dev"
MYSQL_PASSWORD='p@$$w0rd'
MYSQL_TIMEZONE="Asia/Dhaka"
MYSQL_BUFFER_POOL="256M"
```

---

## Backups

```bash
zdb -b                      # Creates timestamped dump in backups/
zdb restore <file.sql>      # Restores database from dump
```

---

## Structure

```
├── zdb
├── mysql-8.0.46/
├── .env.example
├── .env
├── .gitignore
├── README.md
├── my.cnf
├── data/
├── run/
├── logs/
├── tmp/
└── backups/
```

---

## Uninstall

```bash
zdb -d
zdb --uninstall
```
