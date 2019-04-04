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


# ssh
. $HOME/.ssh_profile

[[ -z "$TMUX" ]] && . $HOME/.bashrc

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

if [ ! -z "$(cd ${HOME}/dotfiles; git status -s)" ]; then
  echo "you have something to do with dotfiles git repository"
fi
