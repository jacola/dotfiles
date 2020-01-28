"""
" - https://github.com/tpope/vim-pathogen
"
" - https://github.com/tpope/vim-commentary
" - https://github.com/tpope/vim-surround

set langmenu=en_US
let $LANG = 'en_US'

"""
" If we have pathogen, let's start it!
if filereadable(expand("~/.vim/autoload/pathogen.vim"))
    runtime! autoload/pathogen.vim
    if exists("g:loaded_pathogen")
       execute pathogen#infect()
    endif
endif

"""
" Markdown stuff
let g:vim_markdown_folding_disabled = 1

colorscheme monokai

" http://askubuntu.com/questions/347519/unable-to-copy-from-vim-to-system-clipboard
" >> "+y / "+p to access clipboard..
" apt-get install ctags...and add this to ~/.ctags:
" --python-kinds=-iv
" --exclude=...

" Man up.
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap <PageUp> <NOP>
noremap <PageDown> <NOP>

" We're young and don't need things behave like they did back in VI! 
set nocompatible

"""
" Fuzzy file search
"
" Lets you search in subdirectories using commands like :find
set path+=**

" Gives a cool little list/menu when using tab search (:find)
set wildmenu
" Can also use :ls to see open buffers and buffer command  :b [substring of name] to change
" between files...with tab completion if the substring matches many items.

""
" File browsing
"
" Enable file plugin that comes with vim by default...for file browsing.
" :edit [./folder name]
" v to split, t to tab
"  |netrw-brose-maps|
filetype plugin on
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
" let g:netrw_list_hide=netrw_gitignore#Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

"""
" Tags...
"
" ctags 
" - ^]  -> Jump to definition
" - g^] -> List all
" - ^T  -> Go back
command! MakeTags !ctags -R .

"""
" Autocomplete
"
" ^n/^p  ^x^f ^x^... and ^r to exit.


"""
" Templates...example:
" nnoremap ,html :-1read $HOME/.vim/snip/.skeleton.html<CR>3jwf>a

"""
" Stop pressing this...but all these freeze my ssh session.
" nnoremap <silent> <C-S> :<C-u>Update<CR>
" noremap <C-S> :update<CR>
" vnoremap <C-S> <C-C>:update<CR>
" inoremap <C-S> <C-O>:update<CR>

noremap <F9> :%s/\s\+$//e<CR>
" Remove white space. Can't map to f9 without function keys <3 apple.
com! NoSpace %s/\s\+$//e

let g:indent_guides_enable_on_vim_startup = 1
noremap <F8> :IndentGuidesToggle<CR>
nnoremap <F3> :set hlsearch!<CR>

"let g:javascript_plugin_jsdoc = 1
"let g:javascript_plugin_ngdoc = 1
"let g:javascript_plugin_flow = 1
"map <c-f> :call JsBeautify()<cr>
"nnoremap <c-f> :%!js-beautify -j -q -B -f -<CR>
"autocmd FileType javascript setlocal equalprg=js-beautify\ --stdin

"""
" Look...
syntax enable

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

"""
" Tabs

" Let's use 2 spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab

" But for HTML, js, css, handlebars, etc., use 2 spaces.
au BufRead,BufNewFile *.hbs set ft=html
au BufRead,BufNewFile *.vue set ft=html 
" autocmd Filetype html setlocal ts=2 sts=2 sw=2
" autocmd Filetype js setlocal ts=2 sts=2 sw=2
" autocmd Filetype css setlocal ts=2 sts=2 sw=2

hi def link whiteSpaceError Error
autocmd Syntax * syn match whiteSpaceError "\(\S\| \)\@<=\t\+"
autocmd Syntax * syn match whiteSpaceError "\s\+\%#\@<!$"

"""
set cursorline
set showmatch

"""
" Line number madness.
set numberwidth=5
set number
set relativenumber

augroup linenumbers
  autocmd!
  autocmd BufEnter *    :set relativenumber
  autocmd BufLeave *    :set number norelativenumber
  autocmd WinEnter *    :set relativenumber
  autocmd WinLeave *    :set number norelativenumber
  autocmd InsertEnter * :set number norelativenumber
  autocmd InsertLeave * :set relativenumber
  autocmd FocusLost *   :set number norelativenumber
  autocmd FocusGained * :set relativenumber
augroup END

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

au BufRead,BufNewFile *.md set ft=markdown

" For fixing JSON
com! PrettyJSON %!python -m json.tool

" I resisted...but...for large apps...
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1


if has("win32")
"    source ~\.vimrc.win32
else
    if filereadable($HOME . "/.vimrc.local")
        source ~/.vimrc.local
    endif
endif


"""
" Turn on support to automatically reopen files at the last location.
"  -> https://askubuntu.com/questions/223018/vim-is-not-remembering-last-position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"""
" On a touch screen, sometimes I want to move with my finger...
set mouse=a

set guifont=fira\ code\ retina:h12
