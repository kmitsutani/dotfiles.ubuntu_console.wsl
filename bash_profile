if [ "${__BASH_PROFILE_SOURCED__}" != "1:$TMUX:$VIRTUAL_ENV" ];then
  ## add given path to PATH
  . $HOME/.bash_profile_path

  export XDG_CONFIG_HOME=$HOME/.config

  export LANG=en_US.UTF-8
  # configure miscellaneous environmental vaiables
  export EDITOR=vim

  # LL module/package paths
  if [ $(which pyenv | wc -l) -eq 0 ]; then
    pythonpath_global=$(find /usr/local/lib -maxdepth 1 -type d -name "python3.*"|\
                        xargs -I{} find {} -name "*-packages" -maxdepth 1 | tr '\n' ':')
    pythonpath_local=$(find $HOME/.local/lib -maxdepth 1 -type d -name "python3.*"|\
                        xargs -I{} find {} -name "*-packages" -maxdepth 1 | tr '\n' ':')
    PYTHONPATH=${pythonpath_global}:${pythonpath_local}
    export PYTHONPATH
  fi

  # pkgconfig
  export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

  # library specific
  export MPTK_CONFIG_FILENAME=/usr/local/mptk/path.xml


  find $HOME/.ssh -xtype l | xargs -I{} rm {}

  # ssh
  . $HOME/.ssh_profile


  # virtualenv wrapper
  if [ -f "$(which virtualenvwrapper.sh)" ]; then
      export WORKON_HOME=$HOME/.virtualenvs
      source $(which virtualenvwrapper.sh)
  fi

  test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

  if [ ! -z "$(cd ${HOME}/dotfiles; git status -s)" ]; then
    echo "you have something to do with dotfiles git repository"
  fi

  export __BASH_PROFILE_SOURCED__="1:${TMUX}:${VIRTUAL_ENV}"
fi

if [ -f $HOME/.profile ]; then
  . $HOME/.profile
fi
