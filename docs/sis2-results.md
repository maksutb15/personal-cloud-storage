# SIS2 — Users and Permissions

## Objective

Configure Linux users, groups, directory permissions, SSH key authentication,
and a systemd startup check for the Personal Cloud Storage project.

## Roles

| Role | Account or group | Access |
|---|---|---|
| Administrator | cloud_admins | Project administration |
| Auditor | cloud_auditor / cloud_auditors | Audit role; no sudo |
| Automation | automation_bot / cloud_automation | SSH key authentication; no sudo |
| Application | cloud_app | Access to application and storage directories; no sudo |

## Groups and accounts

Created groups:
- cloud_admins
- cloud_auditors
- cloud_automation
- cloud_app

Created accounts:
- automation_bot
- cloud_auditor
- cloud_app

## Directory permissions

The project directories use permission mode 750.

- Configuration, logs, and backups are owned by root:cloud_admins.
- Application and storage directories are owned by cloud_app:cloud_app.

## SSH

SSH key authentication for automation_bot was tested locally.
The command returned the account name automation_bot.

## Sudoers

The accounts automation_bot, cloud_auditor, and cloud_app are not permitted
to use sudo. This follows the principle of least privilege.

## systemd

The personal-cloud-check.service unit is enabled and its startup check
completed successfully. The service is a test startup check, not a complete
cloud storage web application.

## Automation

The setup script is stored at scripts/setup_sis2.sh.

## Evidence

Screenshots should be added to the screenshots/ directory.
## Evidence

Screenshots documenting the SIS2 implementation:

1. [Users and groups](../screenshots/01-users-and-groups.jpg)
2. [Directory permissions](../screenshots/02-directory-permissions.jpg)
3. [Sudo permissions](../screenshots/03-sudo-permissions.jpg)
4. [Automation SSH test](../screenshots/04-automation-ssh.jpg)
5. [systemd service status](../screenshots/05-systemd-service.jpg)
## Conclusion

The project groups, service accounts, directory permissions, SSH key
authentication, and systemd startup check were configured and verified.
