.PHONY: all
all: dotfiles ohmyzsh ohmyzsh-plugins

.PHONY: ohmyzsh
ohmyzsh: ## Install oh-my-zsh
	if [ ! -d ~/.oh-my-zsh ]; then \
		curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash; \
	fi;

.PHONY: ohmyzsh-plugins
ohmyzsh-plugins: ## Install oh-my-zsh plugins
	git clone https://github.com/zsh-users/zsh-autosuggestions $(HOME)/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $(HOME)/.oh-my-zsh/custom/themes/powerlevel10k
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $(HOME)/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

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

.PHONY: brew-font
brew-font: ## Install fonts via brew
	brew tap homebrew/cask-fonts
	brew install --cask font-fontawesome

.PHONY: dotfiles
dotfiles: ## Link the dotfiles.
	ln -sfn $(CURDIR)/zshrc $(HOME)/.zshrc;
	ln -sfn $(CURDIR)/zsh $(HOME)/.zsh;
	ln -sfn $(CURDIR)/gitconfig $(HOME)/.gitconfig;
	ln -sfn $(CURDIR)/gitignore $(HOME)/.gitignore;
	ln -sfn $(CURDIR)/doom.d $(HOME)/.doom.d;
	ln -sfn $(CURDIR)/kitty $(HOME)/.config/kitty;
	ln -sfn $(CURDIR)/ghostty $(HOME)/.config/ghostty;
	ln -sfn $(CURDIR)/nvim $(HOME)/.config/nvim;
	ln -sfn $(CURDIR)/starship.toml $(HOME)/.config/starship.toml;

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
