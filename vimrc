execute pathogen#infect()
:
" general settings #############
if v:progname =~? "evim"
  finish
endif
set nocompatible " not vi compatible
set nobackup		" dont use backups
syntax on
set autoread " if file changed outside vim, auto reaload"
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
set colorcolumn=81
set splitright

" put swap, backup, undo files in special location not working directory
 set backup backupdir=~/.vim/backup/
" set directory=~/.vim/swap//
 set undofile undodir=~/.vim/undo/

" searching ##############
set incsearch		" do incremental searching
set ignorecase          " search ignores case
set smartcase           " case sensitive if search has uppercase
set hlsearch            " hightlight last used search pattern
set foldmethod=syntax   " fold based on indent level

" folding #################
set foldenable           " enable folding
set foldlevelstart=1     " open folds by default
set foldnestmax=10       " 10 level nested fold max
set foldmethod=syntax
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent


" key mappings ####################
nnoremap <Tab> <C-W><C-W>  
inoremap ;; <ESC>  
" disable arrow keys to learn cursor commands
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap gm :call LivedownPreview()<CR>
" create new file from filename
map <leader>gf :e <cfile><cr>
" Easy window navigation
 map <C-h> <C-w>h
 map <C-j> <C-w>j
 map <C-k> <C-w>k
 map <C-l> <C-w>l
 " easy tab switch
 nnoremap <C-Left> :tabprevious<CR>
 nnoremap <C-Right> :tabnext<CR>
 " alt left right moves current tab 
 nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
 nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
" plugin settings #######################
" ---airline status bar-----
"  " Enable the list of buffers
 let g:airline#extensions#tabline#enabled = 1
"  " Show just the filename
 let g:airline#extensions#tabline#fnamemod = ':t'
"  ----- xolox/vim-easytags settings -----
"  Where to look for tags files
set tags=./tags;,~/.vimtags
" +" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with <leader>b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" ------snipmate
filetype plugin on
" ctrl P setup
set runtimepath^=~/.vim/bundle/ctrlp.vim
noremap <C-p> :CtrlP<CR>
let g:ctrlp_switch_buffer = 0 " open files in new buffers
" syntastic settings
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" set statusline+=%{fugitive#statusline()}
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
"nerdtree settings
noremap <C-n> :NERDTreeToggle<CR>
" easy open .vimrc
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" activate matchit
runtime macros/matchit.vim
" easy
