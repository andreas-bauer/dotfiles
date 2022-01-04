# Exports
export TERM="xterm-256color"
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR=vim
export PATH=$PATH:/usr/local/go/bin

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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/andi/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/andi/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/andi/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/andi/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/andi/.sdkman"
[[ -s "/Users/andi/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/andi/.sdkman/bin/sdkman-init.sh"

