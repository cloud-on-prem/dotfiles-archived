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

#Go
export PATH="/usr/local/go/bin:$PATH"
export GOPATH="$HOME/projects/go"
export PATH=$PATH:$GOPATH/bin


if [ -f ~/.zsh_profile ]; then
  . ~/.zsh_profile
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Fuzzy finder
fbr() {
  local branches branch
  branches=$(git branch) &&
    branch=$(echo "$branches" | fzf +s +m) &&
    git checkout $(echo "$branch" | sed "s/.* //")
}

cdf() {
  local file
  local dir
  file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

fe() {
  local file
  file=$(fzf --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

fh() {
  eval $(([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s | sed 's/ *[0-9]* *//')
}

ftags() {
  local line
  [ -e tags ] &&
    line=$(
  awk 'BEGIN { FS="\t" } !/^!/ {print toupper($4)"\t"$1"\t"$2"\t"$3}' tags |
  cut -c1-80 | fzf --nth=1,2
  ) && $EDITOR $(cut -f3 <<< "$line") -c "set nocst" \
    -c "silent tag $(cut -f2 <<< "$line")"
}
