#!/usr/bin/bash

# list of all needed pacman packages
declare -a pacman=("bash-completion" "fzf" "grim" "pacman-contrib" "sway-contrib" "python-tldextract" "pass" "gnupg" "base-devel" "libnotify" "wl-clipboard" "qt6-wayland" "xorg-xwayland" "nerd-fonts" "zoxide" "waybar" "bison" "startup-notification" "flex" "wayland-protocols" "pkgconf" "cmake" "gcc" "alacritty" "dunst" "neovim" "qutebrowser" "starship" "xdg-user-dirs" "zathura" "zathura-pdf-mupdf" "meson" "ninja" "inotify-tools" "pipewire" "pipewire-audio" "pipewire-alsa" "pipewire-pulse" "pavucontrol" "texlive-basic" "texlive-bibtexextra" "texlive-latex" "texlive-mathscience" "texlive-latexrecommended" "texlive-latexextra" "texlive-binextra")

# list of all needed aur packages
declare -a aur=()

for package in "${pacman[@]}"
do
    pacman -Q | grep "$package" 1>/dev/null
    if [ $? != 0 ]; then
        printf "Installing '$package'\n"
        sudo pacman -S "$package"
    else
        printf "'$package' is already installed\n"
    fi
done

for package in "${aur[@]}"
do
    pacman -Q | grep "$package" 1>/dev/null
    if [ $? != 0 ]; then
        printf "Installing '$package'\n"
        sudo pacman -S "$package"
    else
        printf "'$package' is already installed\n"
    fi
done
exit

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
