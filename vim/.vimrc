set encoding=utf-8

" Enable vim specific features.
set nocompatible

set clipboard=unnamed

call plug#begin('~/.vim/plugged')

" Color schemes.
Plug 'chriskempson/base16-vim'

" Sidebar navigation.
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Better statusbar.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Project fuzzy finder.
Plug 'ctrlpvim/ctrlp.vim'

" Better support for surrounding text.
Plug 'tpope/vim-surround'

" Emmet for editing HTML, XML and CSS.
Plug 'mattn/emmet-vim'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" Typescript
Plug 'leafgarland/typescript-vim'

" Git
Plug 'tpope/vim-fugitive'

" Wiki
Plug 'vimwiki/vimwiki'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

call plug#end()

filetype plugin indent on

set history=200

" Set backup directory.
set backupdir=~/.vim/backups
set dir=~/.vim/backups

" Allow backspacing over line breaks and autoindent.
set backspace=2

" Set maximum width of a line being inserted.
set tw=78

set completeopt=longest,menuone

" Vimwiki configuration.
let wiki = {}
let wiki.path = '~/Documents/Notes'
let wiki.index = 'README'
let wiki.path_html = '~/Documents/Notes/public_html/'
let wiki.syntax = 'markdown'
let wiki.ext = '.md'
let wiki.nested_syntaxes = {'go': 'go', 'ruby': 'ruby', 'javascript': 'javascript', 'sh': 'sh'}
let g:vimwiki_list = [wiki]
let g:vimwiki_global_ext = 0
let g:markdown_folding = 1

augroup myvimwiki
  autocmd!
  au BufWinEnter *.md setlocal syntax=markdown
  au FileType vimwiki setlocal foldlevel=1
  au FileType vimwiki setlocal foldenable
  au FileType vimwiki setlocal foldmethod=expr
augroup END

" Assume POSIX compataible shell for sh scripts.
let g:is_posix = 1

" Always show statusbar.
set laststatus=2

" Show line numbers.
set number

" Default indentation rules.
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab

" Display extraneous whitespace.
set list listchars=tab:».,trail:¬,nbsp:·

" Use one space after punctuation.
set nojoinspaces

" Highlight current line.
" set cursorline

" Enable incremental search.
set incsearch

" Highlight search matches.
set hlsearch

" Enable syntax highlighting.
syntax on

set updatetime=300
set shortmess+=c
set signcolumn=yes

" Adjust leader and localleader keys.
let mapleader=","
let maplocalleader="\\"

" Faster window switching.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Save the current buffer.
nnoremap <leader>w :w<CR>

" Open the quickfix and location list.
nnoremap <leader>q :copen<CR>
nnoremap <leader>l :lopen<CR>

" Display buffer list.
nnoremap <leader>b :CtrlPBuffer<CR>

" Default colorscheme.
let base16colorspace=256
colorscheme base16-gruvbox-dark-hard
hi clear SignColumn
hi clear LineNR
hi LineNr ctermfg=238
hi Visual term=reverse cterm=reverse

set grepprg=ack\ --nogroup\ --column\ $*
set grepformat=%f:%l:%c:%m

" Show split windows at the bottom right of the screen.
set splitbelow
set splitright

" Airline settings.
let g:airline_powerline_fonts=0
let g:airline_theme='base16'

" Ultisnips settings.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Nerdtree settings.
nnoremap <leader>t :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.o$']

nmap <leader>sp :setlocal spell! spelllang=en_gb<CR>

augroup mylang
  autocmd!
  au FileType python setlocal autoindent smarttab formatoptions=croql
  au FileType ruby,eruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
  au BufNewFile,BufRead *.go setlocal ft=go
  au FileType go setlocal noexpandtab ts=4 sw=4 sts=4
  au FileType go setlocal nolist
  au FileType go nmap <Leader>i <Plug>(go-info)
  au FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
augroup END

" Go settings
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_metalinter_autosave = 1
let g:go_auto_type_info = 1
