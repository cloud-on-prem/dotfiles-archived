meta :rcfile do
  accepts_value_for :file_name

  template do
    def sym_file
      "~/#{file_name}"
    end

    def real_file
      "~/.dotfiles/templates/rc-files/#{file_name}"
    end

    met? do
      sym_file.p.readlink == real_file.p
    end

    meet do
      shell "ln -sfn #{real_file} #{sym_file}"
    end
  end
end

dep 'rc-main' do
  requires 'ack.rcfile'
  requires 'gitconfig.rcfile'
  requires 'ssh_tmux.rcfile'
  requires 'tmux.rcfile'
  requires 'top.rcfile'
  requires 'vim.rcfile'
  requires 'zprezto.rcfile'
  requires 'zshrc.rcfile'
  requires 'zsh_aliases.rcfile'
  requires 'zlogin.rcfile'
  requires 'zlogout.rcfile'
  requires 'zshenv.rcfile'
end


dep 'ack.rcfile' do
  file_name '.ackrc'
end

dep 'gitconfig.rcfile' do
  file_name '.gitconfig'
end

dep 'ssh_tmux.rcfile' do
  file_name '.ssh.tmux.rc'
end

dep 'tmux.rcfile' do
  file_name '.tmux.conf'
end

dep 'top.rcfile' do
  file_name '.toprc'
end

dep 'vim.rcfile' do
  file_name '.vimrc'
end

dep 'zlogin.rcfile' do
  file_name '.zlogin'
end

dep 'zlogout.rcfile' do
  file_name '.zlogout'
end

dep 'zprezto.rcfile' do
  file_name '.zpreztorc'
end

dep 'zshrc.rcfile' do
  file_name '.zshrc'
end

dep 'zshenv.rcfile' do
  file_name '.zenv'
end

dep 'zsh_aliases.rcfile' do
  file_name '.zsh_aliases'
end
