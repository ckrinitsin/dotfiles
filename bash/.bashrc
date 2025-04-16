# Export own script path
export PATH=$HOME/.dotfiles/bin/:/usr/local/bin/:$PATH

# Aliases
alias ls='ls --color=auto'
alias la='ls -lav --ignore=..'
alias vim="nvim"
alias lg="lazygit"
alias pgl="pass git pull"
alias pgs="pass git push"
alias swconf="nvim ~/.config/sway/config"
alias sandisk="sudo mount /dev/sda1 /mnt/sandisk && cd /mnt/sandisk/"
alias :q="exit"
alias ..="cd .."
alias v="vim"
alias reload-gpg="gpg-connect-agent reloadagent /bye"

# Arrow bindings
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# Start programs
eval "$(starship init bash)"
eval "$(zoxide init --cmd='cd' bash)"

if [[ -f ~/.bash-preexec.sh ]]; then
    source ~/.bash-preexec.sh
    eval "$(atuin init bash)"
fi
