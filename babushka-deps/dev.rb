dep 'dev' do
  requires 'vim'
end

dep 'vim' do
  requires 'vundle'
end

dep 'vundle' do
  file = "~/.vim/bundle/Vundle.vim"

  met? do
    file.p.exists?
  end

  meet do
    shell "git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim"
    shell "vim -e +PluginInstall +qall"
  end
end

dep 'chruby' do
  met? do
    shell? "chruby"
  end

  meet do
    shell "cd /tmp/"
    shell "wget -O chruby-0.3.8.tar.gz https://github.com/postmodern/chruby/archive/v0.3.8.tar.gz"
    shell "tar -xzvf chruby-0.3.8.tar.gz"
    shell "cd chruby-0.3.8/"
    shell "sudo make install"
  end
end
