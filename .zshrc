#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


# Disable Ctrl+s Suspend
stty stop ''
stty start ''
stty -ixon
stty -ixoff

EDITOR=vi
export EDITOR

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$HOME/bin:$PATH"

export LC_ALL="en_AU.UTF-8"
export LC_CTYPE="en_AU.UTF-8"


if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
