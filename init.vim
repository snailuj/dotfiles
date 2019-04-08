scriptencoding utf-8
set encoding=utf-8

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Styling
Plug 'altercation/vim-colors-solarized'
Plug 'wincent/terminus' " Tmux nav and cursor indicator when mode changes

"" Syntax Highlighting and Formatting
Plug 'othree/yajs.vim' " JS
Plug 'othree/html5.vim' " HTML5
Plug 'reasonml-editor/vim-reason-plus' " ReasonML
Plug 'editorconfig/editorconfig-vim'

" Language Client 
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'

call plug#end()

" Theme config
if (has("termguicolors"))
 set termguicolors
endif

" make FZF respect gitignore if `ag` is installed
" " you will obviously need to install `ag` for this to work
if (executable('ag'))
     let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
endif

syntax enable
colorscheme solarized

" enable autocomplete
let g:deoplete#enable_at_startup = 1
let g:python_host_prog = expand('~/.pyenv/versions/neovim2/bin/python')
let g:python3_host_prog = expand('~/.pyenv/versions/neovim3/bin/python')

" ReasonML LSP
let g:LanguageClient_serverCommands = {
    \ 'reason': ['/home/julian/.local/bin/reason-language-server.exe']
    \ }

set number " Show current line number as absolute
set relativenumber " Show other numbers relative to current
set numberwidth=2 " Numbers are 1 char wide
set tabstop=4 
set linebreak
set autoindent
" set listchars=tab:·,extends:›,precedes:‹,nbsp:␣,trail:·
set backspace=indent,eol,start " Allow backspacing over indentation, line breaks and insertion starts

set hidden
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

"
" Key Maps
"

" Bind CTRL-P to fzf file search
nnoremap <C-P> :Files<CR>

" Autocomplete bindings
nnoremap <F5> :call LanguageClient_contextMenu()<cr>
" nnoremap <silent> <cr> :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <C-Space> :call LanguageClient_textDocument_hover()<cr>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<cr>
nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<cr>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<cr>
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

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

" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
