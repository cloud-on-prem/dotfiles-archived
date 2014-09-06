dep 'main' do
  requires "git.bin"
  requires 'rc-main'
  requires 'dev'
  requires 'tmux-main'
  requires 'zsh-main'
end

dep 'git.bin' do
  installs "git ~>1.9"
end
