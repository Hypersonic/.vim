"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Initialization
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Pathogen!
runtime bundle/vim-pathogen/autoload/pathogen.vim
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

" Set folding to go by indentation
set foldmethod=indent

" Turn on syntax highlighting
syntax on

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

" Toggle paste mode easily
nmap <leader>PP :set paste!<cr>

" Split windows more logically
set splitbelow
set splitright

" mouse clicking because i'm a coward
set mouse=a

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
set matchpairs+=<:>  "Highlight <> pairs, such as in C++ templates

set mat=2 "How many tenths of a second to blink

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Show line numbers
set nu

" Show collumn color at 80
set colorcolumn=80

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use shift+navkeys as pgup, pgdown, home, and end
noremap J <pagedown>
noremap K <pageup>
noremap H <home>
noremap L <end>

" Tab movement
map <leader>tn :tabnext<return>
map <leader>tp :tabprev<return>
map <leader>tN :tabnew<return>
map <leader>tc :tabclose<return>

" Map r to redo
map r :redo<return>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Map auto complete of (, ", ', [
inoremap *( ()<esc>i
inoremap *[ []<esc>i
inoremap { {}<esc>i
autocmd BufNewFile,BufRead * inoremap { {}<esc>i
autocmd BufNewFile,BufRead *.java inoremap { {<esc>o}<esc>O
autocmd BufNewFile,BufRead *.cpp inoremap { {<esc>o}<esc>O
autocmd BufNewFile,BufRead *.c inoremap { {<esc>o}<esc>O
autocmd BufNewFile,BufRead *.css inoremap { {<esc>o}<esc>O
" inoremap ' ''<esc>i
inoremap "" ""<esc>i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" FuzzyFinder
map <leader>b :FufBuffer<cr>
map <leader>f :FufCoverageFile<cr>

" ALE
" no linters, just formatters:
autocmd BufNewFile,BufRead * let b:ale_linters = []
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\    'c': ['clang-format'],
\    'cpp': ['clang-format'],
\    'python': ['black'],
\    'go': ['gofmt'],
\    'rust': ['rustfmt'],
\    'javascript': ['prettier'],
\}

" vim-markdown
let g:vim_markdown_fenced_languages = ['js=javascript', 'c++=cpp']

" vim-lsp
if executable('ccls')
	au User lsp_setup call lsp#register_server({
		\ 'name': 'ccls',
		\ 'cmd': {server_info->['ccls']},
		\ 'root_uri':{server_info->lsp#utils#path_to_uri(
		\	lsp#utils#find_nearest_parent_file_directory(
		\		lsp#utils#get_buffer_path(),
		\		['.ccls', 'compile_commands.json', '.git/']
		\	))},
		\ 'initialization_options': {},
		\ 'allowlist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
		\ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
