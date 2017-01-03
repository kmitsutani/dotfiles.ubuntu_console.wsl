#!/usr/bin/env bash
wd=$(cd $(dirname $0); pwd)
cd $wd

# bash
ln -s $wd/bash_path $HOME/.bash_path
<<<<<<< HEAD
ln -s $wd/profile_linux $HOME/.profile_osdep
=======
ln -s $wd/bashrc_linux $HOME/.bashrc_osdep
>>>>>>> 9fd631025cf96bb768b6796782bf81ce4a982fa6
ln -s $wd/bash_profile $HOME/.bash_profile

ln -s $wd/bashrc_ssh_agent $HOME/.bashrc_ssh_agent
if [ -f $HOME/.bashrc ]; then
  mv $HOME/.bashrc $HOME/.bashrc_old
  ln -s $wd/bashrc $HOME/.bashrc
else
  ln -s $wd/bashrc $HOME/.bashrc
fi

# vim
ln -s $wd/vimrc $HOME/.vimrc
ln -s $wd/vimrc_dein $HOME/.vimrc_dein
[ ! -d $HOME/.vim/rc ] && mkdir -p $HOME/.vim/rc
ln -s $wd/vim/rc/dein.toml $HOME/.vim/rc/dein.toml
ln -s $wd/vim/rc/dein_lazy.toml $HOME/.vim/rc/dein_lazy.toml

# ssh_config
[ ! -d $HOME/.ssh ] && mkdir -p $HOME/.ssh
ln -s $wd/ssh_config $HOME/.ssh/config
chmod 600 $HOME/.ssh/config

# tmux
ln -s $wd/tmux.conf $HOME/.tmux.conf
[ ! -d $HOME/.tmux ] && mkdir -p $HOME/.tmux
_tmuxver=$(tmux -V | sed -e 's/[^0-9.]//g')
if [ $(bc <<< "$_tmuxver > 2.0") -ne 0 ]; then
  ln -s $wd/tmux/mouse-after-2.1.conf $HOME/.tmux/mouse.conf
else
  ln -s $wd/tmux/mouse-before-2.0.conf $HOME/.tmux/mouse.conf
fi
unset _tmuxver

# xkb (for X11)
if [ -d /etc/X11 ]; then
  ln -s $wd/xkb $HOME/.xkb
  echo "use $HOME/.xkb/activate as launcher of setting"
fi

