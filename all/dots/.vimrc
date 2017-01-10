set encoding=utf-8

" Enable vim specific features.
set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Color schemes.
Plugin 'nanotech/jellybeans.vim'
Plugin 'vim-scripts/twilight256.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'altercation/vim-colors-solarized'

" Navigation.
Plugin 'scrooloose/nerdtree'

" Improved indentation for Python.
Plugin 'vim-scripts/indentpython.vim'

" Autocomplete.
Bundle 'Valloric/YouCompleteMe'

" Better statusbar.
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Project fuzzy finder
Plugin 'ctrlpvim/ctrlp.vim'

" Better support for surrounding text.
Plugin 'tpope/vim-surround'

" Emmet for editing HTML, XML and CSS.
Plugin 'mattn/emmet-vim'

" .editorconfig support.
Plugin 'editorconfig/editorconfig-vim'

" Snippet support.
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Syntax checking.
Plugin 'scrooloose/syntastic'

" Ruby
Plugin 'vim-ruby/vim-ruby'

" Elixir
Plugin 'elixir-lang/vim-elixir'

" Git.
Plugin 'tpope/vim-fugitive'

" Wiki
Plugin 'vimwiki/vimwiki'

" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" Syntax highlighting for single file vue components.
Plugin 'posva/vim-vue'

call vundle#end()
filetype plugin indent on

set timeoutlen=1000 ttimeoutlen=0

" Set backup directory.
set backupdir=~/.vim/backups
set dir=~/.vim/backups

set backspace=2

" Set vimwiki and options.
let g:vimwiki_list = [{'path': '~/Notes/', 'path_html': '~/Notes/public_html/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_folding='expr'

" Always show statusbar.
set laststatus=2

" Show line numbers.
set number
set numberwidth=4

" Enable folding.
set foldmethod=syntax
set foldlevel=99

" Default indentation rules.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Display extraneous whitespace.
set list listchars=tab:».,trail:¬,nbsp:·

" Use one space after punctuation.
set nojoinspaces

" Highlight current line.
set cursorline

" Enable incremental search.
set incsearch

" Highlight search matches.
set hlsearch

" Enable syntax highlighting.
syntax on

" Adjust leader and localleader keys.
let mapleader=","
let maplocalleader="\\"

" Faster window switching.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Default colorscheme.
let base16colorspace=256
colorscheme base16-default-dark

" Show split windows at the bottom right of the screen.
set splitbelow
set splitright

" Airline settings.
let g:airline_powerline_fonts=1
let g:airline_theme='base16'

" YCM settings.
let g:ycm_autoclose_preview_window_after_completion=1

" Ultisnips settings.
let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Nerdtree settings.
nnoremap <leader>t :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.o$']

" Python settings.
autocmd FileType python setlocal autoindent smarttab formatoptions=croql

" Ruby settings.
" autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Go settings.
autocmd BufNewFile,BufRead *.go setlocal ft=go
autocmd FileType go setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4

" Javascript settings.
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
