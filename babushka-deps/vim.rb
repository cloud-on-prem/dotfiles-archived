dep 'vim-main' do
  requires 'neobundle'
end

dep 'neobundle' do
  met? do
    "~/.vim/bundle/neobundle.vim".p.exists?
  end

  meet do
    shell "mkdir -p ~/.vim/bundle"
    shell "git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim"
  end
end
