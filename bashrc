if [ "${__BASHRC_SOURCED__}" != "1:$TMUX:$VIRTUAL_ENV" ];then
  # aliases
  alias ls='ls --color=auto'
  alias cronedit='crontab -e'
  alias cronlist='crontab -l'
  alias vi="vim -u /etc/vimrc --noplugin"
  alias ssh="ssh -A"
  alias pip="python3 -m pip"
  alias jnb="jupyter-notebook"

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

  # dircolors
  [ -f $HOME/.dircolors ] && eval $(dircolors $HOME/.dircolors -b)

  PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \[\033[00m\]\n[\d \t]\$ "

  if [ -f ${HOME}/etc/mintty-colors-solarized/sol.dark ];then
    source ${HOME}/etc/mintty-colors-solarized/sol.dark 
  fi

  if [ -f ${HOME}/etc/dircolors-solarized/dircolors.ansi-dark ];then
    eval `dircolors ${HOME}/etc/dircolors-solarized/dircolors.ansi-dark`
  fi

  # The next line enables shell command completion for gcloud.
  if [ -f "${HOME}/google-cloud-sdk/completion.bash.inc" ]; then
    source '/Users/mitsutani/google-cloud-sdk/completion.bash.inc';
  fi

  # >>> conda initialize >>>
  # !! Contents within this block are managed by 'conda init' !!
  __conda_setup="$('/home/mitsutani/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "/home/mitsutani/miniconda3/etc/profile.d/conda.sh" ]; then
          . "/home/mitsutani/miniconda3/etc/profile.d/conda.sh"
      else
          export PATH="/home/mitsutani/miniconda3/bin:$PATH"
      fi
  fi
  unset __conda_setup
  # <<< conda initialize <<<

  export __BASHRC_SOURCED__="1:${TMUX}:${VIRTUAL_ENV}"

  case $- in                                                                        
    *i*)                                                                              
      if [ ! -z "$(cd ${HOME}/dotfiles; git status -s)" ]; then
        echo "[info] you have something to do with dotfiles git repository"
      fi
      ;;                                                                            
  esac 

    # TMUX
  [ ! -z "$TMUX" ] && . $HOME/.bash_profile
fi



