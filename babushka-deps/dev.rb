dep 'dev' do
  requires 'vim'
  requires 'tree.bin'
  requires 'mercurial.bin'
  requires 'ag'
  requires 'bower'
  requires 'redis-server.managed'
  requires 'exuberant-ctags.pkg'
  requires 'fzf'
  requires 'weechat.managed'
end

dep 'weechat.managed'
dep 'exuberant-ctags.pkg'

dep 'vim' do
  requires 'vim-with-ruby-python'
  requires 'vundle'
  requires 'command-t'
  requires 'youcompleteme'
end

dep 'vim-with-ruby-python' do
  met? do
    shell? "vim --version | grep '\+ruby'"
  end

  meet do
    cd "/tmp" do
      shell "hg clone https://vim.googlecode.com/hg/ vim"
      cd "vim" do
        shell "./configure --enable-pythoninterp --enable-rubyinterp"
        shell "sudo make && sudo make install"
      end
    end
  end
end

dep 'youcompleteme' do
  met? do
    cd "~/.vim/bundle/YouCompleteMe" do
      shell "git submodule update --init --recursive"
      shell "./install.sh --clang-completer"
    end
  end

  meet do
    cd "~/.vim/bundle/YouCompleteMe" do
      shell "git submodule update --init --recursive"
      shell "./install.sh --clang-completer"
    end
  end
end

dep 'fzf' do
  met? do
    file = "~/.fzf/fzf"
    file.p.exists?
  end

  meet do
    shell "git clone https://github.com/junegunn/fzf.git ~/.fzf"
    shell "~/.fzf/install"
  end
end

dep 'vundle' do
  file = "~/.vim/bundle/Vundle.vim"

  met? do
    file.p.exists?
  end

  meet do
    shell "git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim"
    shell "vim +PluginInstall +qall"
  end
end

dep 'command-t' do
  met? do
    cd "~/.vim/bundle/command-t/ruby/command-t" do
      shell "/usr/bin/ruby extconf.rb"
      shell "make"
    end
  end

  meet do
    cd "~/.vim/bundle/command-t/ruby/command-t" do
      shell "/usr/bin/ruby extconf.rb"
      shell "make"
    end
  end
end

dep 'tree.bin'
dep 'mercurial.bin' do
  met? { shell?("hg --version") }
end

dep 'ag' do
  if Babushka::Helpers::Os.osx?
    requires 'the_silver_searcher.bin'
  else
    requires 'silversearcher-ag-src'
  end
end

dep 'the_silver_searcher.bin' do
  met? do
    shell? "ag --version"
  end
end

dep 'silversearcher-ag-src' do
  requires %w[
    libpcre3-dev.managed
    zlib1g-dev.managed
    liblzma-dev
  ]

  met? do
    shell? "ag --version"
  end

  meet {
    uri = 'https://github.com/ggreer/the_silver_searcher/archive/master.tar.gz'
    Babushka::Resource.extract(uri)
    cd "~/.babushka/build/master/the_silver_searcher-master" do
      shell "./build.sh"
      shell "make install", :sudo => true
    end
  }
end

dep 'libpcre3-dev.managed' do provides [] end
dep 'zlib1g-dev.managed'   do provides [] end
dep 'liblzma-dev' do
  met? { shell? "dpkg -s liblzma-dev" }
  meet { shell "apt-get install -y --force-yes liblzma-dev", :sudo => true }
end


dep "bower" do
  met? do
    shell? "bower --version"
  end

  meet do
    shell "sudo npm install -g bower"
  end
end

dep 'redis-server.managed' do provides [] end
