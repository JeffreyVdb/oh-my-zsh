#!/bin/zsh
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git systemd systemadmin zsh-syntax-highlighting aliases yum vagrant tmux artisan debian)

source $ZSH/oh-my-zsh.sh
#source $ZSH/aliases.sh

# User configuration

export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/home/jeffrey/.local/bin:/home/jeffrey/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# OPTIONS
#setopt autopushcd

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

#PERL_VIRT_ENV="default"
#PERL_VIRT_ENV_PATH="$HOME/.perlenvs/$PERL_VIRT_ENV/lib/perl5"
#eval $(perl -I"$HOME/.perlenvs/default/lib/perl5" -Mlocal::lib="$PERL_VIRT_ENV_PATH")

# virtual environments
#export WORKON_HOME=~/.virtualenvs
#source /usr/bin/virtualenvwrapper.sh
#
eval $(dircolors $HOME/.dircolors)

TERM='screen-256color'
export TERM="$TERM"


hash -d devp="$HOME/Devel"
hash -d phpdev="$HOME/Devel/php-sites"

QUICK_ACCESS_PATH="$HOME/Devel/current"
addQuickAccess() {
    ln -s $(readlink -f $1) $QUICK_ACCESS_PATH/$(basename $1)
    makeQuickAccessHashes
}

makeQuickAccessHashes() {
    for quickdir in $QUICK_ACCESS_PATH/*(N); do
        hash -d $(basename $quickdir)="$quickdir"
    done
}

makeQuickAccessHashes

export PATH="$PATH:$HOME/.rvm/bin:$HOME/.composer/vendor/bin" # Add RVM to PATH for scripting
export VAGRANT_VMWARE_CLONE_DIRECTORY="~/Virtual/vagrant/VMware"

setopt extended_glob
stty -ixon
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

source $ZSH/exports
source $ZSH/aliases
source $ZSH/paths
source $ZSH/go
# source $ZSH/tmux


# Homestead
HSPATH="$USER/.composer/vendor/laravel/homestead"
hscmd() {
	pushd $HSPATH &>/dev/null
	vagrant $@
	popd &>/dev/null
}

alias hs="ssh vagrant@127.0.0.1 -p 2222"
alias hshalt="hscmd halt"
alias hsup="hscmd up"

PATH="/home/jeffrey/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/home/jeffrey/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/jeffrey/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/jeffrey/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/jeffrey/perl5"; export PERL_MM_OPT;

export WORKON_HOME="~/.envs"

# check for python virtualenvwrapper
virtualenvwrapper=$(which virtualenvwrapper.sh)
if [ $? -eq 0 ]; then
	source $virtualenvwrapper
fi
