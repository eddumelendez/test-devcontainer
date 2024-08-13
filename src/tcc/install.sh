#!/bin/sh
set -e

echo "Activating feature 'testcontainers-cloud'"

# determine tcc version
VERSION=${VERSION:-undefined}
echo "The provided version is: $VERSION"

# determine the os for the agent
platform="$(uname -s)"
case "${platform}" in
    Linux*)     OS_TYPE=linux;;
    Darwin*)    OS_TYPE=darwin;;
    *)          say "${r}This script doesn't know how to deal with${x} ${platform} ${r}os type!${x}"; exit 1
esac

# determine the architecture of the platform
arch="$(uname -m)"
case "${arch}" in
    aarch64*)  ARCH_TYPE=arm64;;
    arm64*)    ARCH_TYPE=arm64;;
    *)         ARCH_TYPE=x86-64;;
esac

LATEST_BINARY_URL="https://app.testcontainers.cloud/download/testcontainers-cloud-agent_${VERSION}_${OS_TYPE}_${ARCH_TYPE}"

echo "Downloading ${LATEST_BINARY_URL}"
curl -fsSL -o /usr/local/share/tcc-agent ${LATEST_BINARY_URL}
chmod +x /usr/local/share/tcc-agent
chown root:root /usr/local/share/tcc-agent
