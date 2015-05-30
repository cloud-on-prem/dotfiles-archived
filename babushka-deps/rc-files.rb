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
  requires 'fzf-local.rcfile'
  requires 'gem.rcfile'
  requires 'gitconfig.rcfile'
  requires 'git-completion.rcfile'
  requires 'ssh_tmux.rcfile'
  requires 'tmux.rcfile'
  requires 'top.rcfile'
  requires 'vim.rcfile'
  requires 'nvim.rcfile'
  requires 'vim-bundle.rcfile'
  requires 'zprezto.rcfile'
  requires 'zshrc.rcfile'
  requires 'zsh_aliases.rcfile'
  requires 'fish-aliases.rcfile'
  requires 'fish-functions.rcfile'
  requires 'zlogin.rcfile'
  requires 'zlogout.rcfile'
  requires 'zshenv.rcfile'
  requires 'rspec.rcfile'
  requires 'ctags.rcfile'
  requires 'ghci.rcfile'
  requires 'rc-files-perms'
  requires 'ghci-file-perms'
end

dep 'rc-files-perms' do
  def dir
    "~/.dotfiles/templates/rc-files"
  end

  met? do
    /drwxr-xr-x/.match(shell "ls -ld #{dir}")
  end

  meet do
    shell "chmod g-w #{dir}"
  end
end

dep 'ghci-file-perms' do
  def file
    "~/.ghci"
  end

  met? do
    /lrwxrwxrwx/.match(shell "ls -l #{file}")
  end

  meet do
    shell "chmod g-w #{file}"
  end
end

dep 'ghci.rcfile' do
  file_name '.ghci'
end

dep 'ack.rcfile' do
  file_name '.ackrc'
end

dep 'fzf-local.rcfile' do
  file_name '.fzf-local.zsh'
end

dep 'gem.rcfile' do
  file_name '.gemrc'
end

dep 'gitconfig.rcfile' do
  file_name '.gitconfig'
end

dep 'git-completion.rcfile' do
  file_name '.git-completion.bash'
end

dep 'ssh_tmux.rcfile' do
  def sym_file
    "~/.ssh/rc"
  end

  file_name '.ssh.tmux.rc'
end

dep 'tmux.rcfile' do
  file_name '.tmux.conf'
end

dep 'top.rcfile' do
  file_name '.toprc'
end

dep 'nvim.rcfile' do
  file_name '.nvimrc'
end

dep 'vim.rcfile' do
  file_name '.vimrc'
end

dep 'vim-bundle.rcfile' do
  file_name '.vim.bundle'
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

dep 'fish-aliases.rcfile' do
  file_name '.aliases.fish'
end

dep 'fish-functions.rcfile' do
  file_name '.functions.fish'
end

dep 'rspec.rcfile' do
  file_name '.rspec'
end

dep 'ctags.rcfile' do
  file_name '.ctags'
end
