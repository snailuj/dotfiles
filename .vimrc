" 
" Modified from vimrc_example.vim
"

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

set backup		" keep a backup file (restore to previous version)
if has('persistent_undo')
  set undofile	" keep an undo file (undo changes after closing)
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

  set autoindent		" always set autoindenting on

endif " has("autocmd")

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
set number " Show current line number as absolute
set relativenumber " Show other numbers relative to current
set numberwidth=2 " Numbers are 1 char wide
set tabstop=4 
set linebreak
set autoindent
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

"if $COLORSCHEME=='light'
"	set background=light
"else
"	set background=dark
"endif
set background=dark
set showmode " Show mode at bottom
set showcmd  " Show incomplete commands
set undofile " Persist undo history between sessions
set undodir=~/.vim/undo " But store them all in a single dir

"
" Make netrw a bit nicer
"
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" nice to have
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-sensible' " Some more sensible settings in here
Plug 'tpope/vim-surround' " Surround with brackets, quotes etc
Plug 'tpope/vim-obsession'
Plug 'altercation/vim-colors-solarized'
Plug 'wincent/terminus' " Tmux nav and cursor indicator when mode changes

" For whitespace settings
Plug 'editorconfig/editorconfig-vim'

" Navigation
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter'

" Language support
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'reasonml-editor/vim-reason-plus'

call plug#end()

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

syntax enable
set background=dark
colorscheme solarized

" Autocomplete with TAB
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

" Make CR insert a line above in normal mode
nnoremap <silent><CR> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Bind CTRL-P to fzf file search
nnoremap <C-P> :Files<CR>

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

set completeopt+=preview
