#!/usr/bin/env bash
function rmifexists(){
  file=$1
  if [ -f $file ]; then
    mv $file $file.old
  fi
}


files=("\
  .bash_path\
  .bashrc_osdep\
  .bash_profile\
  .ssh_profile\
  .bashrc\
  .vimrc\
  .vimrc_dein\
  .vim/rc/dein.toml\
  .vim/rc/dein_lazy.toml\
  .ssh/config\
  .tmux.conf\
  .tmux/mouse.conf\
")

for file in ${files[@]};
do
  rmifexists $HOME/$file
done
wd=$(cd $(dirname $0); pwd)
cd $wd

rm $HOME/.bash_path
rm $HOME/.bash_profile_path
rm $HOME/.bash_profile
rm $HOME/.bashrc_osdep
rm $HOME/.bashrc
rm $HOME/.ssh_profile
rm $HOME/.profile_ssh_agent
rm $HOME/.vimrc
rm $HOME/.vimrc_dein
rm $HOME/.vim/rc/dein.toml
rm $HOME/.vim/rc/dein_lazy.toml
rm -rf $HOME/.vim/rc
rm -rf $HOME/.vim
rm $HOME/.ssh/config
rm $HOME/.tmux.conf
rm $HOME/.tmux/mouse.conf
rm -rf $HOME/.xkb
