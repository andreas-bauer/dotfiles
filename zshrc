# Exports
export TERM="xterm-256color"
export LANG="en_US.UTF-8"
export EDITOR=vim
export JAVA_HOME=/usr/lib/jvm/default/
export GOPATH=$HOME/dev/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin

setopt auto_cd

source ~/.zplug/init.zsh
zplug "zplug/zplug", hook-build:'zplug --self-manage'

zplug "mafredri/zsh-async"
zplug "zsh-users/zsh-completions"

zplug "tarruda/zsh-autosuggestions",            defer:0
zplug "zsh-users/zsh-syntax-highlighting",      defer:1
zplug "zsh-users/zsh-history-substring-search", defer:2

zplug "supercrabtree/k"
zplug "sindresorhus/pure"

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

# Tilix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
	source /etc/profile.d/vte.sh
fi

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
fi

# Expand aliases
expand-alias-space() {
    zle _expand_alias
    zle self-insert
}
zle -N expand-alias-space

# Key bindings
bindkey " " expand-alias-space

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/andi/.sdkman"
[[ -s "/home/andi/.sdkman/bin/sdkman-init.sh" ]] && source "/home/andi/.sdkman/bin/sdkman-init.sh"
