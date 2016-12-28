# configuration of PATH
## add given path to PATH
. $HOME/.bash_path

# OS dependent setting
# ! should change to .profile_osdep
. $HOME/.bash_osdep

export XDG_CONFIG_HOME=$HOME/.config

export LANG=en_US.UTF-8
# configure miscellaneous environmental vaiables
export EDITOR=vim

# LL module/package paths
set +u
PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
export PYTHONPATH
set -u

# virtualenvwrapper
if [ -f "/usr/local/bin/virtualenvwrapper.sh" ]; then
    set +u
    export WORKON_HOME=$HOME/.virtualenvs
    source /usr/local/bin/virtualenvwrapper.sh
    set -u
fi
# pkgconfig
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

# library specific
export MPTK_CONFIG_FILENAME=/usr/local/mptk/path.xml

# miscs

export DROPBOX="$HOME/Dropbox"

[ -f "$HOME/.profile" ] && . "$HOME/.profile"
[ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

set +eu
