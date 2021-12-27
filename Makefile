.PHONY: all
all: dotfiles zplug

.PHONY: zplug
zplug: ## Clone zplug into ~/.zplug if not exist.
	if [ ! -d ~/.zplug ]; then \
    	git clone https://github.com/zplug/zplug ~/.zplug; \
    fi;

.PHONY: dotfiles
dotfiles: ## Link the dotfiles.
	ln -sfn $(CURDIR)/vimrc $(HOME)/.vimrc;
	ln -sfn $(CURDIR)/zshrc $(HOME)/.zshrc;
	ln -sfn $(CURDIR)/zsh $(HOME)/.zsh;
	ln -sfn $(CURDIR)/gitconfig $(HOME)/.gitconfig;
	ln -sfn $(CURDIR)/gitignore $(HOME)/.gitignore;
	ln -sfn $(CURDIR)/doom.d $(HOME)/.doom.d;

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
