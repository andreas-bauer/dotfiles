.PHONY: all
all: ohmyzsh ohmyzsh-plugins brew brew-min brew-font dotfiles

.PHONY: ohmyzsh
ohmyzsh: ## Install oh-my-zsh
	if [ ! -d ~/.oh-my-zsh ]; then \
		curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash; \
	fi;

.PHONY: ohmyzsh-plugins
ohmyzsh-plugins: ## Install oh-my-zsh plugins
	if [ ! -d "$(HOME)/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then \
		git clone https://github.com/zsh-users/zsh-autosuggestions $(HOME)/.oh-my-zsh/custom/plugins/zsh-autosuggestions; \
	fi;
	if [ ! -d "$(HOME)/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then \
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $(HOME)/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting; \
	fi;

.PHONY: brew
brew: ## Install brew
	if [ ! -d /opt/homebrew ]; then \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
	else \
		echo "Brew already installed."; \
	fi;

.PHONY: brew-min
brew-min: ## Install minimal dev setup via brew
	brew install git
	brew install git-delta
	brew install eza
	brew install fzf
	brew install zoxide
	brew install atuin
	brew install ghostty
	brew install neovim
	brew install starship
	brew install node

.PHONY: brew-font
brew-font: ## Install fonts via brew
	brew install --cask font-fontawesome

.PHONY: dotfiles
dotfiles: ## Link the dotfiles.
	if [ ! -d $(HOME)/.config ]; then \
		mkdir -p $(HOME)/.config; \
	fi;
	ln -sfn $(CURDIR)/zshrc $(HOME)/.zshrc;
	ln -sfn $(CURDIR)/zsh $(HOME)/.zsh;
	ln -sfn $(CURDIR)/gitconfig $(HOME)/.gitconfig;
	ln -sfn $(CURDIR)/gitignore $(HOME)/.gitignore;
	ln -sfn $(CURDIR)/doom.d $(HOME)/.doom.d;
	ln -sfn $(CURDIR)/ghostty $(HOME)/.config/ghostty;
	ln -sfn $(CURDIR)/nvim $(HOME)/.config/nvim;
	ln -sfn $(CURDIR)/starship.toml $(HOME)/.config/starship.toml;

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
