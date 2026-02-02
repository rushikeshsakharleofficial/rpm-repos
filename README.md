# Linux Hardened RPM Repository

Custom RPM packages hosted at https://rpm.linuxhardened.com

## Usage

### Add Repository (RHEL/Fedora/CentOS)

```bash
sudo curl -o /etc/yum.repos.d/linuxhardened.repo https://rpm.linuxhardened.com/linuxhardened.repo
```

Or manually create `/etc/yum.repos.d/linuxhardened.repo`:

```ini
[linuxhardened]
name=Linux Hardened RPM Repository
baseurl=https://rpm.linuxhardened.com/packages
enabled=1
gpgcheck=0
```

### Install Packages

```bash
sudo dnf install <package-name>
```

## Available Packages

See [packages/](packages/) directory.
