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
Plug 'dpc/vim-smarttabs'
Plug 'w0rp/ale'
Plug 'terryma/vim-multiple-cursors'
Plug 'ervandew/supertab'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'metakirby5/codi.vim'
Plug 'Konfekt/vim-scratchpad'
Plug 'craigemery/vim-autotag'

" Terraform
Plug 'hashivim/vim-terraform'

" Markdown / writing
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'dhruvasagar/vim-table-mode', { 'for': 'markdown' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'jkramer/vim-checkbox', { 'for': 'markdown' }

" PlantUML
Plug 'aklt/plantuml-syntax'

" Yaml
Plug 'mrk21/yaml-vim'

" Interface
Plug 'ryanoasis/vim-devicons'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'luochen1990/rainbow'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

" Themes
Plug 'vim-scripts/CycleColor'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'joshdick/onedark.vim'
Plug 'reedes/vim-colors-pencil'
Plug 'NLKNguyen/papercolor-theme'

" Elixir
Plug 'elixir-editors/vim-elixir'

" Ruby
Plug 'vim-ruby/vim-ruby'

" Toml
Plug 'cespare/vim-toml'

" Python:
Plug 'davidhalter/jedi-vim'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable filetype plugins
filetype plugin on
filetype indent on
set autoread                "Set to auto read when a file is changed from the outside
au CursorHold * checktime
let mapleader = "\<Space>"  " Set space as leader
let maplocalleader = "\\"
set encoding=utf8           " Set utf8 as standard encoding and en_US as the standard language
set ffs=unix,dos,mac            " Use Unix as the standard file type
set nobackup                " Turn backup off, since most stuff is in SVN, git et.c anyway...
set nowritebackup
set noswapfile
set mouse=a                 " Enable mouse integration
set nojoinspaces            " Use one space, not two, after punctuation
set number relativenumber   " show line numbers
set clipboard=unnamed       " Enable integration with system clipboard
set history=50              " remember more commands and search history
set undolevels=1000         " use many muchos levels of undo
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set hidden                  " Allow to create a new buffer and change to new one without the need to save it
set showcmd                 " display incomplete commands
syntax enable               " Enable syntax highlighting

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set so=7                        " Set 7 lines to the cursor - when moving vertically using j/k
set wildmenu                    " Turn on the Wild menu
set wildignore=*.o,*~,*.pyc     " Ignore compiled files
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set ruler                       " Always show current position
set cmdheight=1                 " Height of the command bar
set hid                         " A buffer becomes hidden when it is abandoned
set backspace=eol,start,indent  " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l
set smartcase                   " When searching try to be smart about cases
set hlsearch                    " Highlight search results
set incsearch                   " Makes search act like search in modern browsers
set magic                       " For regular expressions turn magic on
set showmatch                   " Show matching brackets when text indicator is over them
set noerrorbells                " No annoying sound on errors
set ignorecase                  " Ignore case when searching
set novisualbell
set t_vb=
set tm=500
if has("gui_macvim")
  autocmd GUIEnter * set vb t_vb=   " Properly disable sound on errors on MacVim
  set guioptions=                   " Remove scrollbars in MacVim
endif
set cursorline                  " Enable highlighting of the current line
set laststatus=2                " Always show the status line
set spell spelllang=en_us

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors
set guifont=Fira\ Code:h16
set background=light
let g:one_allow_italics = 1 " I love italic for comments
colorscheme onedark

set background=dark
colorscheme PaperColor

" let g:pencil_higher_contrast_ui = 0 " 0=low (def), 1=high
" let g:pencil_spell_undercurl = 1    " 0=underline, 1=undercurl (def)
" let g:pencil_neutral_code_bg = 0   " 0=gray (def), 1=normal
" set background=light
" colorscheme pencil

" set visual color section 
" hi Visual guifg=Black guibg=LightBlue gui=none

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set noexpandtab
set tabstop=4
set softtabstop=0
set shiftwidth=4
set linebreak
set textwidth=120
set smartindent
set wrap

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

" Save using <leader>w
nnoremap <leader>w :w<CR>

" Disable highlight when <leader><CR> is pressed
nmap <silent> <leader><CR> :noh<CR>

" Move lines
"move current line to the end of buffer without moving cursor
nnoremap <leader>mv ddGp``
"copy current line to the end of buffer without moving cursor
nnoremap <leader>cp YGp``

" edit / source vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" edit zshrc
nmap <silent> <leader>eb :e ~/.zshrc<CR>

" edit tmux
nmap <silent> <leader>et :e ~/.tmux.conf<CR>

" edit prezto
nmap <silent> <leader>ep :e ~/.zpreztorc<CR>

" clean views
nmap <silent> <leader>cv :!rm -f ~/.vim/view/*=<CR>

" notes and todo
nnoremap <silent> <leader>gt :e ~/Dropbox/notes/todo.md<CR>
nnoremap <silent> <leader>gn :NERDTree ~/Dropbox/notes<CR>
nnoremap <silent> <leader>cn :cd ~/Dropbox/notes<CR>
nnoremap <leader>ww :e ~/Dropbox/notes/index.md<CR>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Pressing <leader>ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<CR>

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
nmap <leader>l :bnext<CR>       " Goto next buffer
nmap <leader>h :bprevious<CR>   " Goto previous buffer
nmap <leader>T :enew<CR>        " Open new buffer
nnoremap <Tab> :bnext<CR>       " Use <TAB> to change to next buffer
nnoremap <S-Tab> :bprevious<CR> " Use <TAB> to change to previous buffer
nnoremap <C-X> :bdelete<CR>     " Use <Ctrl-X> to delete the current buffer
noremap <C-p> <ESC>:Buffers<CR> " Use CTRL-p to switch buffers
nnoremap <leader>. :CtrlPTag<cr>

" Close all the buffers
map <leader>ba :bufdo bd<CR>

" Enable close of buffer in VIM using c
nnoremap c :bp\|bd #<CR>

" Use <Ctrl-X> to delete the current buffer
nnoremap <C-X> :bdelete<CR>

" Use CTRL-p to switch buffers
noremap <C-p> <ESC>:Buffers<CR> 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:scratchpad_path = '/Users/phnl310301178/Dropbox/notes/.scratchpads'
let g:scratchpad_ftype = 'md'

" Vim MarkDown
set conceallevel=2
let g:vim_markdown_folding_style_pythonic=1
let g:vim_markdown_conceal_code_blocks=0
let g:vim_markdown_follow_anchor=1
let g:vim_markdown_toc_autofit=1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_toml_frontmatter=1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_strikethrough = 1

" Polyglot
let g:polyglot_disabled = ['markdown']

" NerdTree
nnoremap <leader>f :NERDTreeToggle<Enter>
let g:NERDTreeChDirMode = 2
map <leader>r :NERDTreeFind<CR>     " Change working directory in NerdTree
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

" Vim Table Format
noremap <leader>tf :TableFormat<CR>         " Execute TableFormat

" Vim Table Mode
let g:table_mode_corner="|"
noremap <leader>tm :TableModeToggle<CR>     " Enable/Disable tablemode

" Elixir
let g:mix_format_on_save = 1

" Devicons
let g:webdevicons_enable = 1

" Goyo
let g:goyo_width=160
nmap <leader>gy :Goyo<CR>                   " Enable/Disable Goyo mode

" Ag - Silver Searcher
nnoremap \ :Ag<SPACE>

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

" ALE (Asynchronous Lint Engine)
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1

" Terraform settings
let g:terraform_align=1                                 " Align to community standards
autocmd FileType terraform setlocal commentstring=#%s   " Commentary settings
let g:terraform_fmt_on_save = 1                         " Terraform format on save

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Lightline settings
let g:lightline = {
    \ 'colorscheme': 'onedark',
    \ 'active': {
    \ 'right': [
    \   [ 'mode', 'paste' ],
    \   [ 'gitbranch', 'readonly', 'filename', 'modified' ]
    \ ]
    \ },
    \ 'component': { 'lineinfo': ' %3l:%-2v', },
    \ 'component_function': { 'gitbranch': 'fugitive#head', }
    \ }

let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline.tabline = {'left': [['buffers']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type = {'buffers': 'tabsel'}
set showtabline=2
autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

" set formatting for xml
let $XMLLINT_INDENT="    "
command! FormatXml execute "%!xmllint --format -"
command! FormatJson execute "%!python -m json.tool"

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

function! CreateNewDiaryFile()
  let date=strftime("%y-%m-%d")
  exe "e! " . fnameescape("~/Dropbox/notes/diary/". date . ".md")
endfunction

