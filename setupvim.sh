echo "Installing vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Getting vimrc"
wget -O ~/.vimrc https://kozie.github.io/dotfiles/vimrc-simple

echo "Installing vim plugins"
vim +PluginInstall +qall
