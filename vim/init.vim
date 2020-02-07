let vimdir = '~/.config/nvim/'
let was_installed = 1

if !filereadable(expand(vimdir . "autoload/plug.vim"))
  call system('curl -fLo ' . vimdir . 'autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  execute 'source ' . vimdir . 'autoload/plug.vim'
  let was_installed = 0
endif

call plug#begin('~/.vim/plugged')

" ================= looks and GUI stuff ================== "
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify' " Landing Page for VIM
Plug 'edkolev/tmuxline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'blueyed/vim-diminactive' " Dim inactive panes
Plug 'morhetz/gruvbox'
Plug 'haishanh/night-owl.vim'

" ================= Functionalities ================= "
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'dense-analysis/ale'
Plug 'honza/vim-snippets'
Plug 'tomtom/tcomment_vim' " Easy comments
Plug 'tpope/vim-surround' " Surround words
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors' "Multiple select CTRL+N
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-repeat'
Plug 'airblade/vim-rooter' " Automatically change dir when opening files
Plug 'wellle/targets.vim' " Many handy text objects Ex: viw
Plug 'ntpeters/vim-better-whitespace' " Delete whitespace
Plug 'easymotion/vim-easymotion'
Plug 'Shougo/echodoc.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'AndrewRadev/splitjoin.vim'

" ================= Git related ================= "
Plug 'airblade/vim-gitgutter' "Show changed lines
Plug 'tpope/vim-fugitive'

" ================= Ruby ================= "
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'ngmy/vim-rubocop'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-endwise'


" ================= HTML/CSS/JS ================= "
Plug 'pangloss/vim-javascript', { 'for': ['javascript']}
Plug 'alvan/vim-closetag' " Close HTML tags
Plug 'ap/vim-css-color'

" ================= Other ================= "
Plug 'janko-m/vim-test'
Plug 'sheerun/vim-polyglot'
" Plug 'tpope/vim-unimpaired'
" Plug '~/.fzf'
" Plug 'junegunn/fzf.vim'
" Plug 'xianzhon/vim-code-runner'
" Plug 'qpkorr/vim-bufkill' " Keep layout when deleting/wiping buffers
" Plug 'kana/vim-textobj-user'
" Plug 'nelstrom/vim-textobj-rubyblock'
" Plug 'mattn/emmet-vim'
" Plug 'godlygeek/tabular'

call plug#end()

if !was_installed
  PlugInstall
endif

set encoding=UTF-8

let g:mapleader=","
let mapleader=","

set title                                               " tab title as file file
set number
set relativenumber
set autoread
set ruler
colorschem night-owl
" colorschem night-owl

set t_Co=256
set background=dark
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set backupdir=~/.vim/backup/
set directory=~/.vim/backup/
set cursorline!
set wrap
set textwidth=99
set formatoptions=tcqrn1
set noshiftround
set lazyredraw

set hidden
set mouse=a

" set diff options
set diffopt=filler,vertical

" Status bar
set laststatus=2

" turn on syntax highlighting
syntax on
" highlight to vim-clojure-static
filetype plugin indent on

" Turn off swap and backup files
set noswapfile
set nobackup
set nowb

" Indentation
set autoindent
set smartindent
set smartcase

" Last line
set showmode
set showcmd

set clipboard+=unnamedplus

" Highlight search results
" set hlsearch
set nohlsearch

" Disable bloated stuff that is on by default.
let g:loaded_2html_plugin = 1
let g:loaded_gzip = 1
let g:loaded_tarPlugin = 1 " May cause problems with fireplace
let g:loaded_zipPlugin = 1
let g:loaded_netrwPlugin = 1

" airline
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme='jellybeans'
let g:airline_powerline_fonts = 1
let g:tmuxline_preset = 'tmux'
" install nerd font
set guifont=DroidSansMono\ Nerd\ Font\ 11


command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1

"deoplete async-clj-omni config
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'

" better whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" ale configs
" use rubocop
" ALE linting events
augroup ale
  autocmd!
    autocmd VimEnter *
          \ set updatetime=1000 |
          \ let g:ale_lint_on_text_changed = 0
    autocmd CursorHold * call ale#Queue(0)
    autocmd CursorHoldI * call ale#Queue(0)
    autocmd InsertEnter * call ale#Queue(0)
    autocmd InsertLeave * call ale#Queue(0)
augroup END
" autocmd FileType ruby setlocal omnifunc=LanguageClient#complete
" ale configs
" use rubocop
let g:ale_fixers = {
      \   'ruby': ['rubocop', 'trim_whitespace', 'remove_trailing_lines'],
      \   'javascript': ['jshint']
      \}
let g:ale_linters = {
      \   'ruby': ['rubocop', 'solargraph', 'ruby'],
      \   'javascript': ['jshint']
      \}
let g:ale_ruby_rubocop_executable = 'rubocop'
let g:ale_ruby_solargraph_executable = 'solargraph'
let g:ale_ruby_solargraph_options = {}
let g:ale_enabled = 1
" Use ALE's function for omnicompletion.
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
set completeopt=menu,menuone,preview,noselect,noinsert

let g:ale_completion_enabled = 1
let g:ale_set_highlights = 0
let g:ale_enabled = 1

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" update time to refresh gitgutter
set updatetime=100

" indentLine config
set conceallevel=1
let g:indentLine_conceallevel=1

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" Make it obvious where 80 characters is
" at deco we use 100
set textwidth=99
set colorcolumn=+1

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

so ~/.config/nvim/mappings.vim
