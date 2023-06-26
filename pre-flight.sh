#!/usr/bin/env bash
###################
# pre-flight.sh
###################

set -o errexit
set -o nounset
set -o pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

function log() {
  echo
  echo -e "➡ ${GREEN}${1}${NC}"
  echo
}

function log_success() {
  echo
  echo -e "✅ ${GREEN}${1}${NC}"
  echo
}

function log_warn() {
  echo
  echo -e "⚠️ ${YELLOW}${1}${NC}"
  echo
}

function log_error() {
  echo
  echo -e "⚠️ ${RED}ERROR: ${1}${NC}"
  echo
}

DOCKER_BOX_PATH="$HOME/localcloud"

log_sucess "Installing git..."

apt-get update -qq
apt-get -qqy install git

if [ ! -d "$DOCKER_BOX_PATH" ]; then
  log_sucess "Downloading localcloud..."
  git clone \
    --depth 1 \
    https://github.com/rneiva/localcloud \
    "$DOCKER_BOX_PATH"
fi

log_sucess "Updating localcloud..."
cd "$DOCKER_BOX_PATH"
git pull

log_sucess "Setting permissions to folder"
chown ubuntu:ubuntu -R "$DOCKER_BOX_PATH"
chmod +x *.sh

./install.sh
