## Set up

1. Setup Vundle

    ```
      $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    ```

2.  Create Symlinks:

    `$ rm ~/.bashrc && rm ~/.vimrc && rm ~/.gitconfig && rm ~/.tmux.conf  
    `$ cd .dotfiles  
    `$ ln -s .bashrc ~/.bashrc && ln -s .vimrc ~/.vimrc && ln -s .gitconfig ~/.gitconfig && ln -s .tmux.conf ~/.tmux.conf  

3. Install configured bundles:  
    Launch `vim`, run `:BundleInstall`  
                                    
                                    
4. Copy this patch fot tmux to use ssh-agent forwarding correctly.
   `$ cd ~/.dotfiles  
   `$ cp ~/.dotfiles/.ssh.tmux.rc ~/.ssh/rc  
   `$ chmod 755 ~/.ssh/rc  
