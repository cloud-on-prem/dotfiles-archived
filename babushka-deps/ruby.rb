dep 'ruby-main' do
  requires 'ruby-switch'
end

dep 'rbenv' do
  met? do
    shell? "rbenv"
  end

  meet do
    shell "git clone https://github.com/sstephenson/rbenv.git ~/.rbenv"
  end
end

dep 'ruby-build' do
  requires 'rbenv'

  met? do
    shell? "rbenv install -l"
  end

  meet do
    shell "git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build"
  end
end

dep 'ruby-install' do
  requires 'ruby-build'

  met? do
    /2\.1\.2/.match(`rbenv versions`)
  end

  meet do
    shell "rbenv install 2.1.2"
  end
end

dep 'ruby-switch' do
  requires 'ruby-build'

  met? do
    /ruby(.?)(2\.1\.2)/.match(`ruby -v`)
  end

  meet do
    shell "rbenv global 2.1.2"
  end
end
