if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Utility
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'majutsushi/tagbar'
Plug 'gilsondev/searchtasks.vim'
Plug 'godlygeek/tabular'

" Generic Programming Support
Plug 'tpope/vim-fugitive'
Plug 'alvan/vim-closetag'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'tomtom/tcomment_vim'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'terryma/vim-multiple-cursors'
Plug 'ervandew/supertab'
Plug 'Townk/vim-autoclose'

" Terraform
Plug 'hashivim/vim-terraform'

" Markdown / writing
Plug 'plasticboy/vim-markdown'

" PlantUML
Plug 'aklt/plantuml-syntax'

" Theme / Interface
Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'arcticicestudio/nord-vim'

" Elixer
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
" Key mappings
" ----------------------------------------------------------------------
map ; :Files<CR>

nnoremap <F5> "=strftime("%a %y-%m-%d")<CR>P
inoremap <F5> <C-R>=strftime("%a %y-%m-%d")<CR>

nnoremap <F6> "=strftime("%H:%M:%S")<CR>P
inoremap <F6> <C-R>=strftime("%H:%M:%S")<CR>

nnoremap <Leader>w :w<CR>       " Save using <Leader>w

nmap <silent> <leader>ev :e $MYVIMRC<CR>    " edit vimrc
nmap <silent> <leader>sv :so $MYVIMRC<CR>   " save vimrc
nmap <silent> <Leader>eb :e ~/.zshrc<CR>    " edit .zshrc

" Quick VimWiki mapping
nmap <silent> <Leader>gt :e ~/Dropbox/vimwiki/todo.md<CR>           " quick open todo list
nmap <silent> <Leader>gp :e ~/Dropbox/vimwiki/philips/index.md<CR>  " goto philips page
nmap <leader>c :Calendar<CR>                                        " open calendar

" NerdTree
map <Leader>r :NERDTreeFind<CR>                             " Change working directory in NerdTree
let NERDTreeAutoDeleteBuffer=1
let NERDTreeDirArrows=1
let NERDTreeShowBookmarks=1

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

" Lightline settings
let g:lightline = {
    \       'active': {
    \           'right': [ 
    \               [ 'mode', 'paste' ],
    \               [ 'gitbranch', 'readonly', 'filename', 'modified' ]
    \           ]
    \       },
    \       'component': {
    \           'lineinfo': ' %3l:%-2v',
    \       },
    \       'component_function': {
    \           'gitbranch': 'fugitive#head',
    \       }
    \ }

let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline.tabline          = {'left': [['buffers']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
set showtabline=2
autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
