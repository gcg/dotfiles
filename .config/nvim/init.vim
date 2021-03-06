call plug#begin(stdpath('data') . '/plugged')


Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ekalinin/Dockerfile.vim'
Plug 'chr4/nginx.vim'
Plug 'roxma/nvim-yarp'
Plug 'wakatime/vim-wakatime'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-surround'


" CTRLP
Plug 'ctrlpvim/ctrlp.vim'
map <D-p> :CtrlP<cr>
map <C-r> :CtrlPBufTag<cr>

" NERDTree
Plug 'scrooloose/nerdtree'
let NERDTreeShowHidden=1
nmap <C-b> :NERDTreeToggle<cr>


" Syntastic
Plug 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_checkers=['']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_aggregate_errors = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = './node_modules/.bin/eslint'
let g:syntastic_php_phpcs_exec = './vendor/bin/phpcs'
let g:syntastic_php_phpmd_exec = './vendor/bin/phpmd'



" Tagbar
Plug 'preservim/tagbar'
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

" Gitgutter
Plug 'airblade/vim-gitgutter'
let g:gitgutter_max_signs = 2000
let g:ragtag_global_maps = 1


" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'kevinoid/vim-jsonc'
Plug 'elzr/vim-json'
" vim-jsx (react)
Plug 'maxmellon/vim-jsx-pretty'
let g:jsx_ext_required = 0
" TypeScript
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

" Vim-go
Plug 'fatih/vim-go'
Plug 'rhysd/vim-go-impl'
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
set omnifunc=go#complete#Complete


" UltiSnips
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
if !exists("g:UltiSnipsJumpForwardTrigger")
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif


" PHP
Plug 'StanAngeloff/php.vim'
Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
Plug 'jwalton512/vim-blade'
autocmd BufNewFile,BufRead *.blade.php set ft=html | set ft=phtml | set ft=blade " Fix blade auto-indent"

" Vim-Markdown
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1 "markdown folding

" Lightline
Plug 'itchyny/lightline.vim'
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
	  \   'readonly': 'LightlineReadonly',
	  \   'modified': 'LightlineModified',
      \   'gitbranch': 'LightlineFugitive'
      \ },
	  \ 'separator': { 'left': '', 'right': '' },
	  \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightlineReadonly()
    return &readonly ? '' : ''
endfunction
function! LightlineModified()
	return &modifiable && &modified ? '+' : ''
endfunction
function! LightlineFugitive()
    if exists('*FugitiveHead')
        let branch = FugitiveHead()
        return branch !=# '' ? ' '.branch : ''
    endif
    return ''
endfunction


" Hexokinase
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
let g:Hexokinase_highlighters = [ 'sign_column' ]
let g:Hexokinase_ftEnabled = ['css', 'html', 'scss']
set termguicolors

" Rainbow
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" :CocInstall coc-blade-formatter coc-json coc-tailwindcss coc-css coc-discord coc-go coc-html coc-phpactor coc-yaml coc-swagger coc-svg coc-sh coc-psalm coc-phpls coc-phpactor

" Ale
Plug 'dense-analysis/ale'
let g:ale_linters_explicit = 1
let g:ale_set_balloons = 1
let g:ale_sign_column_always = 1
let g:ale_linters = {
    \'javascript': ['eslint'],
    \'php': ['langserver', 'phpcs', 'phpmd', 'psalm'],
    \ 'html': ['eslint'],
    \ 'css': ['eslint'],
    \ 'json': ['eslint'],
    \ 'typescript': ['eslint'],
    \}
let g:ale_php_phpcs_executable = "./vendor/bin/phpcs"
let g:ale_php_phpmd_executable = './vendor/bin/phpmd'
let g:ale_php_phpmd_ruleset = './phpmd.xml'
let g:ale_set_highlights = 0
let g:ale_echo_msg_format = '%linter%: %s'
let g:ale_fix_on_save = 1
let g:ale_fixers = {
    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \   'javascript': ['remove_trailing_lines', 'trim_whitespace', 'eslint', 'prettier'],
    \   'typescript': ['remove_trailing_lines', 'trim_whitespace', 'eslint', 'prettier'],
    \ 'json': ['prettier', 'eslint'],
    \ 'css': ['prettier'],
      \   'HTML': ['HTMLHint', 'proselint'],
      \   'go': ['gofmt', 'goimports'],
      \   'php': ['phpcbf'],
    \}



call plug#end()

" base config
let g:python3_host_prog = '/usr/bin/python3'
syntax on
syntax enable
colorscheme monokai
set mouse=a
set number
set relativenumber
set autoindent
set copyindent
set clipboard=unnamedplus
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set shiftround
set tags=tags
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set wildignore+=*/vendor/**         " I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/public/**         " I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/node_modules/**   " I don't want to pull up these folders/files when calling CtrlP

let mapleader = ","
let g:mapleader = ","
let g:EasyMotion_leader_key = '<Leader>'


" Mappings
nmap :sp :rightbelow sp<cr>
nmap vs :vsplit<cr>
nmap sp :split<cr>
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <leader>qa :qa<cr>
nmap <leader>q! :q!<cr>
nmap <leader>gca :Gcommit -a -S<cr>
nmap <leader>gp :Gpush<cr>
nmap <leader>gl :Gpull<cr>
nmap <leader>gst :Gstatus<cr>
nmap <leader>c :!composer install <cr>
nmap cn :cn<cr>

nnoremap j gj
nnoremap k gk
imap jj <esc>


" Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" Familiar commands for file/symbol browsing
map <D-p> :CtrlP<cr>
map <C-r> :CtrlPBufTag<cr>

" Search
autocmd cursorhold * set nohlsearch
autocmd cursormoved * set hlsearch
set incsearch
highlight Search cterm=underline
command! H let @/="" " Remove search results
autocmd BufWritePre *.php :%s/\s\+$//e

" do not continue comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
