#!/bin/bash

unalias -a

if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
	export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
	colorflag="-G"
	export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi

# List
alias ls="ls --color"
alias l="eza --long --header --group-directories-first --color-scale size"
alias lg="eza --long --header --group-directories-first --color-scale size --git"
alias ll="eza --long --header --group-directories-first --color-scale size --git --all"

# Easier navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Terminal
alias c='clear'
alias q='exit'

# System Maintenance
alias upd='yay -Syyu && flatpak update'
alias p='sudo pacman --color auto'
alias progs="(pacman -Qet && pacman -Qm) | sort -u" # List programs I've installed
alias orphans="pacman -Qdt" # List orphan programs
alias sdn="sudo shutdown now"
alias mirrors="sudo reflector --score 100 --fastest 25 --sort rate --save /etc/pacman.d/mirrorlist --verbose"
alias buu="brew update && brew upgrade"

# show more then 16 history commands (macOS)
alias history="history 1"

# Make mount command readable
alias mount='mount |column -t'

# Important directories
alias dev='cd ~/dev'
alias dl="cd ~/Downloads"
alias wiki="Library/CloudStorage/OneDrive-BTH/sync/myWiki"

# Get week number
alias week='date +%V'

# Simple Python HTTP server
alias serve='python3 -m http.server'

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# GIT
alias gs='git status'
alias ga='git add '
alias gp='git push '
alias gb='git branch '
alias gc='git commit --verbose'
alias gca='git commit --amend'
alias gd='git diff'
alias gco='git checkout '
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gruf='git ls-files --other --exclude-standard | xargs rm -rf'
alias grh='git reset --hard HEAD'
#alias gbr='git branch | grep -v "master" | xargs git branch -D'

# git [f]uzzy check[o]ut
gfo() {
  git branch --no-color --sort=-committerdate --format='%(refname:short)' | fzf --header 'git checkout' | xargs git checkout
}

# VIM
alias vi='nvim'
alias v='fzf --multi --preview "bat -n --color=always {}" --bind "enter:become(nvim {+})"'
