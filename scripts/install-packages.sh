#!/usr/bin/bash

# install packages
sudo pacman -S bash-completion fzf grim pacman-contrib python-tldextract pass gnupg base-devel libnotify wl-clipboard qt6-wayland xorg-server-xwayland nerd-fonts zoxide waybar bison startup-notification flex wayland-protocols pkg-config cmake gcc alacritty dunst neovim qutebrowser starship xdg-user-dirs zathura zathura-pdf-mupdf meson ninja

sudo pacman -S pipewire pipewire-audio pipewire-alsa pipewire-pulse pavucontrol

sudo pacman -S texlive-basic texlive-bibtexextra texlive-latex texlive-mathscience texlive-latexrecommended texlive-latexextra texlive-binextra

yay -S grimshot

# install rofi and dmenu for wayland
git clone https://github.com/lbonn/rofi.git /tmp/rofi
cd /tmp/rofi
meson setup build
ninja -C build
sudo ninja -C build install
git clone https://git.sr.ht/~fabiancodes/dmenu-wayland /tmp/dmenu-wl
cd /tmp/dmenu-wl
mkdir build
meson build
ninja -C build
sudo ninja -C build install
cd && rm -rf /tmp/dmenu-wl /tmp/rofi
