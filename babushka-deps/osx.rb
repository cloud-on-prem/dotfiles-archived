dep 'osx' do
  requires 'homebrew.pkg'
  requires 'virtualbox'
  requires 'brew cask'
  requires 'boot2docker.bin'
  requires 'vagrant'
end

dep 'homebrew.pkg'
dep 'virtualbox.bin'

dep 'brew cask' do
  met? do
    shell? "brew list brew-cask"
  end

  meet do
    shell 'brew tap phinze/homebrew-cask && brew install brew-cask'
  end
end

dep 'boot2docker.bin'

dep 'virtualbox' do
  met? do
    shell? "virtualbox -v"
  end

  meet do
    shell "brew cask install virtualbox"
  end
end

dep 'vagrant' do
  met? do
    shell? "vagrant -v"
  end

  meet do
    shell "brew cask install vagrant"
  end
end
