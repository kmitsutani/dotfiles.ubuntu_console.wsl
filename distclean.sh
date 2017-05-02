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
wd=$(cd $(dirname $0); pwd)
cd $wd

rm $HOME/.bash_path
rm $HOME/.bash_profile
rm $HOME/.bashrc
rm $HOME/.bashrc_ssh_agent
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
