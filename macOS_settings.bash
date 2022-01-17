#!/bin/bash

# Speed up dock animation
defaults write com.apple.dock autohide-time-modifier -int 0;killall Dock

# Stop creating .DS_Store files on shared network drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE

