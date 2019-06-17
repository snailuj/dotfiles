" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Solarized colours
Plug 'altercation/vim-colors-solarized'
" Cursor indicator when mode changes
Plug 'wincent/terminus' 
" Indent guides
Plug 'nathanaelkane/vim-indent-guides'
" Docs
Plug 'thinca/vim-ref'

" Syntax Highlight and Indentation / Snippets
Plug 'editorconfig/editorconfig-vim' " Whitespace
Plug 'othree/yajs.vim' " JS
Plug 'othree/html5.vim' " HTML5
Plug 'mattn/emmet-vim' " HTML Expansions
Plug 'alvan/vim-closetag' " Close HTML tags automatically
Plug 'reasonml-editor/vim-reason-plus' " ReasonML
Plug 'elixir-editors/vim-elixir' " Elixir
Plug 'mhinz/vim-mix-format' " Mix formatter
Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' } " not sure working?

" Language Client 
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Debuggers
Plug 'vim-vdebug/vdebug'

" Autocomplete ... 
if has('nvim')
  " ... for neovim
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  " ... for vim 8 with python
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Make nice 
Plug 'tpope/vim-vinegar'
" Seamless tmux pane / vim split navigation
Plug 'christoomey/vim-tmux-navigator'
" Easily surround blocks of text with tags / braces etc
Plug 'tpope/vim-surround'

" Save vim sessions
Plug 'tpope/vim-obsession'

" Fuzzy find
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Enables :BD to delete a buffer without killing the window 
Plug 'qpkorr/vim-bufkill'

" BELOW ARE MORE TROUBLE THAN WORTH?
" Automatically close pairs of brackets etc
Plug 'jiangmiao/auto-pairs' " Can be annoying at times
Plug 'airblade/vim-gitgutter' " I never look at it
Plug 'tpope/vim-capslock' " not needed because remap Caps-lock to ESC
Plug 'tpope/vim-repeat' " I just never seem to use it

call plug#end()

" Theme config
if (has("termguicolors"))
 set termguicolors
endif

colorscheme solarized

" Close tags config
let g:closetag_filenames = '*.html,*.xhtml,*.js,*.re'
" Ignore the list of non-closing tags for the following files
let g:closetag_filetypes = 'html,xhtml,javascript,reason'

" Enable Emmet
let g:user_emmet_settings = {
\   'javascript': {
\     'extends': 'jsx',
\   }
\}

" Indent guides when expand tabs is set
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#002b36 ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#0c353f ctermbg=4

" make FZF respect gitignore if `ag` is installed
" " you will obviously need to install `ag` for this to work
if (executable('ag'))
     let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
endif

" enable autocomplete
let g:deoplete#enable_at_startup = 1
let g:python_host_prog = expand('~/.pyenv/versions/neovim2/bin/python')
let g:python3_host_prog = expand('~/.pyenv/versions/neovim3/bin/python')

" Elixir autocomplete options (doesn't use deoplete)
" g:elixir_showerror = 1
" g:elixir_autobuild = 1

" ReasonML LSP
let g:LanguageClient_serverCommands = {
    \ 'reason': ['/home/julian/.local/bin/reason-language-server.exe']
    \ }

"
" Configure all the things
"
scriptencoding utf-8
set encoding=utf-8
set title

" Enables using '%' to switch between if/else/end, open/close HTML tags
runtime macros/matchit.vim 
set scrolloff=5 " Scroll before reaching the end of the buffer

syntax on
filetype on
filetype plugin on
filetype indent on
set number " Show current line number as absolute
set relativenumber " Show other numbers relative to current
set numberwidth=2 " Numbers are 1 char wide
set tabstop=2 
set shiftwidth=2
set expandtab
set smartindent
set foldmethod=indent
set linebreak " Wrap only at characters that match `breakat` option
set nowrap " Because why would you?
set textwidth=78
set autoindent
set cursorline
set nolist
set listchars=tab:>-,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set backspace=indent,eol,start " Allow backspacing over indentation, line breaks and insertion starts
highlight Folded guibg=#0c353f

set hidden 
set autoread 
" Improve buffer switching so pressing Tab on the
" command line will show a menu to complete buffer and file names.
" Can also press F10 to open the buffer menu.  
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>

set incsearch " Do highlight phrases while searching
set nohlsearch " Don't continue to highlight after searching
set ignorecase " Ignore case when searching by default
set smartcase  " ... unless you type a capital
set rtp+=/home/julian/.fzf/bin " Add the silver searcher to the runtimepath
set autoread   " Auto read changed files from disk
au FocusGained,BufEnter * :checktime " Also reload when switching buffers
set history=1000 " Longer history

set background=dark
set showmode " Show mode at bottom
set showcmd  " Show incomplete commands
set undofile " Persist undo history between sessions
set undodir=~/.vim/undo " But store them all in a single dir
set completeopt+=preview
set shortmess=a " Abbreviate some messages

"
" Key Maps
"
map <Space> <Leader>
" Bind CTRL-P to fzf file search
nnoremap <C-P> :Files<CR>

" Autocomplete bindings
nnoremap <F5> :call LanguageClient_contextMenu()<cr>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<cr>
nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<cr>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<cr>
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>" " Enter key chooses item
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" " TAB jumps to first item

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" even in insert mode
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" Move lines and visual blocks up and down with Alt-j/k
nnoremap <A-j> :m .+1<CR>==            " '==' re-indents the line after moving
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi     " gi repositions cursor and re-enters insert mode
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv        " gv reselects the last visual block and '=' reindents it
vnoremap <A-k> :m '<-2<CR>gv=gv

" Scroll faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Show listchars with <leader>s
nmap <silent> <leader>s :set nolist!<CR>

" Escape enclosing pairs with CTRL-Space
inoremap <C-Space> <Esc>/[)}"'\]>`]<CR>:nohl<CR>a

" Make CR insert a line above in normal mode
nnoremap <silent><CR> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" delete window with d<C-?>
nnoremap d<C-j> <C-w>j<C-w>c
nnoremap d<C-k> <C-w>k<C-w>c
nnoremap d<C-h> <C-w>h<C-w>c
nnoremap d<C-l> <C-w>l<C-w>c

" <leader>b in normal mode lists buffers and runs :buffer
:nnoremap ,b :ls<CR>:buffer<Space>

" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
