# aliases
if [ $(ls --help 2>&1 | grep GNU | wc -l) -gt 0 ]; then
    alias ls='ls --color=auto'
else
    alias ls='ls -G'
fi
alias preview='open -a Preview'
alias beep='afplay /System/Library/Sounds/Submarine.aiff'
alias cronedit='crontab -e'
alias cronlist='crontab -l'
alias vi="vim -u /etc/vimrc --noplugin"
alias cpan-uninstall='perl -MConfig -MExtUtils::Install -e '"'"'($FULLEXT=shift)=~s{-}{/}g;uninstall "$Config{sitear    chexp}/auto/$FULLEXT/.packlist",1'"'"
alias sudoh="sudo -H"
alias ssh="ssh -A"

# shell functions
function hyperthumb(){
    sudo xkbcomp -I$HOME/.xkb/hyperthumb $HOME/.xkb/hyperthumb/keymap $DISPLAY
}

function reprofile(){
    source ~/.bash_profile
}

# ssh-agent-singlton
# . $HOME/.bashrc_ssh_agent

# osdep bashrc
[ -f $HOME/.bashrc_osdep ] && . $HOME/.bashrc_osdep

# machine dependent bashrc
[ -f $HOME/.bashrc_machine ] && . $HOME/.bashrc_machine

# Pythonbrew
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"
