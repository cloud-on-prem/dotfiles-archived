dep 'educate' do
  requires 'keycastr'
end

dep 'keycastr' do
  met? do
    shell? "brew cask list keycastr"
  end

  meet do
    shell "brew cask install keycastr"
  end
end
