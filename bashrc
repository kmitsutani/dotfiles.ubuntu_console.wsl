if [ "${__BASHRC_SOURCED__}" != "1:$TMUX:$VIRTUAL_ENV" ];then
  # aliases
  if [ $(ls --help 2>&1 | grep GNU | wc -l) -gt 0 ]; then
      alias ls='ls --color=auto'
  else
      alias ls='ls -G'
  fi
  alias preview='open -a Preview'
  alias beep='afplay /System/Library/Sounds/Submarine.aiff'
  alias cronedit='crontab -e'
  alias cronlist='crontab -l'
  alias vi="vim -u /etc/vimrc --noplugin"
  alias cpan-uninstall='perl -MConfig -MExtUtils::Install -e '"'"'($FULLEXT=shift)=~s{-}{/}g;uninstall "$Config{sitear    chexp}/auto/$FULLEXT/.packlist",1'"'"
  alias sudoh="sudo -H"
  alias ssh="ssh -A"
  alias pip="python -m pip"
  alias jnb="jupyter-notebook"

  # shell functions
  function viewone(){
    if [ "$1" == "" ]; then
      echo "Usage: viewone path"
      return 0
    fi
    ls $1 | head -n 1 | xargs -I{} less {}
  }

  function hyperthumb(){
      sudo xkbcomp -I$HOME/.xkb/hyperthumb $HOME/.xkb/hyperthumb/keymap $DISPLAY
  }

  function reprofile(){
      source ~/.bash_profile
  }

  function use_miniconda2_ldpath(){
    export LD_LIBRARY_PATH=${HOME}/.miniconda2/lib
  }

  function use_miniconda3_ldpath(){
    export LD_LIBRARY_PATH=${HOME}/.miniconda3/lib
  }

  function ls_ssh_agents(){
    find /tmp -name "ssh*" -type d |\
      xargs -I{} find {} -name "agent*" -type s -print0 |\
      xargs -0 -I{} ls $@ {} 
  }

  # record time stamp to history
  HISTTIMEFORMAT='%Y-%m-%d %T '

  # osdep bashrc
  [ -f $HOME/.bashrc_osdep ] && . $HOME/.bashrc_osdep

  # machine dependent bashrc
  [ -f $HOME/.bashrc_machine ] && . $HOME/.bashrc_machine

  # dircolors
  [ -f $HOME/.dircolors ] && eval $(dircolors $HOME/.dircolors -b)

  # Pythonbrew
  [[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"

  export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \[\033[00m\]\n[\d \t]\$ "
  HISTTIMEFORMAT='200~%Y-%m-%d %T '

  export PATH="/home/ubuntu/miniconda3/bin:$PATH"

  if [ -f ${HOME}/etc/mintty-colors-solarized/sol.dark ];then
    source ${HOME}/etc/mintty-colors-solarized/sol.dark 
  fi

  if [ -f ${HOME}/etc/dircolors-solarized/dircolors.ansi-dark ];then
    eval `dircolors ${HOME}/etc/dircolors-solarized/dircolors.ansi-dark`
  fi

  export __BASHRC_SOURCED__="1:${TMUX}:${VIRTUAL_ENV}"

  # TMUX
  [ ! -z "$TMUX" ] && . $HOME/.bash_profile
fi

