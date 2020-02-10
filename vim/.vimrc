if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf.vim'
Plug '/usr/local/opt/fzf'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/goyo.vim'
Plug 'pbrisbin/vim-mkdir'
Plug 'gilsondev/searchtasks.vim'
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'terryma/vim-multiple-cursors'
Plug 'ervandew/supertab'
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'

" Terraform
Plug 'hashivim/vim-terraform'

" Markdown / writing
Plug 'dhruvasagar/vim-table-mode'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" PlantUML
Plug 'aklt/plantuml-syntax'

" Yaml
Plug 'mrk21/yaml-vim'

" Theme / Interface
Plug 'ryanoasis/vim-devicons'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'luochen1990/rainbow'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'NLKNguyen/papercolor-theme'

" Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'mhinz/vim-mix-format'

" Ruby
Plug 'vim-ruby/vim-ruby'

" Toml
Plug 'cespare/vim-toml'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on                  " Enable filetype plugins
filetype indent on
set autoread                        " Set to auto read when a file is changed from the outside
au CursorHold * checktime
let mapleader = "\<Space>"          " Set space as leader
let maplocalleader = "\\"
set encoding=utf8                   " Set utf8 as standard encoding and en_US as the standard language
set ffs=unix,dos,mac                " Use Unix as the standard file type
set nobackup                        " Turn backup off, since most stuff is in SVN, git et.c anyway...
set nowritebackup
set noswapfile
set mouse=a                         " Enable mouse integration
set nojoinspaces                    " Use one space, not two, after punctuation
set number relativenumber           " show line numbers
set clipboard=unnamed               " Enable integration with system clipboard
set history=50                      " remember more commands and search history
set undolevels=1000                 " use many muchos levels of undo
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set hidden                          " Allow to create a new buffer and change to new one without the need to save it
set showcmd                         " display incomplete commands
syntax enable                       " Enable syntax highlighting

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set so=7                            " Set 7 lines to the cursor - when moving vertically using j/k
set wildmenu                        " Turn on the Wild menu
set wildignore=*.o,*~,*.pyc         " Ignore compiled files
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set ruler                           " Always show current position
set cmdheight=1                     " Height of the command bar
set hid                             " A buffer becomes hidden when it is abandoned
set backspace=eol,start,indent      " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l
set smartcase                       " When searching try to be smart about cases
set hlsearch                        " Highlight search results
set incsearch                       " Makes search act like search in modern browsers
set magic                           " For regular expressions turn magic on
set showmatch                       " Show matching brackets when text indicator is over them
set noerrorbells                    " No annoying sound on errors
set ignorecase                      " Ignore case when searching
set novisualbell
set t_vb=
set tm=500
if has("gui_macvim")                " Properly disable sound on errors on MacVim
    autocmd GUIEnter * set vb t_vb=
endif
set cursorline                      " enable highlighting of the current line
set laststatus=2                    " Always show the status line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors
set guifont=hack\ nerd\ font:h16
set background=light
colorscheme PaperColor

" set visual color section 
" hi Visual guifg=Black guibg=LightBlue gui=none

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab                       " Use spaces instead of tabs
set smarttab                        " Be smart when using tabs ;)
set shiftwidth=4                    " 1 tab == 4 spaces
set tabstop=4
set linebreak                       " Linebreak on 500 characters
set textwidth=120
set softtabstop=4                   " Let backspace delete indent
set autoindent                      " Auto indent
set smartindent                     " Smart indent
set wrap                            " Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Generic key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^
map ; :Files<CR>

" Insert date
nnoremap <F5> "=strftime("%a %y-%m-%d")<CR>P
inoremap <F5> <C-R>=strftime("%a %y-%m-%d")<CR>
" Insert time
nnoremap <F6> "=strftime("%H:%M:%S")<CR>P
inoremap <F6> <C-R>=strftime("%H:%M:%S")<CR>

" Save using <Leader>w
nnoremap <Leader>w :w<CR>

" Disable highlight when <Leader><CR> is pressed
nmap <silent> <Leader><CR> :noh<CR>

" Move lines
"move current line to the end of buffer without moving cursor
nnoremap <Leader>mv ddGp``
"copy current line to the end of buffer without moving cursor
nnoremap <Leader>cp YGp``

" edit / source vimrc
nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>sv :so $MYVIMRC<CR>

" edit .zshrc
nmap <silent> <Leader>eb :e ~/.zshrc<CR>    

" clean views
nmap <silent> <Leader>cv :!rm -f ~/.vim/view/*=<CR>

" notes and todo
" nmap <silent> <Leader>gt :e ~/Dropbox/notes/todo.md<CR>
nmap <silent> <Leader>gn :NERDTree ~/Dropbox/notes<CR>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Pressing <Leader>ss will toggle and untoggle spell checking
map <Leader>ss :setlocal spell!<CR>

" Zoom behaviour
noremap Zz <c-w>_ \| <c-w>\|
noremap Zo <c-w>noremap Zo <c-w>==

" Remember Folds
augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave *.* mkview!
  autocmd BufWinEnter *.* silent loadview
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Line movement
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Buffer handling
nmap <Leader>l :bnext<CR>       " Goto next buffer
nmap <Leader>h :bprevious<CR>   " Goto previous buffer
nmap <Leader>T :enew<CR>        " Open new buffer
nnoremap <Tab> :bnext<CR>       " Use <TAB> to change to next buffer
nnoremap <S-Tab> :bprevious<CR> " Use <TAB> to change to previous buffer
nnoremap <C-X> :bdelete<CR>     " use <Ctrl-X> to delete the current buffer
noremap <C-p> <ESC>:Buffers<CR> " Use CTRL-p to switch buffers

" Close all the buffers
map <Leader>ba :bufdo bd<CR>

" Enable close of buffer in VIM using c
nnoremap c :bp\|bd #<CR>

" Use <Ctrl-X> to delete the current buffer
nnoremap <C-X> :bdelete<CR>     

" Use CTRL-p to switch buffers
noremap <C-p> <ESC>:Buffers<CR> 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" Vim Table Mode
let g:table_mode_corner="|"
noremap <Leader>tm :TableModeToggle<CR>     " Enable/Disable tablemode

" Elixir
let g:mix_format_on_save = 1

" Devicons
let g:webdevicons_enable = 1

" Goyo
let g:goyo_width=160
nmap <Leader>gy :Goyo<CR>       " Enable/Disable Goyo mode

" Git Gutter
set updatetime=300

" Fzf
map ; :Files<CR>

" Rainbow
let g:rainbow_active = 1

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3

" Vim Markdown
let vim_markdown_folding_disabled = 1
let g:markdown_folding = 1
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_strikethrough = 1

" ALE (Asynchronous Lint Engine)
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1

" Terraform settings
let g:terraform_align=1                                     " Align to community standards
autocmd FileType terraform setlocal commentstring=#%s       " Commentary settings
let g:terraform_fmt_on_save = 1                             " Terraform format on save

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Lightline settings
let g:lightline = {
    \ 'colorscheme': 'PaperColor',
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

" set formatting for xml
let $XMLLINT_INDENT="    "
command! FormatXml execute "%!xmllint --format -"
command! FormatJson execute "%!python -m json.tool"

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" VimWiki
let g:vimwiki_folding = 'expr:quick'
let g:vimwiki_list = [{'path': '~/Dropbox/notes/',
              \ 'syntax': 'markdown', 'ext': '.md'}]
autocmd FileType vimwiki set ft=markdown
