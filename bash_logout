[ -f ${HOME}/.ssh/environment ] && rm ${HOME}/.ssh/environment
find ${HOME}/.ssh -xtype l | xargs -I{} rm {}
