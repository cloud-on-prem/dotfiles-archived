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

if which rbenv >/dev/null; then
  eval "$(rbenv init -)"
fi

if which chruby >/dev/null; then
  source /usr/local/share/chruby/chruby.sh
end

export LC_ALL="en_AU.UTF-8"
export LC_CTYPE="en_AU.UTF-8"

setopt extended_glob

if [ -f ~/.zsh_aliases ]; then
  . ~/.zsh_aliases
fi

if [ -f ~/.bin/tmuxinator.zsh ]; then
  . ~/.bin/tmuxinator.zsh
fi

# Fix Tmux pane ssh auth
if [ -f ~/.dotfiles/scripts/ssh-find-agent.bash ]; then
  . ~/.dotfiles/scripts/ssh-find-agent.bash
fi

if ! test $SSH_AUTH_SOCK; then
  set_ssh_agent_socket
fi

# Vi mode buffers
bindkey '^R' history-incremental-search-backward
unsetopt sharehistory
