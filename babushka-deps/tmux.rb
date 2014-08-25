dep 'tmux-main' do
  requires 'tmux.lib'
  requires 'tmuxinator.gem'
  requires 'tmuxinator-templates'
end

dep 'tmux.lib' do
  installs 'tmux > 1.8'
end

dep 'tmuxinator.gem'

dep 'tmuxinator-templates' do

  def sym_file
    "~/.tmuxinator"
  end

  def real_file
    "~/.dotfiles/templates/tmuxinator"
  end

  met? do
    sym_file.p.readlink == real_file.p
  end

  meet do
    shell "ln -sfn #{real_file} #{sym_file}"
  end
end
