execute pathogen#infect()
:
" general settings #############
if v:progname =~? "evim"
  finish
endif
set nocompatible " not vi compatible
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history

" spaces and tabs #############
set tabstop=2           " visual spaces per tab
set shiftwidth=2      
set softtabstop=2       " tab spaces when editing
set expandtab           " turn tabs into spaces
set backspace=indent,eol,start
set autoindent		" always set autoindenting on

" ui config ###############
set number              " show line numbers
set cursorline          " highlight current line
if has('mouse') 
  set mouse=a           " allow mouse use
endif
syntax on               " syntax highlighting on
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching ({[
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set colorcolumn=85

" searching ##############
set incsearch		" do incremental searching
set ignorecase          " search ignores case
set smartcase           " case sensitive if search has uppercase
set hlsearch            " hightlight last used search pattern
set foldmethod=indent   " fold based on indent level

" folding #################
set foldenable           " enable folding
set foldlevelstart=10    " open folds by default
set foldnestmax=10       " 10 level nested fold max

" key mappings ####################
noremap <Tab> <C-W><C-W>  
inoremap ;; <ESC>  
" disable arrow keys to learn cursor commands
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
map gm :call LivedownPreview()<CR>

" plugin settings #######################
" ctrl P setup
set runtimepath^=~/.vim/bundle/ctrlp.vim
map <C-p> :CtrlP<CR>
let g:ctrlp_switch_buffer = 0 " open files in new buffers
" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['rubocop']
" nerdtree settings
map <C-n> :NERDTreeToggle<CR>
