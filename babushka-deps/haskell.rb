dep 'haskell-main' do
  requires 'haskell-platform.managed'
  requires 'ghci-color'
  requires 'hdevtools'
  requires 'ghc-mod'
  requires 'hlint'
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

dep 'hdevtools' do
  meet do
    shell 'cabal update && cabal install hdevtools'
  end

  met? do
    !which("hdevtools").to_s.empty?
  end
end

dep 'ghc-mod' do
  meet do
    shell 'cabal update && cabal install ghc-mod'
  end

  met? do
    !which("ghc-mod").to_s.empty?
  end
end

dep 'hlint' do
  meet do
    'cabal install hlint'
  end

  met? do
    shell? 'hlint --version'
  end
end
