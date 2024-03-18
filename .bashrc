# Export own script path
export PATH=/usr/local/bin/:$HOME/.dotfiles/bin/:$PATH

# Aliases
alias ls='ls --color=auto'
alias la='ls -lav --ignore=..'
alias vim="nvim"
alias lg="lazygit"
alias pgl="pass git pull"
alias pgs="pass git push"
alias spt="spotify_player -d"
alias swconf="nvim ~/.config/sway/config"
alias sandisk="sudo mount /dev/sda1 /mnt/sandisk && cd /mnt/sandisk/"
alias fd='cd "$(find ~/documents/ ~/downloads/ ~/.config/ ~/uni/ -type d | fzf -i)"'
alias :q="exit"
alias ..="cd .."
alias v="vim"

# Arrow bindings
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# Start programs
eval "$(starship init bash)"
eval "$(zoxide init --cmd='cd' bash)"

# Navtag
#source /home/chris/.scripts/navtag/commands.sh
