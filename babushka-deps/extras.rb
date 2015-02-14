dep 'postgresql.bin' do
  met? do
    shell? "postgres --version"
  end
end

dep 'phantomjs.managed'   do provides [] end
