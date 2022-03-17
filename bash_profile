if [ "${__BASH_PROFILE_SOURCED__}" != "1:$TMUX:$VIRTUAL_ENV" ];then
  ## add given path to PATH
  source $HOME/.export_path
  source $HOME/.export_envs

  # ssh
  source $HOME/.ssh_profile

  test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"


  export __BASH_PROFILE_SOURCED__="1:${TMUX}:${VIRTUAL_ENV}"

  if [ -f $HOME/.profile ]; then
    . $HOME/.profile
  fi
fi

