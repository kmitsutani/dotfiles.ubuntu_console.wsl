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
  .bashrc_ssh_agent\
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
