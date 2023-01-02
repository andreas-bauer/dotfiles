# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Exports
export TERM="xterm-256color"
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR=nvim
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin
export PATH="/opt/homebrew/bin:${PATH}"

setopt auto_cd

source ~/.zplug/init.zsh
zplug "zplug/zplug", hook-build:'zplug --self-manage'

zplug "mafredri/zsh-async"
zplug "zsh-users/zsh-completions"

zplug "tarruda/zsh-autosuggestions",            defer:0
zplug "zsh-users/zsh-syntax-highlighting",      defer:1
zplug "zsh-users/zsh-history-substring-search", defer:2

zplug "romkatv/powerlevel10k", use:powerlevel10k.zsh-theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# Load Configs
for config (~/.zsh/*.zsh) source $config

if zplug check zsh-users/zsh-autosuggestions; then
    ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(history-substring-search-up history-substring-search-down)
    ZSH_AUTOSUGGEST_CLEAR_WIDGETS=("${(@)ZSH_AUTOSUGGEST_CLEAR_WIDGETS:#(up|down)-line-or-history}")
fi

KEYTIMEOUT=1
bindkey -v

if zplug check zsh-users/zsh-history-substring-search; then
  #  bindkey '\eOA' history-substring-search-up
  #  bindkey '\eOB' history-substring-search-down

    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down

    bindkey '^[j' history-substring-search-up
    bindkey '^[k' history-substring-search-down
fi

# Expand aliases
expand-alias-space() {
    zle _expand_alias
    zle self-insert
}
zle -N expand-alias-space

# Key bindings
bindkey " " expand-alias-space

# fzf
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_ALT_C_COMMAND='fd --type d --follow'
bindkey 'ƒ' fzf-cd-widget #<ALT>+f
bindkey '†' fzf-file-widget #<ALT>+t
bindkey '®' fzf-history-widget # <ALT>+r

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

