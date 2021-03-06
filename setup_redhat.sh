#!/bin/sh

cd
# install zsh {{{
sudo yum -y install zsh
sudo usermod -s /bin/zsh root
sudo usermod -s /bin/zsh vagrant
# }}}

# install git {{{
cd
sudo yum -y install curl-devel expat-devel gettext-devel openssl-devel zlib-devel
sudo yum -y install gcc
sudo yum -y install cpan
mkdir ProgramFiles
cd ProgramFiles
sudo wget https://www.kernel.org/pub/software/scm/git/git-2.9.5.tar.gz
sudo tar -zxf git-2.9.5.tar.gz
sudo rm -rf git-2.9.5.tar.gz
cd git-2.9.5
make prefix=/usr/local all
sudo make prefix=/usr/local install
# }}}

# git setting {{{
git config --global user.name "satokibi"
git config --global user.email td182007@cis.fukuoka-u.ac.jp
git config --global color.ui true
git config --global core.editor 'vim -c "set fenc=utf-8"'
# }}}

# install vim {{{
cd
sudo yum -y install mercurial ncurses-devel make
cd /usr/local/src
sudo hg clone https://bitbucket.org/vim-mirror/vim vim
cd vim
sudo ./configure --with-features=huge --enable-multibyte --disable-selinux
sudo make
sudo make install
# }}}

# setup dotfiles {{{
cd
sudo yum -y update nss
git clone https://github.com/satokibi/dotfiles.git
cd dotfiles
./setup.sh
# }}}

# install node.js {{{
curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash -
sudo yum -y install nodejs
# }}}

# install jdk {{{
sudo yum -y install java-1.8.0-openjdk-devel
# }}}

# install python3.6 {{{
sudo yum install -y https://centos6.iuscommunity.org/ius-release.rpm
sudo yum install -y python36u python36u-libs python36u-devel python36u-pip
sudo ln -s /usr/bin/python3.6 /usr/bin/python3
sudo ln -s /usr/bin/pip3.6 /usr/bin/pip3
# }}}

# install tmux {{{
cd /usr/local/src
sudo wget https://github.com/tmux/tmux/releases/download/2.7/tmux-2.7.tar.gz
sudo tar -xvf tmux-2.7.tar.gz
sudo rm -rf tmux-2.7.tar.gz
cd tmux-2.7
sudo yum -y remove libevent libevent-devel libevent-headers
sudo yum -y install libevent2-devel
sudo ./configure && sudo make
sudo make install
# }}}

# install mysql {{{
sudo yum -y install http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm
sudo yum -y install mysql mysql-devel mysql-server mysql-utilities
sudo chkconfig mysqld on
# }}}

# install httpd {{{
sudo yum -y install httpd
sudo service httpd start
sudo chkconfig httpd on
sudo service iptables stop
sudo chkconfig iptables off
# }}}

# install ruby {{{
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
~/.rbenv/bin/rbenv init
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
sudo yum install -y readline-devel
# }}}

# install python-pillow {{{
sudo pip3 install pillow
# }}}

# install numpy {{{
sudo pip3 install numpy
# }}}

# install matplotlib {{{
sudo pip3 install matplotlib
# }}}

# install opencv {{{
sudo pip3 install opencv-python
# }}}
