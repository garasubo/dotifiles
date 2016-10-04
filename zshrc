bindkey -v

autoload -U compinit; compinit

setopt auto_cd

setopt extended_glob

setopt hist_ignore_all_dups

setopt hist_ignore_space

autoload -U promptinit; promptinit

# show git branch name
setopt prompt_subst
autoload -Uz vcs_info

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'
zstyle ':vcs_info:*' formats '%s][* %F{green}%b%f'
zstyle ':vcs_info:*' actionformats '%s][* %F{green}%b%f(%F{red}%a%f)'

PROMPT='[%*][%F{magenta}%n%f@%F{green}%U%m%u%f:%F{blue}%B%d%f%b]
$ '
RPROMPT='[${vcs_info_msg_0_}]'
SPROMPT='correct: %R -> %r ? '

export SUDO_EDITOR='rvi'

alias vi='vim'
alias minicom='LANG=C minicom'

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt EXTENDED_HISTORY


export PATH=~/bin:~/bin/eclipse:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# OPAM configuration
. $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# zplug
source $HOME/.zsh/zplug.zsh

# local setting
if [ -e "$HOME/.zshrc.local" ]; then
    source "$HOME/.zshrc.local"
fi

precmd(){ vcs_info }
