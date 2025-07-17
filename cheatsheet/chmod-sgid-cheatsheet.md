# Linux Permissions & SGID Cheatsheet

This is a quick reference for understanding file permissions, numeric modes, and SGID usage in Linux.

---

## Permission Values

| Permission | Value | Meaning         |
|------------|-------|-----------------|
| `r` (read) | 4     | Read            |
| `w` (write)| 2     | Write           |
| `x` (exec) | 1     | Execute         |
| `-` (none) | 0     | No permission   |

### Examples:
- `7` = 4 + 2 + 1 = `rwx` → full access
- `6` = 4 + 2 = `rw-` → read and write
- `5` = 4 + 1 = `r-x` → read and execute
- `0` = no access

---

## chmod Numeric Examples

| Command         | Result                       | Use Case                        |
|----------------|------------------------------|----------------------------------|
| `chmod 777`     | `rwx/rwx/rwx`                | Full access for all (unsafe) |
| `chmod 755`     | `rwx/r-x/r-x`                | Script or public web dir         |
| `chmod 750`     | `rwx/r-x/---`                | Shared with group only          |
| `chmod 644`     | `rw-/r--/r--`                | Public readable text file       |
| `chmod 000`     | `---/---/---`                | No one can access (locked)      |

---

## SGID (Set Group ID) Bit

### What it does:
- On **directories**: new files inherit the **group** of the directory instead of the user's primary group
- On **executables**: runs the program with the group ID of the file (not covered here)

### How to set:
```bash
chmod 2xxx folder/
```

### Examples:
| Command         | Meaning                                         |
|----------------|-------------------------------------------------|
| `chmod 2777`    | Full access for all, SGID enabled               |
| `chmod 2770`    | Full access for owner + group, none for others |
| `chmod 2755`    | Common for group-shared binaries                |

### How to identify SGID:
```bash
ls -ld folder/
```

Look for an `s` in the group position:
```
drwxrws--- 2 root devops ...
```

---

## Good Practice for Shared DevOps Folders

```bash
sudo mkdir /opt/shared
sudo chown root:devops /opt/shared
sudo chmod 2770 /opt/shared
```

This setup:
- Allows only `devops` group to access
- All new files will inherit the `devops` group
- SGID ensures group ownership consistency

---

## Test Group Inheritance

```bash
touch /opt/shared/test.txt
ls -l /opt/shared/test.txt
```

You should see group ownership as `devops` (if SGID is working).


