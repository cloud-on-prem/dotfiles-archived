dep 'dev' do
  requires 'locale'
  requires 'vim'
  requires 'tree.bin'
  requires 'mercurial.bin'
  requires 'ag'
  requires 'bower'
  requires 'redis'
  requires 'exuberant-ctags.pkg'
  requires 'fzf'
  requires 'mlocate.managed' if Babushka::Helpers::Os.linux?
end

dep 'locale' do
  met? do
    if Babushka::Helpers::Os.linux?
      shell "sudo locale-gen en_AU.UTF-8"
    else
      true
    end
  end
end

dep 'exuberant-ctags.pkg'

dep 'vim' do
  requires 'vim-with-deps'
  requires 'vundle'
end

dep 'vim-with-deps' do
  met? do
    shell? "vim --version | grep '+ruby'"
    shell? "vim --version | grep '+lua'"
  end

  meet do
    if Babushka::Helpers::Os.osx?
      shell "brew install vim --with-lua --with-ruby --with-pyhton"
    else
      requires "vim-nox.managed"
    end
  end
end

dep 'vim-nox.managed' do
  met? do
    shell? "vim --version | grep '+ruby'"
    shell? "vim --version | grep '+lua'"
  end
end

dep 'fzf' do
  met? do
    file = "~/.fzf/fzf"
    file.p.exists?
  end

  meet do
    shell "git clone https://github.com/junegunn/fzf.git ~/.fzf"
    unless Babushka::Helpers::Os.osx? do
      shell "sudo apt-get install ncurses-dev"
    end
    shell "~/.fzf/install"
    end
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
    autotools-dev.managed
    automake.managed
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
dep 'autotools-dev.managed'   do provides [] end
dep 'automake.managed'   do provides [] end

dep 'liblzma-dev' do
  met? { shell? "dpkg -s liblzma-dev" }
  meet { shell "apt-get install -y --force-yes liblzma-dev", :sudo => true }
end

dep 'npm.managed' do
  requires 'nodejs.managed'
  met? { shell? "npm --version" }
end

dep 'nodejs.managed' do
  met? do
    shell? "node --version"
  end

  meet do
    if Babushka::Helpers::Os.osx?
      shell "brew install node"
    else
      shell "curl -sL https://deb.nodesource.com/setup | sudo bash -"
      shell "sudo apt-get install -y nodejs"
    end
  end
end

dep "bower" do
  requires 'npm.managed'

  met? do
    shell? "bower --version"
  end

  meet do
    shell "sudo npm install -g bower"
  end
end

dep "redis" do
  if Babushka::Helpers::Os.osx?
    requires "redis.managed"
  else
    requires "redis-server-manual"
  end
end

dep "redis-server-manual" do
  met? do
    shell? "redis-server --version"
  end

  meet do
    cd "/tmp/" do
      shell "wget http://download.redis.io/redis-stable.tar.gz"
      shell "tar xvzf redis-stable.tar.gz"
      cd "redis-stable" do
        shell "make"
        shell "sudo make install"
      end
    end
  end
end

dep "redis.managed" do
  met? do
    shell? "redis-server --version"
  end
end

dep 'ultisnips-dir' do
  dest_dir = "~/.vim/UltiSnips"
  src_dir = "~/.dotfiles/snippets/vim"

  met? do
    dest_dir.p.readlink == src_dir.p
  end

  meet do
    shell "ln -sf #{src_dir} #{dest_dir}"
  end
end

dep 'mlocate.managed' do
  met? do
    shell? "locate --version"
  end
end
