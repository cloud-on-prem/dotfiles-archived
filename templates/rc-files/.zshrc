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

EDITOR=vim
export EDITOR

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# Rbenv
export PATH="$HOME/.rbenv/bin:$PATH"

export LC_ALL="en_AU.UTF-8"
export LC_CTYPE="en_AU.UTF-8"

setopt extended_glob

if [ -f ~/.zsh_aliases ]; then
  . ~/.zsh_aliases
fi

if [ -f ~/.bin/tmuxinator.zsh ]; then
  . ~/.bin/tmuxinator.zsh
fi
