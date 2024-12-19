# Export own script path
export PATH=$HOME/.dotfiles/bin/:/usr/local/bin/:$PATH

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
alias :q="exit"
alias ..="cd .."
alias v="vim"
alias reload-gpg="gpg-connect-agent reloadagent /bye"
alias psa1="ssh -i ~/.ssh/psa -p 60501 ge87liq@psa.in.tum.de"
alias psa2="ssh -i ~/.ssh/psa -p 60502 ge87liq@psa.in.tum.de"
alias psa3="ssh -i ~/.ssh/psa -p 60503 ge87liq@psa.in.tum.de"
alias psa4="ssh -i ~/.ssh/psa -p 60504 ge87liq@psa.in.tum.de"
alias psa5="ssh -i ~/.ssh/psa -p 60505 ge87liq@psa.in.tum.de"
alias psa7="ssh -i ~/.ssh/psa -p 60507 ge87liq@psa.in.tum.de"

# Arrow bindings
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# Start programs
eval "$(starship init bash)"
eval "$(zoxide init --cmd='cd' bash)"
