" 
" Modified from vimrc_example.vim
"

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

" keep a backup file (restore to previous version)
set backup		
if has('persistent_undo')
  " keep an undo file (undo changes after closing)
  set undofile	
endif

" Switch on highlighting the last used search pattern.
set hlsearch

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  " always set autoindenting on
  set autoindent		

" has("autocmd")
endif 

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
if has('syntax') && has('eval')
  packadd matchit
endif

"
" End vimrc_example.vim
"

" Show current line number as absolute
set number
" Show other numbers relative to current
set relativenumber
" Numbers are 1 char wide
set numberwidth=2
set tabstop=4 
set linebreak
set autoindent
" Allow backspacing over indentation, line breaks and insertion starts
set backspace=indent,eol,start 

set hidden
" Do highlight phrases while searching
set incsearch 
" Don't continue to highlight after searching
set nohlsearch
" Ignore case when searching by default
set ignorecase
" ... unless you type a capital
set smartcase 
" Add the silver searcher to the runtimepath
set rtp+=/home/julian/.fzf/bin
" Auto read changed files from disk
set autoread  
" Also reload when switching buffers
au FocusGained,BufEnter * :checktime
" Longer history
set history=1000

set background=dark
" Show mode at bottom
set showmode
" Show incomplete commands
set showcmd 
" Persist undo history between sessions
set undofile
" But store them all in a single dir
set undodir=~/.vim/undo

" Configure ALE (must be done before loading ALE)
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '⛔'
let g:ale_sign_warning = '?'
let g:ale_fixers = {
		\   '*': ['remove_trailing_lines', 'trim_whitespace'],
		\   'javascript': ['eslint'],
		\}
syntax enable
filetype plugin indent on
set background=dark


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Explicitly trying to support vim8.0 pending Debian buster
" So shit's gonna get funky
""""""""

" Use python3 omnifunc
autocmd FileType python setlocal omnifunc=python3complete#Complete

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" nice to have
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-vinegar'
" Some more sensible settings in here
Plug 'tpope/vim-sensible'
" Surround with brackets, quotes etc
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'altercation/vim-colors-solarized'
" Tmux nav and cursor indicator when mode changes
Plug 'wincent/terminus'

" For whitespace settings
Plug 'editorconfig/editorconfig-vim'

" Navigation
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter'

" Language support
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Do a little dance to make deoplete work (needs :UpdateRemotePlugins)
" Required for nvim-yarp. Also requires `python3 -m pip install pynvim`
Plug 'roxma/vim-hug-neovim-rpc'
" Required for deoplete in vim8
Plug 'roxma/nvim-yarp'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

" Configure deoplete
let g:deoplete#enable_at_startup = 1 



" make FZF respect gitignore if `ag` is installed
" " you will obviously need to install `ag` for this to work
if (executable('ag'))
     let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
endif

" Use Emmet for JSX in JS and TS files
let g:user_emmet_settings = {
	\  'javascript' : {
	\      'extends' : 'jsx',
	\  },
	\  'typescript' : {
	\      'extends' : 'tsx',
	\  },
	\}

if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

" let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
" execute "set rtp+=" . g:opamshare . "/merlin/vim"


" This is ugly but it works when ALE wouldn't
let g:LanguageClient_serverCommands = {
     \ 'reason': ['/home/julian/.local/bin/reason-language-server.exe']
	 \ }

colorscheme solarized

" Make CR insert a line above in normal mode
nnoremap <silent><CR> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Bind CTRL-P to fzf file search
nnoremap <C-P> :Files<CR>

" Autocomplete bindings
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<cr>
nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<cr>
nnoremap <silent> <C-Space> :call LanguageClient_textDocument_hover()<cr>

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

set completeopt+=preview
