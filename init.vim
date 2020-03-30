" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

"
" Boosts 
"

" Fuggedabout solarized
" Plug 'altercation/vim-colors-solarized'
" colorscheme solarized
" Plug 'ajmwagar/vim-deus'
" Plug 'ajmwagar/lightline-deus'

Plug 'ntk148v/vim-horizon'
" lightline colorscheme
Plug 'gruvbox-material/vim'

" Statusline
Plug 'itchyny/lightline.vim'

" Cursor indicator when mode changes
Plug 'wincent/terminus' 

" Indent guides
Plug 'nathanaelkane/vim-indent-guides'

" Docs
Plug 'thinca/vim-ref'

" Whitespace
Plug 'editorconfig/editorconfig-vim'

" Maximise pane 
Plug 'junegunn/goyo.vim'

Plug 'mengelbrecht/lightline-bufferline'

" 
" LSP, Syntax Highlight, Formatting, Checking and Snippets
"

" Language client
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-eslint'

" Language checking for many languages
Plug 'sheerun/vim-polyglot'
" 
" Bundled by vim-polyglot, so no need to install anymore
"
" Plug 'pangloss/vim-javascript'
" Plug 'maxmellon/vim-jsx-pretty'
" Plug 'elixir-editors/vim-elixir' 
" Plug 'othree/html5.vim'
" Plug 'lepture/vim-jinja'
" Plug 'elzr/vim-json'
" Plug 'plasticboy/vim-markdown'
" Plug 'rgrinberg/vim-ocaml'
" Plug 'lifepillar/pgsql.vim'
" Python compiler, autoload
" Plug 'aliev/vim-compiler-python' 
" Python indent (disabled because Dru is weird)
" Pluyg 'vimjas/vim-python-pep8-indent'
" Python syntax
" Plug 'vim-python/python-syntax'
" ReasonML
" Plug 'reasonml-editor/vim-reason-plus' 
" Plug 'cakebaker/scss-syntax.vim'
" Plug 'ericpruit/tmux.vim'

" HTML Expansions
Plug 'mattn/emmet-vim'
" Close HTML tags automatically
Plug 'alvan/vim-closetag' 
 " Mix formatter
Plug 'mhinz/vim-mix-format'
 " not sure working?
Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }

" Language Client 
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }

" Debuggers
Plug 'vim-vdebug/vdebug'

" Autocomplete ... 
" if has('nvim')
"   " ... for neovim
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   " ... for vim 8 with python
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif

" Display function signatures in language client
" Plug 'Shougo/echodoc.vim'

" Make nice 
Plug 'tpope/vim-vinegar'
" Seamless tmux pane / vim split navigation
Plug 'christoomey/vim-tmux-navigator'
" Easily surround blocks of text with tags / braces etc
Plug 'tpope/vim-surround'

" Move, dup, swap elements, compound forms etc in normal mode
" See https://gist.github.com/cszentkiralyi/a9a4e78dc746e29e0cc8
" for cheatsheet
" And https://github.com/guns/vim-sexp for definitions
Plug 'tpope/vim-repeat'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'

" Extra niceties for elixir in vim
Plug 'slashmili/alchemist.vim'
" Adds 'end' after 'def', 'do' etc
" Plug 'tpope/vim-endwise'

" How did I NOT use this for so long?
Plug 'tpope/vim-fugitive'

" Comment out regions
Plug 'tpope/vim-commentary'

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

call plug#end()

" Make editorconfig play nice with tpope/fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.\*']

" Theme config
if (has("termguicolors"))
  set t_Co=256
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gn <Plug>(coc-rename)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

autocmd User CocDiagnosticChange silent call s:MaybeUpdateLightline()

" Auto-equalise width of panes when window resizes
autocmd VimResized * wincmd =

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format)


augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocActionAsync('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)


" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" use lightline-buffer in lightline
let g:lightline = {
      \ 'colorscheme': 'horizon',
      \ 'component_expand': {
      \   'linter_warnings': 'CocWarnings',
      \   'linter_errors': 'CocErrors',
      \   'linter_ok': 'CocOK',
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'readonly': 'error',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'left',
      \   'time': 'left',
      \   'user': 'left',
      \   'buffers': 'tabsel',
      \ },
      \ 'component_function': {
      \   'wordcount': 'WordCount',
      \   'lsp': 'MiniStat',
      \   'time': 'Timer',
      \   'gitbranch': 'GitBranch',
      \   'filetype': 'Filetype',
      \   'user': 'User'
      \ },
      \ 'component': {
      \   'separator': ''
      \ },
      \ 'active': {
      \   'left': [['mode', 'paste'], ['gitbranch', 'filename', 'modified']],
      \   'right': [
      \             ['linter_ok'],
      \             ['lsp', 'linter_warnings', 'linter_errors'], 
      \             ['percent','lineinfo']
      \]
      \ }
      \ }

let g:lightline.tabline = {'left': [['buffers']], 'right': [['user', 'time']]}
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#unicode_symbols = 1

let g:lightline.separator = { 'left': "\ue0b8", 'right': "\ue0be" }
let g:lightline.subseparator = { 'left': "\ue0b9", 'right': "\ue0b9" }
let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba" }
let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }

