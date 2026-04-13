# linux_backup

Bash script for full Linux system backups with `tar`. Archives the entire root filesystem into a timestamped `.tar.gz`, preserving permissions, ACLs, and extended attributes while excluding virtual filesystems.

![Bash](https://img.shields.io/badge/Bash-Script-4EAA25) ![Linux](https://img.shields.io/badge/Linux-Backup-FCC624)

---

## How It Works

Runs `tar` against `/` with sensible exclusions for virtual and temporary filesystems. The output is a compressed archive named with the hostname and timestamp.

### Excluded Directories

`/dev`, `/proc`, `/tmp`, `/run`, `/mnt`, `/lost+found`, `/sys`, and the backup destination itself.

### Preserved Attributes

- File permissions (`-p`)
- Extended attributes (`--xattrs`)
- ACLs (`--acls`)

---

## Usage

```bash
# Use default path ~/Documents/backups/system_backup
sudo bash archiving/main.sh

# Specify custom backup destination
sudo bash archiving/main.sh /mnt/external/backups
```

The script will:
1. Create the destination directory if it doesn't exist (or prompt to create one)
2. Wait 10 seconds before starting (time to cancel)
3. Archive the full system to `backup_<hostname>_<date>_<time>.tar.gz`

---

## Project Structure

```
linux_backup/
├── archiving/
│   └── main.sh       # Full system backup script
└── recovering/
    └── main.sh       # Restore script (placeholder)
```
