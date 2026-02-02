# Linux Hardened RPM Repository

Custom RPM repository hosted at **https://rpm.linuxhardened.com**

## Add Repository

```bash
sudo tee /etc/yum.repos.d/linuxhardened.repo << 'EOF'
[linuxhardened]
name=Linux Hardened
baseurl=https://rpm.linuxhardened.com/packages/$basearch/
enabled=1
gpgcheck=0
EOF
```

## Install Packages

```bash
sudo dnf install <package-name>
```

## Available Packages

- **global-logrotate** - Fast parallel log rotation utility
- **vib** - Backup files before editing with vim/nano

