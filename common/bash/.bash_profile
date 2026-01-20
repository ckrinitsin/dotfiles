#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ] && [ -z "$NIRI_LOADED" ]; then
	# exec dbus-run-session sway
    export NIRI_LOADED=1
    exec niri-session
fi
