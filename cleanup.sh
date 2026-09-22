#!/bin/sh
set -x
sudo nix-collect-garbage --delete-older-than 10d
sudo nix-store --optimise
./rebuild-switch.sh
