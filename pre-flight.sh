#!/usr/bin/env bash
###################
# pre-flight.sh
###################

set -o errexit
set -o nounset
set -o pipefail

GREEN='\033[0;32m'
NC='\033[0m'
DOCKER_BOX_PATH="$HOME/localcloud"

function log() {
  echo
  echo -e "➡ ${GREEN}${1}${NC}"
  echo
}

log "Installing git..."

apt-get update -qq
apt-get -qqy install git

if [ ! -d "$DOCKER_BOX_PATH" ]; then
  log "Downloading localcloud..."
  git clone \
    --depth 1 \
    https://github.com/rneiva/localcloud \
    "$DOCKER_BOX_PATH"
fi

log "Updating localcloud..."
cd "$DOCKER_BOX_PATH"
git pull

sudo ./install.sh