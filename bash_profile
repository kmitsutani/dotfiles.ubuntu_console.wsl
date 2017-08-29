# Flag
export _BASHPROFILE_SOURCED=1
# configuration of PATH
export _BASH_PROFILE=1
## add given path to PATH
. $HOME/.bash_profile_path

# machine specific (not in the repository)
[ -f "$HOME/.profile" ] && . "$HOME/.profile"

export XDG_CONFIG_HOME=$HOME/.config

export LANG=en_US.UTF-8
# configure miscellaneous environmental vaiables
export EDITOR=vim

# LL module/package paths
if [ $(which pyenv | wc -l) -eq 0 ]; then
  PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages
  export PYTHONPATH
fi

# pkgconfig
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

# library specific
export MPTK_CONFIG_FILENAME=/usr/local/mptk/path.xml

# miscs

[[ -z "$TMUX" ]] && . $HOME/.bashrc
if [ "x$_PROFILE_SOURCED" != "x1" ] && [ -f "$HOME/.profile" ]; then
  . "$HOME/.profile"
fi

if [ -z "$_BASHRC_SOURCED" ] && [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi
