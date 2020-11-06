" vim-bootstrap 

"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************

set t_Co=256 


" Required:
call plug#begin(expand('~/.vim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/grep.vim'
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'
Plug 'Raimondi/delimitMate'

Plug 'mhinz/vim-startify'

" JSON front matter highlight plugin
Plug 'elzr/vim-json'

" Markdown
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'



Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

let g:make = 'make'

Plug 'Shougo/vimproc.vim', {'do': g:make}

"" Snippets
" Plug 'honza/vim-snippets'
   " Plug 'SirVer/ultisnips', {
   "     \   'tag': '3.2',
   "     \   'dir': get(g:, 'plug_home', '~/.vim/bundle') . '/ultisnips_py2',
   "     \ }

"" Color
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'

"*****************************************************************************
"" Custom bundles
"*****************************************************************************

" c
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
" Plug 'derekwyatt/vim-protodef', { 'for': ['c', 'cpp', 'objc'] }
Plug 'derekwyatt/vim-fswitch'


Plug 'damage220/vim-finder'

" Autocompletion
Plug 'xavierd/clang_complete'
"Plug 'ervandew/supertab'
Plug 'vim-scripts/AutoComplPop', {'on': 'AutoComplDisable'}

"*****************************************************************************
"*****************************************************************************
call plug#end()

"*****************************************************************************
"Builitn packages
packadd termdebug

set foldlevelstart=0


" Required:
filetype plugin indent on
filetype plugin on


au! BufEnter *.cpp let b:fswitchdst = 'hpp,h'

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set ttimeoutlen=0

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

set foldmethod=indent

nnoremap <s-left> :tabprevious<CR>
nnoremap <s-right> :tabnext<CR>
autocmd FileType cpp nnoremap     <leader>comp    :!g++ -g --std=c++11 %  -o %:r<CR>
nnoremap     <leader>m       :make<CR>

nnoremap <F5> :buffers<CR>:buffer<Space>

nnoremap <C-a> :FSHere<CR>
nnoremap <C-s> :FSSplitRight<CR>

" nnoremap <C-o> :split<CR> <C-w><C-r> :resize 10<CR> :call finder#files({"header": []})<CR>
nnoremap <C-o> :Files<CR>

" Aut completion
let g:clang_use_library=1
let g:clang_library_path='/usr/lib/'

let g:clang_complete_auto=1
let g:clang_hl_errors=1

"let g:SuperTabDefaultCompletionType = "<c-n>"

" let g:protodefprotogetter = "~/.vim/plugged/vim-protodef/pullproto.pl"



set pumheight=5

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number
set pumheight=4
let no_buffers_menu=1
set wildmenu
"silent! colorscheme molokai
set termguicolors
"let g:dracula_italic = 0
"let g:dracula_colorterm = 0 
syntax enable
"colorscheme molokai
colorscheme nord

set t_ZH=[3m
set t_ZR=[23m

inoremap jk <Esc>

hi debugPC term=reverse ctermbg=4 guibg=darkblue



" Markdown Editing
" *************************************************
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" disable header folding
"let g:vim_markdown_folding_disabled = 1

" do not use conceal feature, the implementation is not so good
"let g:vim_markdown_conceal = 0

" disable math tex conceal feature
"let g:tex_conceal = ""
"let g:vim_markdown_math = 1

" support front matter of various format
"let g:vim_markdown_frontmatter = 1  " for YAML format
"let g:vim_markdown_toml_frontmatter = 1  " for TOML format
"let g:vim_markdown_json_frontmatter = 1  " for JSON format

augroup pandoc_syntax
   au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END
" ***********************************************




set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1


if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
else
    if $TERM == 'xterm'
      set term=xterm-256color
    endif
endif


if &term =~ '256color'
  set t_ut=
endif


"" let g:SuperTabDefaultCompletionType = '<c-n>'


"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv


" vim-airline
let g:airline_theme = 'nord'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

" terminal emulation
nnoremap <silent> <leader>sh :terminal<CR>

" Start Page
let g:startify_session_autoload = 1
"let g:startify_session_persistence = 1

let g:startify_lists = [
    \ { 'type': 'sessions', 'header': ['    Sessions']},
    \ { 'type': 'dir',      'header': ['    Last Opened in '. getcwd()] },
    \ { 'type': 'files',    'header': ['    Other']}
    \ ]


"*****************************************************************************
"" Commands
"*****************************************************************************
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=250
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END


set autoread

"*****************************************************************************
"" Mappings
"*****************************************************************************
"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>
"Recovery commands from history through FZF
nmap <leader>y :History:<CR>

" snippets

" ale
let g:ale_linters = {}

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif


noremap YY "+y<CR>
" noremap <leader>p "+gP<CR>
noremap XX "+x<CR>


noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv


"*****************************************************************************
"" Custom configs
"*****************************************************************************


" c
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab

"*****************************************************************************
"" Convenience variables
"*****************************************************************************

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

function! UpdateTodoKeywords(...)
    let newKeywords = join(a:000, " ")
    let synTodo = map(filter(split(execute("syntax list"), '\n') , { i,v -> match(v, '^\w*Todo\>') == 0}), {i,v -> substitute(v, ' .*$', '', '')})
    for synGrp in synTodo
        execute "syntax keyword " . synGrp . " contained " . newKeywords
    endfor
endfunction

augroup now
    autocmd!
    autocmd Syntax * call UpdateTodoKeywords("NOTE", "NOTES")
augroup END
