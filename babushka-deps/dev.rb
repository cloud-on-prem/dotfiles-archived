dep 'dev' do
  requires 'vim'
  requires 'tree.bin'
end

dep 'vim' do
  requires 'vundle'
end

dep 'vundle' do
  file = "~/.vim/bundle/Vundle.vim"

  met? do
    file.p.exists?
  end

  meet do
    shell "git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim"
    shell "vim +PluginInstall +qall"
  end
end

dep 'tree.bin'
