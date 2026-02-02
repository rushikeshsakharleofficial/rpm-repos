#!/bin/bash
# One-click setup and push for Linux Hardened repos
# Usage: curl -sL https://rpm.linuxhardened.com/setup-and-push.sh | bash -s <package1> <package2> ...

set -e

GITHUB_USER="rushikeshsakharleofficial"
RPM_REPO="$HOME/rpm-repos"
DEB_REPO="$HOME/deb-repos"

# Install dependencies
echo "📦 Installing dependencies..."
if command -v apt >/dev/null; then
    sudo apt install -y createrepo-c rpm dpkg-dev git >/dev/null 2>&1
elif command -v dnf >/dev/null; then
    sudo dnf install -y createrepo_c rpm-build dpkg git >/dev/null 2>&1
fi

# Clone repos if not exists
echo "📂 Setting up repositories..."
[ ! -d "$RPM_REPO" ] && git clone https://github.com/$GITHUB_USER/rpm-repos.git "$RPM_REPO"
[ ! -d "$DEB_REPO" ] && git clone https://github.com/$GITHUB_USER/deb-repos.git "$DEB_REPO"

# Download push-pkg
mkdir -p ~/bin
curl -sL https://raw.githubusercontent.com/$GITHUB_USER/rpm-repos/main/push-pkg -o ~/bin/push-pkg
chmod +x ~/bin/push-pkg

# Push packages
for pkg in "$@"; do
    if [ -f "$pkg" ]; then
        echo ""
        ~/bin/push-pkg "$pkg"
    else
        echo "⚠️  File not found: $pkg"
    fi
done

echo ""
echo "✅ Setup complete! Use: ~/bin/push-pkg <package>"
