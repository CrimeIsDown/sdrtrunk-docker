#!/bin/bash
set -ex

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

sudo cp "${SCRIPT_DIR}/etc/udev/rules.d/"* /etc/udev/rules.d/
sudo udevadm control --reload-rules
