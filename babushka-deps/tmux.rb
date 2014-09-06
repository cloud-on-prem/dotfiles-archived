dep 'tmux-main' do
  requires 'tmux.lib'
  requires 'tmuxinator.gem'
  requires 'tmuxinator-templates'
  requires 'battery-status'
end

dep 'tmux.lib'

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

dep 'battery-status' do
  met? do
    shell?("/usr/bin/battery")
  end

  meet do
    `sudo cp ~/.dotfiles/scripts/battery.sh /usr/bin/battery`
    `sudo chmod +x /usr/bin/battery`
  end
end
