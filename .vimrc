" apt-get install ctags...and add this to ~/.ctags:
" --python-kinds=-iv
" --exclude=...

" We're young and don't need things behave like they did back in VI! 
set nocompatible

"""
" Fuzzy file search
"
" Enable file plugin that comes with vim by default...for file browsing.
filetype plugin on

" Lets you search in subdirectories using commands like :find
set path+=**

" Gives a cool little list/menu when using tab search (:find)
set wildmenu

" Can also use :ls to see open buffers and buffer command  :b [substring of name] to change
" between files...with tab completion if the substring matches many items.

"""
" Tags...
"
" ctags 
" - ^]  -> Jump to definition
" - g^] -> List all
" - ^T  -> Go back
command! MakeTags !ctags -R .



"""
" Stop pressing this...but all these freeze my ssh session.
" nnoremap <silent> <C-S> :<C-u>Update<CR>
" noremap <C-S> :update<CR>
" vnoremap <C-S> <C-C>:update<CR>
" inoremap <C-S> <C-O>:update<CR>

"""
set makeprg=python\ %
noremap <F10> :w<CR>:make<CR>
" :let f=expand("%")|vnew|execute '.!ruby "' . f . '"'

"""
" Look...
syntax enable
colorscheme monokai

set tw=9999  " prevent wrapping
set listchars+=precedes:<,extends:> "when nowrap is set-has carroots when a line extends beyond the edge
set virtualedit=insert
set hls
set ruler
set incsearch
set ai!
set nowrap

set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,resize

set expandtab "no tab characters, spaces instead except with makefiles
autocmd BufReadPost,FileReadPost,BufNewFile [Mm]ake{file,} setlocal noexpandtab

set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab

hi def link whiteSpaceError Error
autocmd Syntax * syn match whiteSpaceError "\(\S\| \)\@<=\t\+"
autocmd Syntax * syn match whiteSpaceError "\s\+\%#\@<!$"


" Add Package manager thing
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()

" Packages...
" Plugin 'VundleVim/Vundle.vim'
" Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Bundle 'tpope/vim-fugitive'
"Bundle 'scrooloose/nerdtree'
" Plugin 'Valloric/YouCompleteMe'

"call vundle#end()

"""
set cursorline
set showmatch
set invnumber

"set number
noremap <F3> :set invnumber<CR>
inoremap <F3> <C-O>:set invnumber<CR>

"slimux
"I have this built into the script, which is not
"what the original has
nnoremap <C-c><C-c> :SlimuxREPLSendLine<CR>
vnoremap <C-c><C-c> :SlimuxREPLSendLine<CR>
nnoremap <C-c><C-v> :SlimuxREPLConfigure<CR>
"vnoremap <C-C><C-C> :<C-w>SlimuxShellRun %cpaste<CR>:'<,'>SlimuxREPLSendSelection<CR>:SlimuxShellRun --<CR>

"paste formatted time
nnoremap t "=strftime("%Y-%m-%d %H:%M:%S")<CR>P

" Toggle Nerd Tree with F2
map <F2> :NERDTreeToggle<CR>

"alternate keys for indenting/unindenting
inoremap <S-Tab> <C-O><LT><LT>
nnoremap <Tab> >>
nnoremap <S-Tab> <LT><LT>j
vnoremap <Tab> >
vnoremap <S-Tab> <LT>

inoremap <S-Tab> <C-O><LT><LT>
nnoremap <Tab> >>
nnoremap <S-Tab> <LT><LT>j
vnoremap <Tab> >
vnoremap <S-Tab> <LT>

"change tabs directionaly with ^h and ^l
nnoremap <C-h> gT
nnoremap <C-l> gt

autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#show_call_signatures = 0
"inoremap <C-c> <Esc>
"let g:jedi#completions_enabled = 0
"i"let g:jedi#auto_vim_configuration = 0
"let g:neocomplete#force_omni_input_patterns.python =
"\ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
