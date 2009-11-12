#!/bin/sh

# install needed Arch packages
pacman -Sy setuptools mercurial pymacs pyflakes

cd /tmp

# fetch sources
hg clone http://bitbucket.org/agr/rope
hg clone http://bitbucket.org/agr/ropemacs
hg clone http://bitbucket.org/agr/ropemode

# install rope
sudo easy_install rope

# install ropemacs
ln -s ../ropemode/ropemode ropemacs/

sudo easy_install ropemacs

# clean up
sudo rm -rf rope ropemacs ropemode

