if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Asciidoc
Plug 'dagwieers/asciidoc-vim'

" Terraform
Plug 'hashivim/vim-terraform'

" Utility
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'editorconfig/editorconfig-vim'

" Markdown
Plug 'plasticboy/vim-markdown'

" PlantUML
Plug 'aklt/plantuml-syntax'

" Vimwiki
Plug 'vimwiki/vimwiki'

" Generic Programming Support
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'tomtom/tcomment_vim'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'terryma/vim-multiple-cursors'

" Theme / Interface
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nanotech/jellybeans.vim'

call plug#end()

filetype on                     " Enable file type detection
syntax on                       " Enable syntac highlight
filetype plugin on
set autoread                    " Reload file when it has changed
au CursorHold * checktime

" Appearance options
set termguicolors
colorscheme jellybeans

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
" set showmatch                   " highlight matching [{()}<<<<<<]
set noshowmatch                 " Don't match parentheses/brackets

hi MatchParen cterm=bold ctermbg=none ctermfg=magenta   " set colors for matching braces
set mouse=a                     " Enable mouse integration
set backspace=indent,eol,start  " Let backspace work normal everywhere
set clipboard=unnamed           " Enable integration with system clipboard
set number                      " Show line numbers
set relativenumber              " Show relative linenumbers
set ruler                       " Show file stats
set encoding=utf-8              " Encoding
set fileencoding=utf-8          " Encoding
" set cursorline                  " highlight current line
set nocursorline                " Don't paint cursor line
set nocursorcolumn              " Don't paint cursor column

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
map ; :Files<CR>

nnoremap <F5> "=strftime("%a %y-%m-%d")<CR>P
inoremap <F5> <C-R>=strftime("%a %y-%m-%d")<CR>

nnoremap <F6> "=strftime("%H:%M:%S")<CR>P
inoremap <F6> <C-R>=strftime("%H:%M:%S")<CR>

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

" NerdTree
nnoremap <Leader>f :NERDTreeToggle<Enter>
let g:NERDTreeChDirMode = 2

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3

" Vim Airline
let g:airline#extensions#tabline#enabled = 1

" Vimwiki
let g:vimwiki_global_ext=0
let g:vimwiki_root = '~/Dropbox/vimwiki'
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
"
" " Vim Markdown
let g:vim_markdown_folding_disabled = 1

" ALE (Asynchronous Lint Engine)
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1

" Terraform settings
let g:terraform_align=1                                     " Align to community standards
autocmd FileType terraform setlocal commentstring=#%s       " Commentary settings
let g:terraform_fmt_on_save = 1                             " Terraform format on save
