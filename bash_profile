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

[[ -z "$TMUX" ]] && . $HOME/.bashrc
if [ -z "$_PROFILE_SOURCED" ] && [ -f "$HOME/.profile" ]; then
  . "$HOME/.profile"
fi

if [ -z "$_BASHRC_SOURCED" ] && [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi
