#!/usr/bin/bash


git clone https://aur.archlinux.org/yay.git /tmp/yay

cd /tmp/yay

makepkg -si

yay --version

rm -rf /tmp/yay
