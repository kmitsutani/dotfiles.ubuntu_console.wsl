# aliases
if ls --color -d . >/dev/null 2>&1; then
    alias ls='ls --color=auto'
elif ls -G -d . >/dev/nul 2>&1; then
    alias ls='ls -G'
fi
alias preview='open -a Preview'
alias beep='afplay /System/Library/Sounds/Submarine.aiff'
alias cronedit='crontab -e'
alias cronlist='crontab -l'
alias vi="vim -u /etc/vimrc --noplugin"
alias cpan-uninstall='perl -MConfig -MExtUtils::Install -e '"'"'($FULLEXT=shift)=~s{-}{/}g;uninstall "$Config{sitear    chexp}/auto/$FULLEXT/.packlist",1'"'"
alias sudoh="sudo -H"

# shell functions
function hyperthumb(){
    sudo xkbcomp -I$HOME/.xkb/hyperthumb $HOME/.xkb/hyperthumb/keymap $DISPLAY
}

function reprofile(){
    source ~/.bash_profile
}

# ssh-agent-singlton
. $HOME/.bashrc_ssh_agent

# osdep bashrc
[ -f $HOME/.bashrc_osdep ] && . $HOME/.bashrc_osdep

# machine dependent bashrc
[ -f $HOME/.bashrc_machine ] && . $HOME/.bashrc_machine

# Pythonbrew
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"
