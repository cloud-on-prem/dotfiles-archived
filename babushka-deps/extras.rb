dep 'postgresql.bin' do
  unless Babushka::Helpers::Os.osx?
    requires 'libpq-dev.managed'
  end

  met? do
    shell? "psql --version"
  end
end

dep 'libpq-dev.managed' do provides [] end

dep 'phantomjs.managed'   do provides [] end
