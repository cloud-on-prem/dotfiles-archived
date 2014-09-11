dep 'postgresql.bin' do
  met? do
    shell? "postgres --version"
  end
end
