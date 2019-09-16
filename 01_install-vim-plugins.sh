mkdir -p ~/.vim/bundle ~/.vim/colors ~/.vim/autoload

curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle

git clone https://github.com/mxw/vim-jsx.git ~/.vim/bundle/vim-jsx
git clone git://github.com/tpope/vim-commentary.git
git clone git://github.com/tpope/vim-fugitive.git
git clone git://github.com/tpope/vim-surround.git
git clone git://github.com/plasticboy/vim-markdown.git

cd ~/.vim/colors
wget https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim

git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack