#!/usr/bin/env bash
wd=$(cd $(dirname $0); pwd)
cd $wd

rm $HOME/.bash_profile_path
rm $HOME/.bash_profile
rm $HOME/.bashrc
rm $HOME/.profile_ssh_agent
rm $HOME/.vimrc
rm $HOME/.vimrc_dein
rm $HOME/.vim/rc/dein.toml
rm $HOME/.vim/rc/dein_lazy.toml
rmdir $HOME/.vim/rc
rmdir $HOME/.vim
rm $HOME/.ssh/config
rm $HOME/.tmux.conf
rm $HOME/.tmux/mouse.conf
rm -rf $HOME/.xkb
