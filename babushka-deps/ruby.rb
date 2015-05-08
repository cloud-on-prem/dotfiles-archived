dep 'ruby-main' do
  requires 'chruby'
  requires 'ruby-install'
  requires 'latest-ruby'
end

dep 'chruby' do
  def chruby_version
    "0.3.9"
  end

  met? do
    "/usr/local/share/chruby/chruby.sh".p.exists?
  end

  meet do
    cd "/tmp/" do
      shell "wget -O chruby-#{chruby_version}.tar.gz\
        https://github.com/postmodern/chruby/archive/v#{chruby_version}.tar.gz"

      shell "tar -xzvf chruby-#{chruby_version}.tar.gz"

      cd "chruby-#{chruby_version}/" do
        shell "sudo make install"
        shell "sudo ./scripts/setup.sh"
      end
    end
  end
end

dep 'ruby-install' do
  def ruby_install_version
    "0.5.0"
  end

  met? do
    shell?("ruby-install")
  end

  meet do
    cd "/tmp/" do
      shell "wget -O ruby-install-#{ruby_install_version}.tar.gz \
        https://github.com/postmodern/ruby-install/archive/v#{ruby_install_version}.tar.gz"

      shell "tar -xzvf ruby-install-#{ruby_install_version}.tar.gz"

      cd "ruby-install-#{ruby_install_version}/" do
        shell "sudo make install"
      end
    end
  end
end

dep 'latest-ruby' do
  def latest_ruby_version
    "2.2.2"
  end

  def latest_ruby_version_regex
    Regexp.new(latest_ruby_version)
  end

  met? do
     latest_ruby_version_regex.match(`chruby-exec -- ruby-install | grep #{latest_ruby_version}`)
  end

  meet do
    `chruby-exec -- ruby-install ruby #{latest_ruby_version}`
  end
end

