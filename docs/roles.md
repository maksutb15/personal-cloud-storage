# SIS2 — Users and Permissions

## Roles and permissions

| Role | Description | Permissions | Superuser permissions |
|---|---|---|---|
| cloud_admin | Project administration | Manage project configuration and permissions | Only through approved sudo commands |
| cloud_auditor | System auditing | Read permitted logs and inspect service status | None |
| automation_bot | Automated project operations | Execute approved automation tasks | None by default |
| cloud_app | Application service account | Access only required application and storage paths | None |

## Security principles

- Apply the principle of least privilege.
- Do not share private SSH keys or passwords.
- Keep application data inaccessible to unrelated users.
- Validate sudoers configuration before applying changes.
