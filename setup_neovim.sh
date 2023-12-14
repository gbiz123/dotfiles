#!/bin/bash

# fedora
# sudo dnf install neovim
# sudo dnf install the_silver_searcher

# Get fonts
# sudo mkdir /usr/share/fonts/jetbrains-mono
# curl https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip -O
# sudo unzip JetBrainsMono.zip -d /usr/share/fonts/jetbrains-mono/

curl -sL install-node.vercel.app/lts | bash

cd $HOME
mkdir -p $HOME/.config/nvim/ftplugin
mkdir -p $HOME/.config/nvim/lua
mkdir -p $HOME/.local/share/nvim/site/pack/plugin/start/

# Highlightedyank
git clone https://github.com/machakann/vim-highlightedyank $HOME/.local/share/nvim/site/pack/plugin/start/vim-highlightedyank

# autoclose
git clone https://github.com/m4xshen/autoclose.nvim $HOME/.local/share/nvim/site/pack/plugin/start/autoclose.nvim


# Telescope
git clone https://github.com/nvim-telescope/telescope.nvim $HOME/.local/share/nvim/site/pack/plugin/start/telescope.nvim
git clone https://github.com/nvim-lua/plenary.nvim $HOME/.local/share/nvim/site/pack/plugin/start/plenary.nvim

# PlantUML previewer
git clone https://github.com/weirongxu/plantuml-previewer.vim $HOME/.local/share/nvim/site/pack/plugin/start/plantuml-previewer.vim

# Open browser
git clone https://github.com/tyru/open-browser.vim $HOME/.local/share/nvim/site/pack/plugin/start/open-browser.vim

# PlantUML syntax
git clone https://github.com/aklt/plantuml-syntax $HOME/.local/share/nvim/site/pack/plugin/start/plantuml-syntax

# Web icons
git clone https://github.com/nvim-tree/nvim-web-devicons $HOME/.local/share/nvim/site/pack/plugin/start/nvim-web-devicons

# Ale
git clone https://github.com/dense-analysis/ale $HOME/.local/share/nvim/site/pack/plugin/start/ale

# Colorscheme
git clone https://github.com/AlexvZyl/nordic.nvim $HOME/.local/share/nvim/site/pack/plugin/start/nordic.nvim

# Any-jump
git clone https://github.com/pechorin/any-jump.vim $HOME/.local/share/nvim/site/pack/plugin/start/any-jump.vim

# init.vim
curl -o $HOME/.config/nvim/init.vim https://raw.githubusercontent.com/gbiz123/dotfiles/main/init.vim

# Filetype plugins
curl -o $HOME/.config/nvim/ftplugin/java_getset.vim https://raw.githubusercontent.com/vim-scripts/java_getset.vim/master/plugin/java_getset.vim

# nvim-tree
git clone https://github.com/nvim-tree/nvim-tree.lua ./nvim-tree.lua
mv nvim-tree.lua/lua/* $HOME/.config/nvim/lua
rm -rf nvim-tree.lua
