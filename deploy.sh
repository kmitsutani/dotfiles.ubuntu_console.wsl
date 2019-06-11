#!/usr/bin/env bash
wd=$(cd $(dirname $0); pwd)
cd $wd

sudo apt-get install bc git tmux

_lndot(){
  line=$1  
  src_dist=($(sed -e "s/:/ /" <<< $line))
  src=${src_dist[0]}
  dist=${src_dist[1]}
  if [ "$dist" == "" ]
  then
    dist=".$src"
  fi
  fullsrc=$wd/$src
  fulldist=$HOME/$dist
  if [ -f $fulldist ]
  then
    mv $fulldist $fulldist.old
  fi
  echo ln -s $fullsrc $fulldist
  ln -s $fullsrc $fulldist
}

src_notfound=0
cat srcdist.txt|\
while read line
do
  [ "$line" == "" ] && continue
  [[ "$line" =~ ^# ]] && continue
  [[ "$line" =~ ^@ ]] && continue
  src=$(echo $line | cut -f 1 -d :)
  if [ ! -f $wd/$src ] && [ ! -d $wd/$src ]; then
    echo "$wd/$src is not found"
    src_notfound=1
  fi
done
if [ ${src_notfound} -gt 0 ]; then
  "some files not found."
  exit 0
fi

cat srcdist.txt|\
while read line
do
  [ "$line" == "" ] && continue
  [[ "$line" =~ ^# ]] && continue
  # @-line
  if [[ "$line" =~ ^@ ]];
  then
    key_val=($(sed -e "s/=/ /" <<< $line))
    key=${key_val[0]}
    vals=($(sed -e "s/:/ /" <<< ${key_val[1]}))
    case $key in
      '@reqcmd' )
        for cmd in ${vals[@]}
        do
          if [ $(which $cmd | wc -l) -eq 0 ]; then
            echo "$cmd not found"
            exit 0
          fi
        done
        ;;
      '@reqdir' )
        for dir in ${vals[@]}
        do
          [ ! -d $HOME/$dir ] && mkdir -p $HOME/$dir
        done
        ;;
    esac
  else
    _lndot $line
  fi
done

# cp ssh_config
cp $wd/ssh_config $HOME/.ssh/config
# change permission of ssh_config
chmod 600 $HOME/.ssh/config

# tmux-plugins
if [ ! -d $HOME/.tmux/plugins ]; then
  mkdir -p $HOME/.tmux/plugins
fi
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
[ ! -d $HOME/.tmux ] && mkdir -p $HOME/.tmux
_tmuxver=$(tmux -V | sed -e 's/[^0-9.]//g')
if [ $(bc <<< "$_tmuxver > 2.0") -ne 0 ]; then
  ln -sf $wd/tmux/mouse-after-2.1.conf $HOME/.tmux/mouse.conf
else
  ln -sf $wd/tmux/mouse-before-2.0.conf $HOME/.tmux/mouse.conf
fi
unset _tmuxver

# xkb (for X11)
if [ -d /etc/X11 ]; then
  echo "use $HOME/.xkb/activate as launcher of setting"
fi

