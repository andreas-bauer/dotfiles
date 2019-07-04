#!/bin/bash

unalias -a

# List 
alias ls='ls --color=auto'
alias ll='ls -l'
alias l.='ls -d .* --color=auto'
alias ll.='ls -la'
alias k='k -h --no-vcs'

# Easier navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# System Maintainence
alias upd='yay -Syyu && flatpak update'
alias p='sudo pacman --color auto'
alias t='trizen'
alias progs="(pacman -Qet && pacman -Qm) | sort -u" # List programs I've installed
alias orphans="pacman -Qdt" # List orphan programs
alias sdn="sudo shutdown now"
alias mirrors='sudo reflector --score 100 --fastest 25 --sort rate --save /etc/pacman.d/mirrorlist --verbose'
	
# Make mount command readable
alias mount='mount |column -t'

# Important Directories
alias dev='cd ~/dev'

# GIT
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit --verbose'
alias gd='git diff'
alias gco='git checkout '
alias gl='git log --graph --decorate --pretty=oneline --abbrev-commit'
