# Exports
export TERM="xterm-256color"
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR=nvim
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin
export PATH="/opt/homebrew/bin:${PATH}"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

zstyle ':omz:update' mode auto # update automatically without asking
zstyle ':omz:update' frequency 13

plugins=(git zsh-autosuggestions fzf sudo globalias zsh-syntax-highlighting)

# Load Configs
source $ZSH/oh-my-zsh.sh
for config (~/.zsh/*.zsh) source $config

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"

