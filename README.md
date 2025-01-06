# PostgreSQL Backup Script for Odoo 16

This script automates the process of backing up a PostgreSQL database used by Odoo 16 Community Edition. It saves the backup locally in a specified directory and then copies it to an external directory (e.g., an external SSD). The script ensures the integrity of the backup process and adapts ownership of the backup file to the user running the shell.

---

## Features

- Automates the creation of compressed PostgreSQL database backups.
- Saves the backup locally in a specified directory.
- Copies the backup to an external directory (e.g., external storage).
- Ensures ownership of the copied backup matches the current shell user.
- Provides detailed error handling for robust execution.

---

## Requirements

1. **PostgreSQL** must be installed and configured.
2. The user must have `sudo` privileges to execute the script.
3. Ensure the local and external directories exist and are writable.

---

## Script Usage

### Command Syntax

```bash
./backup-odoo16-db.sh <LOCAL_BACKUP_DIR> <EXTERNAL_BACKUP_DIR> <DB_NAME> <DB_USER>
