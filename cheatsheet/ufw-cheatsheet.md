# UFW (Uncomplicated Firewall) Cheatsheet

`ufw` is a simple and user-friendly tool for managing firewall rules on Linux systems using `iptables`.

---

## What is UFW?

UFW stands for **Uncomplicated Firewall**. It allows you to:

- Allow or block access to ports/services
- Restrict access based on IP address
- Set up default firewall policies

---

## Check Firewall Status

```bash
sudo ufw status
sudo ufw status verbose
```

---

## Enable / Disable Firewall

```bash
sudo ufw enable     # Enable firewall (starts blocking!)
sudo ufw disable    # Disable firewall
```

---

## Allow Traffic

```bash
sudo ufw allow ssh            # Allow SSH (port 22)
sudo ufw allow 80             # Allow HTTP
sudo ufw allow 443            # Allow HTTPS
sudo ufw allow 8080/tcp       # Allow TCP on port 8080
sudo ufw allow from 192.168.1.10 to any port 22
```

---

## Deny Traffic

```bash
sudo ufw deny 8080            # Block port 8080
sudo ufw reject 25            # Reject SMTP connections (sends ICMP reply)
```

---

## Default Policies

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

---

## Delete Rules

```bash
sudo ufw status numbered      # List rules with numbers
sudo ufw delete <number>      # Delete rule by number
```

---

## Application Profiles

```bash
sudo ufw app list             # Show available app profiles
sudo ufw allow 'OpenSSH'      # Use predefined profile
```

---

## Example Secure Setup (Common)

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow OpenSSH
sudo ufw allow 80,443/tcp
sudo ufw enable
```

---

## Useful Debug/Test Commands

```bash
sudo ufw logging on
sudo ufw status verbose
sudo ufw show raw              # View underlying iptables rules
```

---

**Tip:** Always allow SSH (`ufw allow OpenSSH`) before enabling the firewall on remote servers!


