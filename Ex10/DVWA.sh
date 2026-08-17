#!/usr/bin/env bash
#
# setup_dvwa.sh
# Installs Docker (if missing), starts the daemon, adds current user
# to the docker group, and runs the DVWA vulnerable-app container
# for the SQLi lab (Ex No. 9 / Ex No. 10).
#
# Usage:
#   chmod +x setup_dvwa.sh
#   ./setup_dvwa.sh
#
# Re-run any time to just start DVWA again once Docker is set up.

set -e

echo "==> Checking for Docker..."
if ! command -v docker &> /dev/null; then
    echo "==> Docker not found. Installing docker.io..."
    sudo apt update
    sudo apt install -y docker.io
else
    echo "==> Docker client found: $(docker --version)"
fi

echo "==> Ensuring Docker daemon is running..."
sudo systemctl start docker
sudo systemctl enable docker

echo "==> Checking docker group membership..."
if ! groups "$USER" | grep -q '\bdocker\b'; then
    echo "==> Adding $USER to the docker group..."
    sudo usermod -aG docker "$USER"
    NEED_RELOGIN=1
else
    NEED_RELOGIN=0
fi

if [ "$NEED_RELOGIN" -eq 1 ]; then
    echo ""
    echo "======================================================================"
    echo " You were just added to the 'docker' group."
    echo " This only takes effect after a fresh login session."
    echo " Please log out and log back in (or reboot), then re-run this script:"
    echo "     ./setup_dvwa.sh"
    echo "======================================================================"
    exit 0
fi

echo "==> Checking if port 80 is already in use..."
PORT=80
if sudo lsof -i :80 &> /dev/null; then
    echo "==> Port 80 is busy (likely Apache). Trying to stop apache2..."
    sudo systemctl stop apache2 2> /dev/null || true
    if sudo lsof -i :80 &> /dev/null; then
        echo "==> Port 80 still busy. Falling back to port 8080."
        PORT=8080
    fi
fi

echo "==> Starting DVWA container on port $PORT..."
echo "    Once running, open: http://localhost:$PORT/setup.php"
echo "    Press Ctrl+C in this terminal to stop DVWA."
echo ""

docker run --rm -it -p "$PORT":80 vulnerables/web-dvwa