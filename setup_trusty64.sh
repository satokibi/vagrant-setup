#!/bin/sh

cd
# install zsh {{{
sudo apt update
sudo apt install zsh -y

which zsh
chsh
# }}}

# install tmux {{{
sudo apt update
sudo apt install -y build-essential automake libevent-dev ncurses-dev
mkdir -p $HOME/src
mkdir -p $HOME/bin
cd $HOME/src && git clone git@github.com:tmux/tmux.git
cd $HOME/src/tmux && sh autogen.sh && ./configure && make 
cp $HOME/src/tmux/tmux $HOME/bin/
echo 'export PATH=$HOME/bin:$PATH' >> $HOME/.zshrc
source $HOME/.zshrc
# }}}

# git setting {{{
git config --global user.name "satokibi"
git config --global user.email td182007@cis.fukuoka-u.ac.jp
git config --global color.ui true
git config --global core.editor 'vim -c "set fenc=utf-8"'
# }}}
