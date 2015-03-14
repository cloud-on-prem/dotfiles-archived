dep 'docker-main' do
  if Babushka::Helpers::Os.osx?
    requires 'osx'
    requires 'boot2docker'
  else
    requires "docker-io"
  end

  requires 'pip.bin'
  requires 'docker-compose'
end

dep 'boot2docker' do
  met? do
    shell? "brew list boot2docker"
  end

  meet do
    shell "brew install boot2docker"
  end
end

dep "docker-io" do
  met? do
    shell? "docker --version"
  end

  meet do
    shell "sudo apt-get install docker.io -y"
  end
end

dep 'docker-compose' do
  met? do
    shell? "docker-compose --version"
  end

  meet do
    shell "sudo pip install -U docker-compose"
  end
end


