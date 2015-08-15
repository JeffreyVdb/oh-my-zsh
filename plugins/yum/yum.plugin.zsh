## Aliases

if which dnf &>/dev/null; then
	CMD="dnf"
	PREFIX="dnf"
else
	CMD="yum"
	PREFIX="y"
fi

alias ${PREFIX}s="${CMD} search"                       # search package
alias ${PREFIX}p="${CMD} info"                         # show package info
alias ${PREFIX}l="${CMD} list"                         # list packages
alias ${PREFIX}gl="${CMD} grouplist"                   # list package groups
alias ${PREFIX}li="${CMD} list installed"              # print all installed packages
alias ${PREFIX}mc="${CMD} makecache"                   # rebuilds the dnf package list

alias ${PREFIX}u="sudo ${CMD} update"                  # upgrate packages
alias ${PREFIX}i="sudo ${CMD} install"                 # install package
alias ${PREFIX}gi="sudo ${CMD} groupinstall"           # install package group
alias ${PREFIX}ir="sudo ${CMD} reinstall"              # Reinstall package
alias ${PREFIX}r="sudo ${CMD} remove"                  # remove package
alias ${PREFIX}gr="sudo ${CMD} groupremove"            # remove pagage group
alias ${PREFIX}rl="sudo ${CMD} remove --remove-leaves" # remove package and leaves
alias ${PREFIX}c="sudo ${CMD} clean all"               # clean cache
