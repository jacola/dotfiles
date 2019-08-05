mkdir -p ~/.vim/bundle ~/.vim/colors ~/.vim/autoload

curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle

git clone git://github.com/tpope/vim-commentary.git
git clone git://github.com/tpope/vim-fugitive.git
git clone git://github.com/tpope/vim-surround.git
git clone git://github.com/plasticboy/vim-markdown.git
git clone git://github.com/mustache/vim-mustache-handlebars.git mustache
git clone git://github.com/tell-k/vim-autopep8.git

cd ~/.vim/colors
wget https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim
