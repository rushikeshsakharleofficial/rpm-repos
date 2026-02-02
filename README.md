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

---

## push-pkg - One-Click Package Publisher

Push RPM/DEB packages to Linux Hardened repos from any machine.

### Install

```bash
mkdir -p ~/bin
curl -sL https://raw.githubusercontent.com/rushikeshsakharleofficial/rpm-repos/main/push-pkg -o ~/bin/push-pkg
chmod +x ~/bin/push-pkg
export PATH="$HOME/bin:$PATH"
```

### Usage

```bash
push-pkg mypackage.rpm    # Push to rpm.linuxhardened.com
push-pkg mypackage.deb    # Push to deb.linuxhardened.com
```

### Features

- Auto-clones repos if not present
- Auto-pulls latest changes before pushing
- Detects architecture from filename (fallback if `rpm` command unavailable)
- Generates directory index pages
- Updates repo metadata (createrepo_c / dpkg-scanpackages)
- Commits and pushes to GitHub

### Dependencies

**For RPM packages:**
```bash
sudo apt install createrepo-c git
```

**For DEB packages:**
```bash
sudo apt install dpkg-dev git
```

### How It Works

1. Detects package type (.rpm or .deb)
2. Extracts package name and architecture
3. Copies to correct directory (`packages/{arch}/{letter}/` for RPM, `pool/main/{letter}/` for DEB)
4. Updates repository metadata
5. Regenerates HTML index pages
6. Commits and pushes to GitHub
