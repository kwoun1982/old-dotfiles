" .vimrc
" Author: Eduardo Ruiz <eduarbo@gmail.com>
" Source: https://github.com/eduarbo/dotfiles/blob/master/vim/

" Preamble ---------------------------------------------------------------- {{{

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

" }}}

" Basic options ----------------------------------------------------------- {{{

set encoding=utf-8
set modelines=0
set autoindent          " Automatically set the indent of a new line (local to buffer)
set showmode                    " Show current mode down the bottom
set showcmd                     " Show incomplete cmds down the bottom
set visualbell                  " No sounds
set ttyfast                     " Improves redrawing
set ruler " Always show current positions along the bottom
set backspace=indent,eol,start  " Allow backspace in insert mode
set number                      " Line numbers are good
set norelativenumber " It is much faster
set laststatus=2  " Always show the status line
set history=1000                " Store lots of :cmdline history
set undofile
set undoreload=10000
set nolist " Hide invisible chars
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set shell=/bin/bash
set lazyredraw " Do not redraw while running macros
set matchtime=3 " how many tenths of a second to blink
set showbreak=↪ 
set splitbelow
set splitright
set fillchars=diff:⣿,vert:│ " Customize text for closed folds
set autowrite
set autoread                    " Reload files changed outside vim
set shiftround  " When at 3 spaces, and I hit > ... go to 4, not 5
set title
set linebreak    "Wrap lines at convenient points
set dictionary=/usr/share/dict/words

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Make Vim able to edit crontab files again.
set backupskip=/tmp/*,/private/tmp/*"

" Better Completion
set completeopt=longest,menuone,preview

" Save when losing focus
" au FocusLost * :silent! wall

" Resize splits when the window is resized
au VimResized * :wincmd =

" Cursorline {{{
" Only show cursorline in the current window and in normal mode.

augroup cline
    au!
    au WinLeave * set nocursorline
    au WinEnter * set cursorline
    au InsertEnter * set nocursorline
    au InsertLeave * set cursorline
augroup END

" }}}

" Trailing whitespace {{{
" Only shown when not in insert mode so I don't go insane.

augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
    au InsertLeave * :set listchars+=trail:⌴
augroup END

" }}}

" Wildmenu completion {{{

set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildmode=list:longest

" Stuff to ignore when tab completing
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*vim/backups*
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files
set wildignore+=*sass-cache*
" RoR
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
" Clojure/Leiningen
set wildignore+=classes
set wildignore+=lib

" }}}

" Line Return {{{

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" }}}

" Tabs, spaces, wrapping {{{

set smartindent         " smartindent (local to buffer)
set smarttab

" expandtab is nice for this:
" 	any/all source code (java/c/python/perl/vim/php/...)
" noexpandtab is better for this:
" 	vimoutliner files
" 	word lists for GRE prep
set expandtab														" no real tabs please!

set tabstop=8
set shiftwidth=4
set softtabstop=4
set textwidth=79
set nowrap
set formatoptions=qrn1
set colorcolumn=+1

autocmd FileType html,xhtml setlocal sw=2 ts=2 sts=2 textwidth=0
autocmd FileType javascript,python setlocal sw=4 ts=4 sts=4
autocmd FileType css,sass,scss,less,ruby,eruby setlocal sw=2 ts=2 sts=2

let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" }}}

" Backups {{{

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup                        " enable backups
set noswapfile                    " It's 2012, Vim.

" }}}

" Leader {{{

let mapleader = ","
let maplocalleader = "\\"

" }}}

" Color scheme {{{

syntax on
set background=dark
let g:badwolf_html_link_underline = 0
colorscheme badwolf

" Reload the colorscheme whenever we write the file.
augroup color_badwolf_dev
    au!
    au BufWritePost badwolf.vim color badwolf
augroup END

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" }}}

" }}}
