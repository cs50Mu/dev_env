#!/bin/bash
#########################################################################
# Author: (linuxfish@domob.cn)
# Created Time: 2019-01-15 11:22:41
# File Name: install_plugins.sh
# Description: 
#########################################################################

# tmux plugins
git clone https://github.com/tmux-plugins/tpm /root/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tmux-continuum /root/.tmux/plugins/tmux-continuum
git clone https://github.com/tmux-plugins/tmux-resurrect /root/.tmux/plugins/tmux-resurrect
git clone https://github.com/tmux-plugins/tmux-sensible /root/.tmux/plugins/tmux-sensible

# vim plugins
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
# ale.vim ctrlp.vim     python-syntax supertab      tagbar        vim-go        vim-obsession vim-repeat    vim-surround
git clone https://github.com/w0rp/ale.git /root/.vim/bundle/ale
git clone https://github.com/ctrlpvim/ctrlp.vim.git /root/.vim/bundle/ctrlp.vim
git clone https://github.com/hdima/python-syntax.git /root/.vim/bundle/python-syntax
git clone https://github.com/ervandew/supertab.git /root/.vim/bundle/supertab
git clone https://github.com/majutsushi/tagbar.git /root/.vim/bundle/tagbar
git clone https://github.com/fatih/vim-go.git /root/.vim/bundle/vim-go
git clone https://github.com/tpope/vim-repeat.git /root/.vim/bundle/vim-repeat
git clone https://github.com/tpope/vim-surround.git /root/.vim/bundle/vim-surround
