alias c='clear'
alias fs='foreman start'
alias refresh='source ~/.bashrc'
alias mir='cd ~/.dotfiles && ruby ./cloud.rb make_it_rain && refresh && c && cd -'
alias vu='vagrant up'
alias vh='vagrant halt'
alias vs='ssh vagrant'
alias vsp='ssh personal'
alias vr='vagrant resume'
alias vsusp='vagrant suspend'
alias tma='tmux a -t '
alias tmn='tmux new -s '
alias tmk='tmux kill-session -t '
alias tmls='tmux ls'
alias restartnet="sudo nohup sh -c 'invoke-rc.d networking stop; date; echo sleeping; sleep 2; echo waking; date; invoke-rc.d networking start'"
alias gfr="git fetch && git rebase"

# Empower my idiosyncratic typos
alias gti='git'
