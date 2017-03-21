# configuration of PATH
## add given path to PATH
. $HOME/.bash_profile_path

# machine dependent setting
set +eu
[ -f $HOME/.bash_profile_machine ] && . $HOME/.bash_profile_machine
set -eu

export XDG_CONFIG_HOME=$HOME/.config

export LANG=en_US.UTF-8
# configure miscellaneous environmental vaiables
export EDITOR=vim

# LL module/package paths
set +u
if [ $(which pyenv | wc -l) -eq 0 ]; then
  PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages
  export PYTHONPATH
fi

set -u

# ssh-agent
. $HOME/.profile_ssh_agent

# pkgconfig
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

# library specific
export MPTK_CONFIG_FILENAME=/usr/local/mptk/path.xml

# miscs

[ -f "$HOME/.profile" ] && . "$HOME/.profile"

export _SOURCE_PROFILE=1
set +uex
