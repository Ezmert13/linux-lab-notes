# UMASK Cheatsheet for DevOps

`umask` (User Mask or User File Creation Mode Mask) defines **default permissions** for newly created files and directories.

---

## What is `umask`?

- It **subtracts** permissions from the default base:
  - Files: `666` (rw-rw-rw-)
  - Directories: `777` (rwxrwxrwx)

---

## How to read UMASK

```
UMASK format: [special] [owner] [group] [others]
Example:      0       0       2       7
```

- 1st digit: special bits (rarely used)
- Next 3: define what **permissions NOT to set**

---

## Common UMASK Values

| UMASK | File Perms | Dir Perms | Meaning                            |
|--------|-------------|-------------|------------------------------------|
| `000`  | `666`      | `777`      | Full access for all (⚠️ unsafe)    |
| `002`  | `664`      | `775`      | Group-writable, common for shared dev |
| `022`  | `644`      | `755`      | Standard: only owner writes        |
| `027`  | `640`      | `750`      | Group read-only, others no access  |
| `077`  | `600`      | `700`      | Owner-only, private mode           |

---

## How to set UMASK

### Temporary (current session):
```bash
umask 0027
```

### Permanent:

- For user: add to `~/.bashrc` or `~/.profile`:
```bash
umask 0027
```

- Global: add to `/etc/profile`, `/etc/login.defs`, or `/etc/bash.bashrc`

---

## Example in script

```bash
#!/bin/bash
umask 027
echo "Private backup" > /backup/secure.txt
```

New file will be created with `rw-r-----`

---

## Pro Tip:

- `umask` **does not grant extra permissions**
- It only **removes permissions** from default base
- Files **never** get `x` (execute) by default

---

## Check your current UMASK:

```bash
umask         # e.g. 0022
```


