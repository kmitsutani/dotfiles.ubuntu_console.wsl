# configuration of PATH
## add given path to PATH
. $HOME/.bash_profile_path

# machine specific (not in the repository)
[ -f "$HOME/.profile" ] && . "$HOME/.profile"

export XDG_CONFIG_HOME=$HOME/.config

export LANG=en_US.UTF-8
# configure miscellaneous environmental vaiables
export EDITOR=vim

# ssh-agent
. $HOME/.profile_ssh_agent

# pkgconfig
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig


export _SOURCE_PROFILE=1
