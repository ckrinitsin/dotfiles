#!/usr/bin/bash

sudo pacman -S bluez bluez-utils

modprobe btusb

systemctl enable bluetooth.service
systemctl start bluetooth.service
