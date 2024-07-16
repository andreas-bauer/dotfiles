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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/andi/dev/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/andi/dev/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/andi/dev/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/andi/dev/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/andi/.sdkman"
[[ -s "/Users/andi/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/andi/.sdkman/bin/sdkman-init.sh"

