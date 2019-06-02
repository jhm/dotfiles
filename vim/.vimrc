set encoding=utf-8

" Enable vim specific features.
set nocompatible

filetype off

set clipboard=unnamed

call plug#begin('~/.vim/plugged')

" Color schemes.
function FixupBase16(info)
  !sed -i '/Base16hi/\! s/a:\(attr\|guisp\)/l:\1/g' ~/.vim/plugged/base16-vim/colors/*.vim
endfunction
Plug 'chriskempson/base16-vim', { 'do': function('FixupBase16') }

Plug 'altercation/vim-colors-solarized'

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

" Syntax checking.
Plug 'scrooloose/syntastic'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

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
" set timeoutlen=1000 ttimeoutlen=0

" Set backup directory.
set backupdir=~/.vim/backups
set dir=~/.vim/backups

" Allow backspacing over line breaks and autoindent.
set backspace=2

" Set maximum width of a line being inserted.
set tw=78

" Vimwiki configuration.
let wiki = {}
let wiki.path = '~/Documents/Notes'
let wiki.index = 'README'
let wiki.path_html = '~/Documents/Notes/public_html/'
let wiki.syntax = 'markdown'
let wiki.ext = '.md'
let wiki.nested_syntaxes = {'ruby': 'ruby', 'javascript': 'javascript', 'sh': 'sh'}
let g:vimwiki_list = [wiki]
let g:vim_markdown_folding_disabled = 1
" let g:vimwiki_folding='expr'

" Assume POSIX compataible shell for sh scripts.
let g:is_posix = 1

" Always show statusbar.
set laststatus=2

" Show line numbers.
set number
set numberwidth=4

" Enable folding.
set foldmethod=syntax
set foldlevel=99

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

" Save the current buffer.
nnoremap <leader>w :w<CR>

" Open the quickfix and location list.
nnoremap <leader>q :copen<CR>
nnoremap <leader>l :lopen<CR>

" Display buffer list.
nnoremap <leader>b :CtrlPBuffer<CR>

" Default colorscheme.
let base16colorspace=256
"set background=light
colorscheme base16-tomorrow-night
hi clear LineNR
hi LineNr ctermfg=238

"set background=light
" colorscheme base16-solarized-light
" hi clear LineNR
" hi LineNr ctermfg=250

set grepprg=ack\ --nogroup\ --column\ $*
set grepformat=%f:%l:%c:%m

" Show split windows at the bottom right of the screen.
set splitbelow
set splitright

" Airline settings.
let g:airline_powerline_fonts=1
let g:airline_theme='base16'

" YCM settings.
let g:ycm_autoclose_preview_window_after_completion=1

" Ultisnips settings.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Nerdtree settings.
nnoremap <leader>t :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.o$']

" Rust settings.
let g:rustfmt_autosave = 1

" Syntastic settings.
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Python settings.
autocmd FileType python setlocal autoindent smarttab formatoptions=croql

" Ruby settings.
autocmd FileType ruby,eruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Go settings.
autocmd BufNewFile,BufRead *.go setlocal ft=go
autocmd FileType go setlocal noexpandtab ts=4 sw=4 sts=4
autocmd FileType go setlocal nolist
" listchars=trail:¬,nbsp:·
autocmd FileType go nmap <Leader>i <Plug>(go-info)

" Javascript settings.
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2


