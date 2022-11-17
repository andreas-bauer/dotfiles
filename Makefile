.PHONY: all
all: dotfiles zplug sdkman

.PHONY: zplug
zplug: ## Clone zplug into ~/.zplug if not exist.
	if [ ! -d ~/.zplug ]; then \
    	git clone https://github.com/zplug/zplug ~/.zplug; \
    fi;

.PHONY: sdkman
sdkman: ## Install SDKMAN
	if [ ! -d ~/.sdkman ]; then \
		curl -s "https://get.sdkman.io" | bash; \
	fi;

.PHONY: brew-min
brew-min: ## Install minimal dev setup via brew
	brew install git
	brew install exa
	brew install kitty
	brew install --cask keepassxc

.PHONY: dotfiles
dotfiles: ## Link the dotfiles.
	ln -sfn $(CURDIR)/vimrc $(HOME)/.vimrc;
	ln -sfn $(CURDIR)/zshrc $(HOME)/.zshrc;
	ln -sfn $(CURDIR)/zsh $(HOME)/.zsh;
	ln -sfn $(CURDIR)/gitconfig $(HOME)/.gitconfig;
	ln -sfn $(CURDIR)/gitignore $(HOME)/.gitignore;
	ln -sfn $(CURDIR)/doom.d $(HOME)/.doom.d;
	ln -sfn $(CURDIR)/kitty $(HOME)/.config/kitty;
	ln -sfn $(CURDIR)/nvim $(HOME)/.config/nvim;

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
