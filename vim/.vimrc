set nocompatible                " Don't try to be vi compatible
filetype off                    " Helps force plugins to load correctly when it is turned back on below

" Install plugins usinf Vundle
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Vimwiki
Plugin 'vimwiki/vimwiki'

" Asciidoc
Plugin 'dagwieers/asciidoc-vim'

" Terraform
Plugin 'hashivim/vim-terraform'

" Markdown
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'plasticboy/vim-markdown'

" Docker
Plugin 'docker/docker'

" Git support
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Utility
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'irrationalistic/vim-tasks'
Plugin 'easymotion/vim-easymotion'

" Generic Programming Support
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'sheerun/vim-polyglot'
Plugin 'tomtom/tcomment_vim'
Plugin 'neomake/neomake'

" Theme / Interface
Plugin 'itchyny/lightline.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'morhetz/gruvbox'

" PlantUML
Plugin 'aklt/plantuml-syntax'

" Elixir Support
Plugin 'elixir-lang/vim-elixir'
Plugin 'avdgaag/vim-phoenix'
Plugin 'mmorearty/elixir-ctags'
Plugin 'mattreduce/vim-mix'
Plugin 'BjRo/vim-extest'
Plugin 'frost/vim-eh-docs'
Plugin 'slashmili/alchemist.vim'
Plugin 'tpope/vim-endwise'
Plugin 'jadercorrea/elixir_generator.vim'
call vundle#end()

filetype on                     " Enable file type detection
filetype plugin indent on       " Allow intelligent auto-indenting for each filetype and plugin

" Appearance options
colorscheme default
set bg=dark
syntax enable
syntax sync fromstart

" Identation & Tab setting
set tabstop=2                   " number of visual spaces per TAB
set shiftwidth=2                " soft space = 2
set smarttab
set expandtab                   " tabs are spaces
set smartindent

set softtabstop=2               " let backspace delete indent
set nowrap                      " wrap long lines

" Search settings
set incsearch                   " search as characters are entered
set hlsearch                    " highlight matches
set ignorecase                  " ignore case when searching
set smartcase                   " enable smartcase
set showmatch                   " highlight matching [{()}<<<<<<]
nmap <Leader>c :let@/=''<cr>    " clear search using <Leader>c
nnoremap / /\v
vnoremap / /\v

set mouse=a                     " Enable mouse integration
set backspace=indent,eol,start  " Let backspace work normal everywhere
set clipboard=unnamed           " Enable integration with system clipboard
set modelines=0                 " Security
set number                      " Show line numbers
set relativenumber              " Show relative linenumbers
set ruler                       " Show file stats
set encoding=utf-8              " Encoding
set fileencoding=utf-8          " Encoding
set ttyfast                     " Rendering
set cursorline                  " highlight current line
set wildmenu                    " visual autocomplete for command menu
set wrap                        " Line wrapping on by default
set linebreak
set scrolloff=5
set nobackup
set noswapfile
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                       " change the terminal's title
set visualbell                  " don't beep
set noerrorbells                " don't beep
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set hidden                      " Allow to create a new buffer and change to new one without the need to save it
let mapleader = "\<Space>"      " Set space as leader

" ----------------------------------------------------------------------
" Key mappings
" ----------------------------------------------------------------------
nnoremap <Leader>o :CtrlP<CR>   " Open CtrlP using <Leader>
nnoremap <Leader>w :w<CR>       " Save using <Leader>w

nmap <silent> <leader>ev :e $MYVIMRC<CR>    " edit vimrc
nmap <silent> <leader>sv :so $MYVIMRC<CR>   " save vimrc
nmap <silent> <Leader>eb :e ~/.zshrc<CR>    " edit .zshr

" Copy and paste to system clipboard using <Leader>p and <Leader>y
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Formatting
vmap Q gq                       " Format the current paragraph
nmap Q gqap                     " Format the current paragraph
nnoremap j gj
nnoremap k gk

" Line movement
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Buffer handling
nmap <leader>l :bnext<CR>       " Goto next buffer
nmap <leader>h :bprevious<CR>   " Goto previous buffer
nmap <leader>T :enew<cr>        " Open new buffer
nnoremap <Tab> :bnext<CR>       " Use <TAB> to change to next buffer
nnoremap <S-Tab> :bprevious<CR> " Use <TAB> to change to previous buffer
nnoremap <C-X> :bdelete<CR>     " use <Ctrl-X> to delete the current buffer

nmap <silent> <leader>ch :exec 'silent !open -a "Google Chrome" % &'

" ----------------------------------------------------------------------
" Plugin settings
" ----------------------------------------------------------------------
" NeoComplete
let g:neocomplete#enable_at_startup = 1

" Syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Markdown settings
let g:vim_markdown_folding_disabled=1

" Markdown preview settings
let vim_markdown_preview_toggle=1
let vim_markdown_preview_temp_file=1
let vim_markdown_preview_browser='Google Chrome'

" NerdTree
nnoremap <Leader>f :NERDTreeToggle<Enter>
" let NERDTreeQuitOnOpen = 1

" vim-indent-guides
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 1

" Vimwiki settings
let g:vimwiki_list = [{'path': '$HOME/Dropbox/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]

" Enable close of buffer in VIM using c
nnoremap c :bp\|bd #<CR>

nnoremap <leader>n :e ~/Dropbox/notes
