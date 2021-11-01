#!/bin/sh

set -o errexit
set -o errtrace
set -o nounset
set -o pipefail

exists ()
{
  command -v "$1" > /dev/null 2>&1
}

if ! exists brew; then
  echo "Installing homebrew"
  # Install homebrew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! exists brew; then
    echo "Installing ansible via brew"
    brew install ansible
fi

echo "Machine is ready to run playbooks"
