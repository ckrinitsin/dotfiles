# Export own script path
export PATH=$HOME/.dotfiles/bin/:/usr/local/bin/:$PATH
export GOPATH=$HOME/.go
export EDITOR='nvim'
export MANPAGER='nvim +Man!'
export PS1="\n\e[1;32m[\u@\h:\w]\$ \e[0m"

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
alias zeit-im="zeit import ~/.local/share/zeit-backup/backup"
alias zeit-ex="zeit export -b -f json > ~/.local/share/zeit-backup/backup"

# Start programs
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init --cmd='cd' bash)"
fi

if [[ -f ~/.bash-preexec.sh ]]; then
    source ~/.bash-preexec.sh
    eval "$(atuin init bash)"
fi
