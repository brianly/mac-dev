#!/bin/sh

set -o errexit
set -o errtrace
set -o nounset
set -o pipefail

exists ()
{
  command -v "$1" > /dev/null 2>&1
}

if ! exists pip; then
  echo "Installing pip"
  sudo easy_install --quiet pip
fi

if ! exists ansible; then
  echo "Installing ansible"
  pip install --quiet --upgrade setuptools --user python
  sudo pip install --quiet ansible
fi

ANSIBLE_NOCOWS=1 ansible-playbook $USER.yml --inventory-file inventory --ask-become-pass
