# User and Permissions Management – Linux

This lab demonstrates how to manage Linux users, groups, and file permissions for application deployment and collaboration.

## Tasks Completed

- Created a Linux user (`devopsapp`) to run applications
- Assigned the user to a new group (`devops`)
- Set up proper ownership and permissions for `/opt/devopsapp` (chmod 750)
- Created a shared directory (`/opt/devops-shared`) for the group with SGID (chmod 2770)

## Scripts

- `create-devops-user.sh`: Adds the `devopsapp` user, sets a password, and configures access to `/opt/devopsapp`
- `shared-dir-setup.sh`: Creates a shared directory with group-based access and sticky group bit

## Permissions Overview

- `/opt/devopsapp`: Owned by `devopsapp:devops`, accessible only to owner and group
- `/opt/devops-shared`: Group-writable directory with SGID, so new files inherit the `devops` group

## Tested with:

- Ubuntu 24.04 (AWS EC2)
- Verified that:
  - `devopsapp` can access `/opt/devopsapp` and write to it
  - Cannot access `/home/ubuntu` or other system directories
  - Shared group directory behaves as expected

## What I Learned

- How to manage users and groups in Linux
- How to set file ownership with `chown` and permissions with `chmod`
- How to set SGID bit on shared directories
- How to restrict users to specific parts of the system


