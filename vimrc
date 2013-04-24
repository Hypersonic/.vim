""""""""""""""""""""""
" Josh's minimal vimrc
""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Initialization
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Pathogen!
execute pathogen#infect()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" We don't need no stinkin' compatibility!
set nocompatible

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugin
filetype plugin on
filetype indent on

" Good key repeat times
set ttimeout
set ttimeoutlen=250
set notimeout

" Share clipboard between vim instances
" set clipboard=unnamed

" Set to auto read when a file is changed from the outside
set autoread

" Set folding to go by the file's syntax highlighting
set foldmethod=syntax

" Don't fold automatically
set foldlevel=999999

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "'"
let g:mapleader = "'"

" Fast saving
nmap <leader>w :w!<cr>

" Fast quitting
nmap <leader>wq :wq!<cr>:quit<cr>

" So I can go to the last damn character
set virtualedit=onemore

" Proper term setting
set term=builtin_screen

" Show partial commands while you type
set showcmd

" On the iPad, it's a pain to use one of the normal <esc> alternatives.
imap ''' <esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set 7 lines to the curors - when moving vertical..
set so=7

set wildmenu "Turn on WiLd menu
" http://stackoverflow.com/questions/526858/how-do-i-make-vim-do-normal-bash-like-tab-completion-for-file-names
set wildmode=longest,list

set ruler "Always show current position

set cmdheight=2 "The commandbar height

set hid "Change buffer - without saving

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers
set nolazyredraw "Don't redraw while executing macros 

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Show line numbers
set nu

" Colorscheme
colorscheme evening


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
" set wrap "Wrap lines

" set tw=72 " Automatically newline at this many characters on a line
set fo=crqt " Continue comments on to the next line if you newline in a comment



""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""

vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use shift+navkeys as pgup, pgdown, home, and end
noremap J <pagedown>
noremap K <pageup>
noremap H <home>
noremap L <end>

" Map r to redo
map r :redo<return>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Map auto complete of (, ", ', [
inoremap *( ()<esc>i
inoremap *[ []<esc>i
" inoremap { {}<esc>i
inoremap { {<esc>o}<esc>O
" inoremap ' ''<esc>i
inoremap "" ""<esc>i
