execute pathogen#infect()
syntax on
filetype plugin indent on
set number
set relativenumber
set nocompatible 
set t_Co=256
set mouse=a
syntax enable
colorscheme monokai

set guifont=Monaco\ for\ Powerline:h16
set linespace=12
set tabstop=4
set smarttab
set showmode
set tags=tags
set softtabstop=4 
set expandtab  
set shiftwidth=4
set shiftround
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set timeout timeoutlen=200 ttimeoutlen=100
set visualbell           " don't beep
set noerrorbells         " don't beep
set autowrite  "Save on buffer switch

let mapleader = ","
let g:mapleader = ","

nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <leader>qa :qa<cr>
nmap <leader>q! :q!<cr>


nmap <leader>gca :Gcommit -a<cr>
nmap <leader>gp :Gpush<cr>
nmap <leader>gl :Gpull<cr>
nmap <leader>gst :Gstatus<cr>

" Down is really the next line
nnoremap j gj
nnoremap k gk

"Easy escaping to normal model
imap jj <esc>

"Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

"easier window navigation  
"nmap <C-h> <C-w>h
"nmap <C-j> <C-w>j
"nmap <C-k> <C-w>k
"nmap <C-l> <C-w>l

"nmap <C-v> :vertical resize +5<cr>
"nmap <C-h> :res +5<cr>
"nmap 25 :vertical resize 40<cr>
"nmap 50 <c-w>=
"nmap 75 :vertical resize 120<cr>


set clipboard=unnamed

nmap <C-b> :NERDTreeToggle<cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

set showcmd

nmap :sp :rightbelow sp<cr>
nmap vs :vsplit<cr>
nmap sp :split<cr>

nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>

highlight Search cterm=underline

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set noswapfile

let g:EasyMotion_leader_key = '<Leader>'

"Powerline
let g:Powerline_symbols = 'fancy'
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

autocmd cursorhold * set nohlsearch
autocmd cursormoved * set hlsearch

" Remove search results
command! H let @/=""

autocmd BufWritePre *.php :%s/\s\+$//e

nmap <leader>lr :e app/routes.php<cr>
nmap <leader>lca :e app/config/app.php<cr>81Gf(%O
nmap <leader>lcd :e app/config/database.php<cr>
nmap <leader>lc :e composer.json<cr>

" do not continue comments 
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Familiar commands for file/symbol browsing
map <D-p> :CtrlP<cr>
map <C-r> :CtrlPBufTag<cr>


" I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/public/**
set wildignore+=*/node_modules/**

let NERDTreeShowHidden=1

"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled=1

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_checkers=['']

"tagbar
nmap <F8> :TagbarToggle<CR>

let g:tagbar_type_php  = {
            \ 'ctagstype' : 'php',
            \ 'kinds'     : [
            \ 'i:interfaces',
            \ 'c:classes',
            \ 'd:constant definitions',
            \ 'f:functions',
            \ 'j:javascript functions:1'
            \ ]
            \ }

let g:gitgutter_max_signs = 2000

let g:ragtag_global_maps = 1 

"phpfmt
let g:phpfmt_on_save = get(g:, 'phpfmt_on_save', 1)
let g:phpfmt_php_path = "php"
let g:phpfmt_enable_default_mapping = 1

"vim-jsx (react)
let g:jsx_ext_required = 1

"YCM
let g:ycm_autoclose_preview_window_after_completion = 1

"Vim-go
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

autocmd BufNewFile,BufRead *.blade.php set ft=html | set ft=phtml | set ft=blade " Fix blade auto-indent"
