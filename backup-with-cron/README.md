# Bash Backup Script + Cron

A simple Bash script to back up the home directory (`/home/ubuntu`) daily using `cron`.

## Script

- `backup-home.sh`: compresses `/home/ubuntu` into a `.tar.gz` file with a timestamp
- Output files are saved to `/home/ubuntu/backups/`

## Automation

- The script is scheduled using `cron` to run every day at 03:00:
0 3 * * * /home/ubuntu/linux-lab-notes/bash/backup-home.sh

## What I learned

- How to write a Bash script with dynamic filenames
- How to use `tar` for backups
- How to use `cron` for task scheduling

## Tested on

- Ubuntu 24.04 LTS (AWS EC2 instance)

