if has("unix")
    execute pathogen#infect()
endif

if has("gui_running")
    if has("gui_gtk2")
        set guifont=Inconsolata\ 12
    elseif has("gui_macvim")
        set guifont=Menlo\ Regular:h14
    elseif has("gui_win32")
        set guifont=Consolas:h10:cANSI
    endif
endif


" http://askubuntu.com/questions/347519/unable-to-copy-from-vim-to-system-clipboard
" >> "+y / "+p to access clipboard..
" apt-get install ctags...and add this to ~/.ctags:
" --python-kinds=-iv
" --exclude=...

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
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

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

"""
" Run current python file
function! RunPython()
    execute "w"
    let f=expand("%")
    if has("gui_win32")
       execute "!python " . f . ""
    else
       execute "SlimuxShellRun python " . f . ""
    endif
endfunction

noremap <F10> :call RunPython()<CR>

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

"""
set cursorline
set showmatch
set invnumber

"set number
noremap <F3> :set invnumber<CR>
inoremap <F3> <C-O>:set invnumber<CR>

"""
" Slimux
"
" I have this built into the script, which is not
" what the original has
nnoremap <C-c><C-c> :SlimuxREPLSendLine<CR>
vnoremap <C-c><C-c> :SlimuxREPLSendLine<CR>
nnoremap <C-c><C-v> :SlimuxREPLConfigure<CR>
"vnoremap <C-C><C-C> :<C-w>SlimuxShellRun %cpaste<CR>:'<,'>SlimuxREPLSendSelection<CR>:SlimuxShellRun --<CR>

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

