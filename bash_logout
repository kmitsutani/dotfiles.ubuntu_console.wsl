[ -f ${HOME}/.ssh/environment ] && rm ${HOME}/.ssh/environment
find ${HOME}/.ssh/ -type l -name "auth_sock_from_*" | xargs -I{} rm {}
