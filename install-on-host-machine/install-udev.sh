#!/bin/bash
set -ex

sudo cp etc/udev/rules.d/* /etc/udev/rules.d/
sudo udevadm control --reload-rules
