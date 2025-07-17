# Time Logger – systemd

A simple test project to learn how to create a custom `systemd` service and timer in Linux.

This setup uses a Bash script that logs the current system time into a file every minute using `systemd` and a timer.

## Files Included

- `time-logger.sh` – Bash script that appends the current time to `/var/log/time-logger.log`
- `time-logger.service` – systemd unit file that runs the script
- `time-logger.timer` – systemd timer that triggers the service every minute

## How to Use

1. Copy files to systemd directory:
   ```bash
   sudo cp time-logger.* /etc/systemd/system/
   ```

2. Reload systemd to recognize new units:
   ```bash
   sudo systemctl daemon-reload
   ```

3. Enable and start the timer:
   ```bash
   sudo systemctl enable --now time-logger.timer
   ```

4. View logs:
   ```bash
   journalctl -u time-logger.service
   cat /var/log/time-logger.log
   ```

##  What I Learned

- How to write and run a Bash script with system permissions
- Creating and configuring `systemd` service and timer units
- Using `systemctl` and `journalctl` for diagnostics
- Automating scheduled tasks without using cron

## Tested on

- Ubuntu 24.04 LTS (AWS EC2 instance)

