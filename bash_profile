# Flag
export _BASHPROFILE_SOURCED=1
# configuration of PATH
export _BASH_PROFILE=1
## add given path to PATH
. $HOME/.bash_profile_path

export XDG_CONFIG_HOME=$HOME/.config

export LANG=en_US.UTF-8
# configure miscellaneous environmental vaiables
export EDITOR=vim

# LL module/package paths
if [ $(which pyenv | wc -l) -eq 0 ]; then
  PYTHONPATH=/usr/local/lib/python2.7/site-packages
  PYTHONPATH=$PYTHONPATH:$HOME/.local/lib/python2.7/site-packages
  export PYTHONPATH
fi

# pkgconfig
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

# library specific
export MPTK_CONFIG_FILENAME=/usr/local/mptk/path.xml

# miscs

# ssh
. $HOME/.ssh_profile

# venv hook
function _venv_hook()
{
  cwd=$(pwd)
  if [ "${VIRTUAL_ENV}" != "" ]; then
    :
    #if [[ ! $cwd =~ ${VIRTUAL_ENV}* ]]; then
    #  deactivate
    #fi
  else
    if [[ -f "${cwd}/.venv" ]]; then
      _venv=$(cat "${cwd}/.venv")
      . ${_venv}/bin/activate
    fi
  fi
}
export PROMPT_COMMAND="_venv_hook;$PROMPT_COMMAND"

# venv hook
function _venv_hook()
{
  # assume virtual environments are not nested
  cwd=$(pwd)
  if [ "${VIRTUAL_ENV}" != "" ]; then
    # already some virtual environment is active
    # if cwd is parental node of directory tree, then deactivate
    if [[ ! $cwd =~ ${VIRTUAL_ENV}* ]]; then
      deactivate
    fi
  else
    # if $cwd/bin/activate exists, then activate
    if [ -f "${cwd}/bin/activate" ]; then
      ${cwd}/bin/activate
    fi
  fi
}
export PROMPT_COMMAND="_venv_hook;$PROMPT_COMMAND"

[[ -z "$TMUX" ]] && . $HOME/.bashrc

if [ -z "$_PROFILE_SOURCED" ] && [ -f "$HOME/.profile" ]; then
  . "$HOME/.profile"
fi

. $HOME/.bashrc

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