function! LightlineBufferline()
  call bufferline#refresh_status()
  return [ g:bufferline_status_info.before, g:bufferline_status_info.current, g:bufferline_status_info.after]
endfunction

function! MiniStat() abort
  return get(g:, 'coc_status', '')
endfunction

function! Timer()
  " return strftime("%H:%S")
  return strftime("%H:%M") . " PST" "Timer in status line
  " return !date
endfunction

function! GitBranch()
  if (fugitive#head() != '')
    return fugitive#head() . ' '
  endif
  return ''
endfunction


" Coc Linter functions

function! CocWarnings() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  return printf('%d ⚠', info['warning'])
endfunction

function! CocErrors() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  return printf('%d 🔴', info['error'])
endfunction


function! CocOK() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  return empty(info) ? '✓' : ''
endfunction


" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction
"       \ }

" Enable true color 启用终端24位色
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" " CoC/Lightline integration
" function! CocCurrentFunction()
"     return get(b:, 'coc_current_function', '')
" endfunction

" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
"       \ },
"       \ 'component_function': {
"       \   'cocstatus': 'coc#status',
"       \   'currentfunction': 'CocCurrentFunction'
"       \ },
"       \ }

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
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c4047 ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=#4a4b51 ctermbg=4

" make FZF respect gitignore if `ag` is installed
" " you will obviously need to install `ag` for this to work
if (executable('ag'))
     let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
endif

" Settings recommended by by LanguageClient_neovim
let g:deoplete#enable_at_startup = 1
set cmdheight=2
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'signature'

" Dru is weird about tabs instead of spaces
let g:polyglot_disabled = ['python-indent']
let g:python_host_prog = expand('~/.pyenv/versions/neovim2/bin/python')
let g:python3_host_prog = expand('~/.pyenv/versions/neovim3/bin/python')

" ReasonML LSP
"let g:LanguageClient_serverCommands = {
"    \ 'reason': ['/home/julian/.local/bin/reason-language-server.exe']
"    \ }

"
" Configure all the things
"
scriptencoding utf-8
set encoding=utf-8
set title

" Don't make me wait for cursor hold
set updatetime=100

" Enables using '%' to switch between if/else/end, open/close HTML tags
runtime macros/matchit.vim 
set scrolloff=5 " Scroll before reaching the end of the buffer

" Always draw the signcolumn
set signcolumn=yes

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

" Deus required
set background=dark
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:deus_termcolors=256
colorscheme horizon

set showmode " Show mode at bottom
set showcmd  " Show incomplete commands
set undofile " Persist undo history between sessions
set undodir=~/.vim/undo " But store them all in a single dir
set completeopt+=preview
set shortmess=a " Abbreviate some messages

"
" Key Maps
"
let mapleader = ","
" Bind CTRL-P to fzf file search
nnoremap <C-P> :Files<CR>

" Automatically start a new edit with C-g before deleting words or rows in
" insert mode so can undo
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" Autocomplete bindings
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
" 
" if !exists('*SetLSPShortcuts') 
"   function SetLSPShortcuts() 
"     nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
"     nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
"     nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
"     nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
"     nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
"     nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
"     nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
"     nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
"     nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
"     nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
" 
"     " Use tab to trigger completion with characters ahead and navigate.
"     " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
"     inoremap <silent><expr> <TAB>
"           \ pumvisible() ? "\<C-n>" :
"           \ <SID>check_back_space() ? "\<TAB>" :
"           \ coc#refresh()
"     inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" 
"     " Enter key chooses item
"     "inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>" 
"     " TAB jumps to first item
"     "inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" 
"   endfunction()
" endif
" 
" augroup LSP
" 	autocmd!
" 	autocmd FileType re, py, js, jsx, sql call SetLSPShortcuts()
" augroup END

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
silent! helpags ALL

set ts=4
set shiftwidth=4
set noexpandtab
