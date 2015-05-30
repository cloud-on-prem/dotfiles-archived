dep 'haskell-main' do
  requires 'haskell-platform.managed'
  requires 'ghci-color'
end

dep 'haskell-platform.managed' do provides []; end

dep 'ghci-color' do
  def path
    "~/.ghci-color"
  end

  met? do
    path.p.exists?
  end

  meet do
    shell "git clone https://github.com/premjg/ghci-color.git #{path}"
  end
end
