set nocompatible                " Don't try to be vi compatible
filetype off                    " Helps force plugins to load correctly when it is turned back on below

" Install plugins usinf Vundle
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Asciidoc
Plugin 'dagwieers/asciidoc-vim'

" Terraform
Plugin 'hashivim/vim-terraform'

" Markdown
Plugin 'plasticboy/vim-markdown'
Plugin 'godlygeek/tabular'

" Docker
Plugin 'ekalinin/dockerfile.vim'

" Git support
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Utility
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'vimwiki'

" Generic Programming Support
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tomtom/tcomment_vim'
Plugin 'majutsushi/tagbar'

" Theme / Interface
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" PlantUML
Plugin 'aklt/plantuml-syntax'
call vundle#end()

filetype on                     " Enable file type detection
syntax on                       " Enable syntac highlight
filetype plugin indent on       " Allow intelligent auto-indenting for each filetype and plugin
set autoread                    " Reload file when it has changed
au CursorHold * checktime

" Appearance options
colorscheme default

" Identation & Tab setting
set tabstop=4                   " number of visual spaces per TAB
set shiftwidth=4                " soft space = 4
set expandtab                   " tabs are spaces
set smarttab
set smartindent
set autoindent
set softtabstop=4               " let backspace delete indent
set nowrap                      " wrap long lines

" Search settings
set incsearch                   " search as characters are entered
set hlsearch                    " highlight matches
set ignorecase                  " ignore case when searching
set smartcase                   " enable smartcase
set showmatch                   " highlight matching [{()}<<<<<<]

hi MatchParen cterm=bold ctermbg=none ctermfg=magenta   " set colors for matching braces
set mouse=a                     " Enable mouse integration
set backspace=indent,eol,start  " Let backspace work normal everywhere
set clipboard=unnamed           " Enable integration with system clipboard
set number                      " Show line numbers
set relativenumber              " Show relative linenumbers
set ruler                       " Show file stats
set encoding=utf-8              " Encoding
set fileencoding=utf-8          " Encoding
set cursorline                  " highlight current line
set wildmenu                    " visual autocomplete for command menu
set nobackup
set nowritebackup
set noswapfile
set history=50                  " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set visualbell                  " don't beep
set noerrorbells                " don't beep
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set hidden                      " Allow to create a new buffer and change to new one without the need to save it
set showcmd                     " display incomplete commands
set laststatus=2                " Always display the status line
set nojoinspaces                " Use one space, not two, after punctuation
let mapleader = "\<Space>"      " Set space as leader
set textwidth=120               " Make it obvious where 120 characters is
set colorcolumn=+1

" ----------------------------------------------------------------------
" Key mappings
" ----------------------------------------------------------------------
nnoremap <Leader>o :CtrlP<CR>   " Open CtrlP using <Leader>
nnoremap <Leader>w :w<CR>       " Save using <Leader>w

nmap <silent> <leader>ev :e $MYVIMRC<CR>    " edit vimrc
nmap <silent> <leader>sv :so $MYVIMRC<CR>   " save vimrc
nmap <silent> <Leader>eb :e ~/.zshrc<CR>    " edit .zshrc

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

" Enable close of buffer in VIM using c
nnoremap c :bp\|bd #<CR>

"-----------------------------------------------------------------------
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

" NerdTree
nnoremap <Leader>f :NERDTreeToggle<Enter>
let g:NERDTreeChDirMode = 2

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3

" Vim Airline
" let g:airline#extensions#tabline#enabled = 1

" Vimwiki
let g:vimwiki_global_ext=0
let g:vimwiki_root = '~/Dropbox/vimwiki'
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
