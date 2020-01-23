if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Utility
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf.vim'
Plug '/usr/local/opt/fzf'
Plug 'editorconfig/editorconfig-vim'

" Generic Programming Support
Plug 'majutsushi/tagbar'
Plug 'luochen1990/rainbow'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-sleuth'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'
Plug 'terryma/vim-multiple-cursors'
Plug 'ervandew/supertab'
Plug 'nathanaelkane/vim-indent-guides'

" Terraform
Plug 'hashivim/vim-terraform'

" Markdown / writing
Plug 'plasticboy/vim-markdown'

" PlantUML
Plug 'aklt/plantuml-syntax'

" Yaml
Plug 'mrk21/yaml-vim'

" Theme / Interface
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'mhinz/vim-mix-format'
let g:mix_format_on_save = 1

" Ruby
Plug 'vim-ruby/vim-ruby'

call plug#end()

"""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""

" Generic Settings
filetype on                     " enable file type detection
filetype plugin on
filetype indent on
syntax enable                   " enable syntac highlight
set visualbell                  " don't beep
set noerrorbells                " don't beep
set mouse=a                     " Enable mouse integration
set backspace=indent,eol,start  " Let backspace work normal everywhere
set clipboard=unnamed           " Enable integration with system clipboard
set encoding=utf-8              " Encoding
set fileencoding=utf-8          " Encoding
set wildmenu                    " visual autocomplete for command menu
set nobackup
set nowritebackup
set noswapfile
set nofoldenable                " disable folding
set history=50                  " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set hidden                      " Allow to create a new buffer and change to new one without the need to save it
set showcmd                     " display incomplete commands
set laststatus=2                " Always display the status line
set nojoinspaces                " Use one space, not two, after punctuation
let mapleader = "\<Space>"      " Set space as leader

" Line numbers
set number                      " show line numbers
set relativenumber              " show relative linenumbers
set ruler                       " show file stats
set cursorline                  " enable highlighting of the current line

" Auto reload file when changed
set autoread                    " reload file when it has changed
au CursorHold * checktime

" Identation & Tab setting
" set autoindent
set expandtab                   " tabs are spaces
set tabstop=4                   " number of visual spaces per TAB
set shiftwidth=4                " soft space = 4
set smarttab                    " insert tabstop number of spaces when TAB is pressed
" set smartindent
set softtabstop=4               " let backspace delete indent

" Line breaking and formatting
set textwidth=120
set columns=120
set colorcolumn=121
set linebreak
set list                        " list disables linebreak
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set wrap                        " wrap long lines
set showbreak=...

" Search settings
set incsearch                   " search as characters are entered
set hlsearch                    " highlight matches
set ignorecase                  " ignore case when searching
set smartcase                   " enable smartcase
set noshowmatch                 " Don't match parentheses/brackets

" Theme and Styling
set termguicolors
colorscheme nord

" ----------------------------------------------------------------------
" Generic key mappings
" ----------------------------------------------------------------------
nnoremap <F5> "=strftime("%a %y-%m-%d")<CR>P
inoremap <F5> <C-R>=strftime("%a %y-%m-%d")<CR>

nnoremap <F6> "=strftime("%H:%M:%S")<CR>P
inoremap <F6> <C-R>=strftime("%H:%M:%S")<CR>

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
noremap <C-p> <ESC>:Buffers<CR> " Use CTRL-p to switch buffers

" Enable close of buffer in VIM using c
nnoremap c :bp\|bd #<CR>

"-----------------------------------------------------------------------
" Plugin settings
" ----------------------------------------------------------------------
" NerdTree
nnoremap <Leader>f :NERDTreeToggle<Enter>
let g:NERDTreeChDirMode = 2

map <Leader>r :NERDTreeFind<CR>                             " Change working directory in NerdTree
let NERDTreeAutoDeleteBuffer=1
let NERDTreeDirArrows=1
let NERDTreeShowBookmarks=1
let g:NERDTreeUpdateOnCursorHold=0
let g:NERDTreeUpdateOnWrite=0

function! NERDTreeRefresh()
    if &filetype == "nerdtree"
        silent exe substitute(mapcheck("R"), "<CR>", "", "")
    endif
endfunction

autocmd BufEnter * call NERDTreeRefresh()

" Git Gutter
set updatetime=300

" Fzf
map ; :Files<CR>

" Airline
let g:airline#extensions#tabline#enabled = 1

" Rainbow
let g:rainbow_active = 1

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3

" Vim Markdown
let g:vim_markdown_folding_disabled = 1

" ALE (Asynchronous Lint Engine)
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1

" Terraform settings
let g:terraform_align=1                                     " Align to community standards
autocmd FileType terraform setlocal commentstring=#%s       " Commentary settings
let g:terraform_fmt_on_save = 1                             " Terraform format on save

" Tabbar
nmap <F8> :TagbarToggle<CR>

" set formatting for xml
let $XMLLINT_INDENT="    "
command! FormatXml execute "%!xmllint --format -"
command! FormatJson execute "%!python -m json.tool"

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" set visual color section 
hi Visual guifg=Black guibg=LightBlue gui=none

