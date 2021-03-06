"
" Use vim-plug to install plugins
call plug#begin('~/.local/share/nvim/plugged')
" dipslay related
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ddollar/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/ZoomWin'
" snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
" git stuff
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" navigation
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'

" vim-laravel plugin dependencies
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'ncm2/ncm2'
Plug 'noahfrederick/vim-composer'
Plug 'noahfrederick/vim-laravel'

" syntax highlighting/linting
Plug 'bronson/vim-trailing-whitespace'
Plug 'vim-syntastic/syntastic'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'elzr/vim-json'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'aliou/moriarty.vim'
Plug 'leafgarland/typescript-vim'
Plug 'sheerun/vim-polyglot'

" testing
Plug 'janko/vim-test'

" productivity
Plug 'wakatime/vim-wakatime'
Plug 'tpope/vim-surround'
Plug 'valloric/youcompleteme'
Plug 'shawncplus/phpcomplete.vim'

call plug#end()

if has("gui_vimr")
  " vimr specific settings
  colo moriarty

  let g:terminal_color_0 = '#2e3436'
  let g:terminal_color_1 = '#cc0000'
  let g:terminal_color_2 = '#4e9a06'
  let g:terminal_color_3 = '#c4a000'
  let g:terminal_color_4 = '#3465a4'
  let g:terminal_color_5 = '#75507b'
  let g:terminal_color_6 = '#0b939b'
  let g:terminal_color_7 = '#d3d7cf'
  let g:terminal_color_8 = '#555753'
  let g:terminal_color_9 = '#ef2929'
  let g:terminal_color_10 = '#8ae234'
  let g:terminal_color_11 = '#fce94f'
  let g:terminal_color_12 = '#729fcf'
  let g:terminal_color_13 = '#ad7fa8'
  let g:terminal_color_14 = '#00f5e9'
  let g:terminal_color_15 = '#eeeeec'
endif

" Remap leader key
let mapleader = ","
set rtp+=~/.snipMate

""""""""Ack"""""""""
" Use silver searcher instead of ack
let g:ackprg = 'ag --nogroup --nocolor --column'

""""""""CtrlP""""""""
" use git to list files in ctrl p
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']
set wildignore+=node_modules/**
set wildignore+=public/**
set wildignore+=app/assets/javascripts/bin/**

" increase ctrl p depth and file count
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

""""""NERDTree""""""""
" auto open nerdtree on enter
autocmd vimenter * NERDTree
" remap toggle nerd tree
map <leader>n :NERDTreeToggle<CR>
"Ignore compiled ruby, python, and java files
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']
augroup AuNERDTreeCmd
autocmd AuNERDTreeCmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))
autocmd AuNERDTreeCmd FocusGained * call s:UpdateNERDTree()

 " If the parameter is a directory, cd into it
function s:CdIfDirectory(directory)
  let explicitDirectory = isdirectory(a:directory)
  let directory = explicitDirectory || empty(a:directory)

  if explicitDirectory
    exe "cd " . fnameescape(a:directory)
  endif

  " Allows reading from stdin
  " ex: git diff | mvim -R -
  if strlen(a:directory) == 0
    return
  endif

  if directory
    NERDTree
    wincmd p
    bd
  endif

  if explicitDirectory
    wincmd p
  endif
endfunction

" NERDTree utility function
function s:UpdateNERDTree(...)
  let stay = 0

  if(exists("a:1"))
    let stay = a:1
  end

  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
    if nr != -1
      exe nr . "wincmd w"
      exe substitute(mapcheck("R"), "<CR>", "", "")
      if !stay
        wincmd p
      end
    endif
  endif
endfunction

""""""""Syntastic"""""""""
" Use ESlint for JSlinting
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_mode_map = {
  \ "mode": "active",
  \ "active_filetypes": ["ruby", "php", "javascript"] }

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""""""""Snipmate""""""
" Make it compatible with YCM
" imap <expr> <m-h> pumvisible() ? '<esc>a<Plug>snipMateTrigger' : '<Plug>snipMateTrigger'
imap <expr> <Tab> pumvisible() ? '<esc>a<Plug>snipMateNextOrTrigger' : '<Plug>snipMateNextOrTrigger'
smap <m-j> <Plug>snipMateNextOrTrigger
imap <expr> <S-Tab> pumvisible() ? '<esc>a<Plug>snipMateBack' : '<Plug>snipMateBack'
smap <S-Tab> <Plug>snipMateBack
imap <expr> <C-R><Tab> pumvisible() ? '<esc>a<Plug>snipMateShow' : '<Plug>snipMateShow'

""""""""Airline"""""""
let g:airline_theme='cobalt2'

""""""""VDdebug"""""""
let g:vdebug_options = {
    \    "port" : 9001,
    \    "timeout" : 30,
    \    "on_close" : 'detach',
    \    "break_on_open" : 0
\}

""""""""""Vim-Test""""""""""
let test#strategy = "basic"
let test#javascript#jasmine#executable = 'npm test'
let test#php#phpunit#executable = './tests/scripts/phpunit.sh'
let test#php#phpunit#options= {
      \'file': '--debug',
      \'suite': '--unit'
\}

"""""""""""Vim-jsx""""""""""""
" Allow JSX in normal JS files
let g:jsx_ext_required = 0

"""""""""""Vim-test"""""""""""
nmap <silent> <leader>tt :TestNearest <CR>
nmap <silent> <leader>tT :TestFile <CR>
nmap <silent> <leader>tl :TestLast <CR>

"""""""""""Vim-php-cs-fixer""""""""
" Autofix on save
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
let g:php_cs_fixer_config_file = '~/.php_cs'
" Path to PHP
let g:php_cs_fixer_php_path = "/usr/local/bin/php"
" change default mapping
nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR>
nnoremap <silent><leader>pd :call PhpCsFixerFixDirectory()<CR>

"""""""""""Custom"""""""""""
" Move lines up/down with Ctrl+k/Ctrl+j
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=g

" Maps Alt-[h,j,k,l] to resizing a window split
nnoremap <silent> ˙ <C-w>5<
nnoremap <silent> ∆ <C-W>5-
nnoremap <silent> ˚ <C-W>5+
nnoremap <silent> ¬ <C-w>5>

" Set large redrawtime for large file syntax
" highlighting
set redrawtime=10000

" Set scrollable mouse
set mouse=a

" ignorecase on search
:set ignorecase
:set smartcase

" Set no wrap
set nowrap

" Set relative line numbers
set number
set relativenumber

" Set Ruler
set ruler

" Set scroll offset
set scrolloff=3

" Bells
set visualbell
set noerrorbells

" Read files when they change ouside of Vim
set autoread

" No backups
set nowritebackup
set noswapfile
set nobackup

au BufRead,BufNewFile setlocal textwidth=80 " set textwidth to 80 chars across
set colorcolumn=+1

" Clear highlights
nnoremap <SPACE>c <SPACE>:noh<CR>

" set 256 color scheme
set t_Co=256

syntax enable

" Indentation
filetype plugin indent on
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
" php files have special setting
autocmd FileType php setlocal shiftwidth=4 tabstop=4
