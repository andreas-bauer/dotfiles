# Dotfiles

### My personal dotfiles

## Installation

First, clone the repository:

```console
git clone git@github.com:andreas-bauer/dotfiles.git ~/.dotfiles
```

The installation of dependencies and linking of symlinks is done via a Makefile.
If you run `make` without any arguments it will install and link all dependencies and configs.

```console
$ cd ~/.dotfiles
$ make
```

For a selective installation of dependencies and configs, run `make help` to see a list of all options.

```console
$ make help

brew-font                      Install fonts via brew
brew-min                       Install minimal dev setup via brew
dotfiles                       Link the dotfiles.
ohmyzsh-plugins                Install oh-my-zsh plugins
ohmyzsh                        Install oh-my-zsh
sdkman                         Install SDKMAN
```

## Thanks to and inspired by

- [Jess Frazelle](https://blog.jessfraz.com/) and her [dotfiles](https://github.com/jessfraz/dotfiles)
- [Mathias Bynens](https://mathiasbynens.be/) and his [dotfiles](https://github.com/mathiasbynens/dotfiles)
- [Michael Peter](https://github.com/Allaman) and his [NVIM config](https://github.com/Allaman/nvim)
- [Josean Martinez](https://github.com/josean-dev) and his [dotfiles](https://github.com/josean-dev/dev-environment-files/tree/main)

## License

Copyright (c) 2019-2025 Andreas Bauer

Licensed under the [MIT license](LICENSE).
