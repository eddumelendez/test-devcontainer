#!/bin/sh
set -e

echo "Activating feature 'testcontainers-cloud'"

VERSION=${VERSION:-undefined}
echo "The provided version is: $VERSION"

tee -a /usr/local/share/testcontainerscloud-init.sh > /dev/null \
<< 'EOF'

LATEST_BINARY_URL="https://app.testcontainers.cloud/download/testcontainers-cloud-agent_${VERSION}_linux_x86-64"

curl -fsSL -o /usr/local/share/tcc "${LATEST_BINARY_URL}"
chmod +x /usr/local/share/tcc
chown root:root /usr/local/share/tcc

EOF

chmod +x /usr/local/share/testcontainerscloud-init.sh
chown root:root /usr/local/share/testcontainerscloud-init.sh

echo "Testcontainers Cloud setup has completed!"
