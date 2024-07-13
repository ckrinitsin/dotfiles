#!/usr/bin/bash

git clone https://aur.archlinux.org/paru.git /tmp/paru

cd /tmp/paru

makepkg -si

paru --version

rm -rf /tmp/paru
