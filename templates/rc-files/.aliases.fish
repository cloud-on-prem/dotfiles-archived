function c
  clear
end

function refresh
  source ~/.zshrc
end

function restartnet
  sudo nohup sh -c 'invoke-rc.d networking stop; date; echo sleeping; sleep 2; echo waking; date; invoke-rc.d networking start'
end

function lss
  ls -lAh $argv
end

function v
  vim $argv
end

function vu
  vagrant up
end

function vh
  vagrant halt
end

function vs
  vagrant ssh
end

function vr
  vagrant resume
end

function vsusp
  vagrant suspend
end

function tma
  tmux a -t $argv
end

function tmn
  tmux new -s $argv
end

function tmk
  tmux kill-session -t $argv
end

function tmls
  tmux ls
end

function gfr
  git fetch; and git rebase
end

function gco
  git branch | cut -c 3- | selecta | xargs git checkout; and clear
end

function grb
  git branch --merged master | grep -v "\* master" | xargs -n 0 git branch -d
end

function gti
  git $argv
end

function gset
  git push --set-upstream origin (git symbolic-ref --short -q HEAD)
end

function gpush
  git push $argv
end

function groom
  git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
end

function bx
  bundle exec $argv
end

function zc
  zeus console
end

function fs
  foreman start
end

function bab
  babushka $argv
end

function fgc
  fz_git_co
end

function fcd
  fz_cd
end

function fe
  fz_edit
end

function fh
  fz_history
end

function fct
  fz_ctags
end

function ff
  fz_locate
end

function clean-docker
  docker stop (docker ps -a -q); and docker rm (docker ps -a -q)
end
