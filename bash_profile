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


# pkgconfig
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

# library specific
export MPTK_CONFIG_FILENAME=/usr/local/mptk/path.xml

# miscs

if [ -z "$_BASHRC_SOURCED" ];then
  . $HOME/.bashrc
fi

if [ -z "$_PROFILE_SOURCED" ] && [ -f "$HOME/.profile" ]; then
  . "$HOME/.profile"
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
