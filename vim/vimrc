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

imap jj <Esc> " Professor VIM says '87% of users prefer jj over esc', jj abrams disagrees

" }}}
" Basic options ----------------------------------------------------------- {{{

set encoding=utf-8
set modelines=0
set autoindent                  " Automatically set the indent of a new line (local to buffer)
set showmode                    " Show current mode down the bottom
set showcmd                     " Show incomplete cmds down the bottom
set visualbell                  " No sounds
set vb t_vb=                    " Turn off bell, this could be more annoying, but I'm not sure how
set ttyfast                     " Improves redrawing
set ruler                       " Always show current positions along the bottom
set backspace=indent,eol,start  " Allow backspace in insert mode
set number                      " Line numbers are good
set norelativenumber            " It is much faster
set laststatus=2                " Always show the status line
set history=1000                " Store lots of :cmdline history
set undofile
set undoreload=10000
set nolist                      " Hide invisible chars
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set shell=/bin/bash
set lazyredraw                  " Do not redraw while running macros
set matchtime=3                 " how many tenths of a second to blink 
"set showbreak=…
set showbreak=↪
set splitbelow
set splitright
set fillchars=diff:⣿,vert:│     " Customize text for closed folds
set autowrite
set autoread                    " Reload files changed outside vim
set shiftround                  " When at 3 spaces, and I hit > ... go to 4, not 5
set title
set linebreak                   " Wrap lines at convenient points
set nofoldenable
set nowarn
set matchpairs+=<:>
set dictionary=/usr/share/dict/words
set clipboard=unnamed

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
" set notimeout
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

" Wrapping {{{

" http://vimcasts.org/episodes/soft-wrapping-text/
command! -nargs=* Wrap set wrap linebreak nolist

" Enable soft-wrapping for text files
autocmd FileType text,markdown,html setlocal wrap linebreak nolist

"Wrap visually selected text
vnoremap (  <ESC>`>a)<ESC>`<i(<ESC>
vnoremap )  <ESC>`>a)<ESC>`<i(<ESC>
vnoremap {  <ESC>`>a}<ESC>`<i{<ESC>
vnoremap }  <ESC>`>a}<ESC>`<i{<ESC>
vnoremap "  <ESC>`>a"<ESC>`<i"<ESC>
vnoremap '  <ESC>`>a'<ESC>`<i'<ESC>
vnoremap `  <ESC>`>a`<ESC>`<i`<ESC>
vnoremap [  <ESC>`>a]<ESC>`<i[<ESC>
vnoremap ]  <ESC>`>a]<ESC>`<i[<ESC>

" }}}

" }}}

" Backups {{{

set undodir=~/.vim/tmp/undo//       " undo files
set backupdir=~/.vim/tmp/backup//   " backups
set directory=~/.vim/tmp/swap//     " swap files
set undofile
set nobackup                        " disable backups
set noswapfile                      " It's 2012, Vim.

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
" Convenience mappings ---------------------------------------------------- {{{

" Fuck you, help key.
noremap  <F1> :set invfullscreen<CR>
inoremap <F1> <ESC>:set invfullscreen<CR>a

" Unfuck my screen
nnoremap <leader>u :syntax sync fromstart<cr>:redraw!<cr>

" Change inside quotes with <leader>-" and <leader>-'
nnoremap <Leader>' ci'
nnoremap <Leader>" ci"

" Go to last edit location with ,.
nnoremap ,. '.

nnoremap ; :

" Go to previous word
map E <Plug>CamelCaseMotion_b

" Add spaces around a symbol with Ctrl-Space
nnoremap <C-Space> i <esc><right>a <esc>

" create <%= foo %> erb tags using ctrl-k in insert mode
imap <silent> <c-\><c-\> <%=  %><esc>2hi
" create <%= foo %> erb tags using Ctrl-j in insert mode
imap <silent> <C-\> <%  %><Esc>2hi

" create <%= foo %> erb tags using ctrl-k in insert mode
" insert a => hashrocket
imap <silent> <c-l> =>

" System clipboard interaction {{{

"<Ctrl-X> -- cut (goto visual mode and cut)
imap <C-X> <C-O>vgG
vmap <C-X> "*x<Esc>i

"<Ctrl-C> -- copy (goto visual mode and copy)
imap <C-C> <C-O>vgG
vmap <C-C> "*y<Esc>i

"<Ctrl-A> -- copy all
imap <C-A> <C-O>gg<C-O>gH<C-O>G<Esc>
vmap <C-A> <Esc>gggH<C-O>G<Esc>i

"<Ctrl-V> -- paste
nm \\paste\\ "=@*.'xy'<CR>gPFx"_2x:echo<CR>
imap <C-V> x<Esc>\\paste\\"_s
vmap <C-V> "-cx<Esc>\\paste\\"_x

" }}}

" Clean trailing whitespace
nnoremap <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Make backspace work sanely in visual mode
vnoremap <bs> x

" make Y consistent with C and D
nnoremap Y y$

" TextMate’s key mappings for identation
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" Insert New Line
map <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
map <Enter> o<ESC>

" Go to previous file
map <Leader>p <C-^> 

" Change case
inoremap <C-u> <esc>mzgUiw`za

" Panic Button
nnoremap <f7> mzggg?G`z

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Diffoff
nnoremap <leader>D :diffoff!<cr>

" Easier linewise reselection
nnoremap <leader>V V`]

" Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Typos
command! -bang E e<bang>
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Wq wq<bang>
command! -bang WQ wq<bang>

" Toggle paste
set pastetoggle=<F6>

" Toggle [i]nvisible characters
nnoremap <leader>i :set list!<cr>

" Has to be an autocommand because repeat.vim eats the mapping otherwise :(
au VimEnter * :nnoremap U <c-r>

" Drag Lines {{{
" Alt+j and Alt+k to drag lines in any mode
noremap ∆ :m+<CR>
noremap ˚ :m-2<CR>
inoremap ∆ <Esc>:m+<CR>
inoremap ˚ <Esc>:m-2<CR>
vnoremap ∆ :m'>+<CR>gv
vnoremap ˚ :m-2<CR>gv
" }}}

" Easy filetype switching {{{
nnoremap _md :set ft=markdown<CR>
nnoremap _hd :set ft=htmldjango<CR>
nnoremap _jt :set ft=htmljinja<CR>
nnoremap _js :set ft=javascript<CR>
nnoremap _rb :set ft=ruby<CR>
nnoremap _cs :set ft=css<CR>
nnoremap _cw :set ft=confluencewiki<CR>
nnoremap _pd :set ft=python.django<CR>
nnoremap _d  :set ft=diff<CR>
" }}}

" Insert Mode Completion {{{
inoremap <c-f> <c-x><c-f>
inoremap <c-]> <c-x><c-]>
" }}}

" Quick editing {{{
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" }}}

" }}}
" Searching and movement -------------------------------------------------- {{{

" Use sane regexes.
" nnoremap / /\v
" vnoremap / /\v

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault
set viminfo='100,f1  "Save up to 100 marks, enable capital marks

set scrolloff=5
set sidescroll=1
set sidescrolloff=10

set virtualedit+=block

noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>

" Made D behave
nnoremap D d$

" Don't move on *
nnoremap * *<c-o>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
vnoremap L g_

" make the tab key match bracket pairs
nnoremap <tab> %
vnoremap <tab> %

" Heresy
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A

" gi already moves to "last place you exited insert mode", so we'll map gI to
" something similar: move to last change
nnoremap gI `.

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Ack for the last search.
nnoremap <silent> <leader>/ :execute "Ack! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>

" Start searching with Ack
nnoremap <leader>a :Ack

" Toggle "keep current line in the center of the screen" mode
nnoremap <leader>C :let &scrolloff=999-&scrolloff<cr>

" Directional Keys {{{

" It's 2012.
noremap j gj
noremap k gk
noremap gj j
noremap gk k
noremap E ge

" Easy buffer navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Use numbers to pick the tab you want (like iTerm)
map <silent> <D-1> :tabn 1<cr>
map <silent> <D-2> :tabn 2<cr>
map <silent> <D-3> :tabn 3<cr>
map <silent> <D-4> :tabn 4<cr>
map <silent> <D-5> :tabn 5<cr>
map <silent> <D-6> :tabn 6<cr>
map <silent> <D-7> :tabn 7<cr>
map <silent> <D-8> :tabn 8<cr>
map <silent> <D-9> :tabn 9<cr>

" Resize vertical windows by hitting plus and minus
nnoremap <silent> + <C-w>+
nnoremap <silent> - <C-w>-

" Vertical and horizontal split then hop to a new buffer
:noremap <Leader>v :vsp^M^W^W<cr>
:noremap <Leader>h :split^M^W^W<cr>

" }}}

" }}}
" Folding ----------------------------------------------------------------- {{{

set foldlevelstart=0

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

" }}}
" Filetype-specific ------------------------------------------------------- {{{

" C {{{

augroup ft_c
    au!
    au FileType c setlocal foldmethod=syntax
augroup END

" }}}

" CSS, SASS and LessCSS {{{

augroup ft_css
    au!

    au BufNewFile,BufRead *.less setlocal filetype=less

    au Filetype sass,scss,less,css setlocal foldmethod=marker
    au Filetype sass,scss,less,css setlocal foldmarker={,}
    au Filetype sass,scss,less,css setlocal omnifunc=csscomplete#CompleteCSS
    au Filetype sass,scss,less,css setlocal iskeyword+=-

    " Use <leader>S to sort properties.  Turns this:
    "
    "     p {
    "         width: 200px;
    "         height: 100px;
    "         background: red;
    "
    "         ...
    "     }
    "
    " into this:

    "     p {
    "         background: red;
    "         height: 100px;
    "         width: 200px;
    "
    "         ...
    "     }
    au BufNewFile,BufRead *.sass,*.scss,*.less,*.css nnoremap <buffer> <localleader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

    " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
    " positioned inside of them AND the following code doesn't get unfolded.
    au BufNewFile,BufRead *.sass,*.scss,*.less,*.css inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>

    " Compiling Less Files from Vim every save action
    autocmd BufWritePost,FileWritePost *.less :silent !lessc <afile> <afile>:p:r.css
augroup END

" }}}

" HTML and HTMLDjango {{{

let g:html_indent_tags = ['p', 'li']

augroup ft_html
    au!

    au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    au FileType html,jinja,htmldjango setlocal omnifunc=htmlcomplete#CompleteTags
    au FileType html,jinja,htmldjango setlocal foldmethod=manual

    " Use <localleader>f to fold the current tag.
    au FileType html,jinja,htmldjango nnoremap <buffer> <localleader>f Vatzf

    " Use <localleader>t to fold the current templatetag.
    au FileType html,jinja,htmldjango nmap <buffer> <localleader>t viikojozf

    " Indent tag
    au FileType html,jinja,htmldjango nnoremap <buffer> <localleader>= Vat=

augroup END

" }}}

" Java {{{

augroup ft_java
    au!

    au FileType java setlocal foldmethod=marker
    au FileType java setlocal foldmarker={,}
augroup END

" }}}

" Javascript {{{

augroup ft_javascript
    au!

    au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    au FileType javascript setlocal foldmethod=marker
    au FileType javascript setlocal foldmarker={,}

    " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
    " positioned inside of them AND the following code doesn't get unfolded.
    au Filetype javascript inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
augroup END

" }}}

" Lisp {{{

augroup ft_lisp
    au!
    au FileType lisp call TurnOnLispFolding()
augroup END

" }}}

" Markdown {{{

augroup ft_markdown
    au!

    au BufNewFile,BufRead *.markdown,*.md,*.mdown,*.mkd,*.mkdn setlocal ft=markdown

    au FileType markdown setlocal foldenable
    au FileType markdown setlocal omnifunc=htmlcomplete#CompleteTags

    " Use <localleader>1/2/3 to add headings.
    au Filetype markdown nnoremap <buffer> <localleader>1 yypVr=
    au Filetype markdown nnoremap <buffer> <localleader>2 yypVr-
    au Filetype markdown nnoremap <buffer> <localleader>3 I### <ESC>
augroup END

" }}}

" Nginx {{{

augroup ft_nginx
    au!

    au BufRead,BufNewFile /etc/nginx/conf/*                      set ft=nginx
    au BufRead,BufNewFile /etc/nginx/sites-available/*           set ft=nginx
    au BufRead,BufNewFile /usr/local/etc/nginx/sites-available/* set ft=nginx
    au BufRead,BufNewFile vhost.nginx                            set ft=nginx
    au BufRead,BufNewFile nginx.conf*                            set ft=nginx

    au FileType nginx setlocal foldmethod=marker foldmarker={,}
augroup END

" }}}

" Python {{{

augroup ft_python
    au!

    au FileType python setlocal omnifunc=pythoncomplete#Complete
    au FileType python setlocal define=^\s*\\(def\\\\|class\\)
    au FileType python compiler nose
    au FileType man nnoremap <buffer> <cr> :q<cr>

    " Jesus tapdancing Christ, built-in Python syntax, you couldn't let me
    " override this in a normal way, could you?
    au FileType python if exists("python_space_error_highlight") | unlet python_space_error_highlight | endif

    " Jesus, Python.  Five characters of punctuation for a damn string?
    au FileType python inoremap <buffer> <c-g> _(u'')<left><left>

    au FileType python inoremap <buffer> <c-b> """"""<left><left><left>
augroup END

" }}}

" QuickFix {{{

augroup ft_quickfix
    au!
    au Filetype qf setlocal colorcolumn=0 nolist nocursorline nowrap tw=0
augroup END

" }}}

" Ruby {{{

augroup ft_ruby
    au!
    au FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
    au Filetype ruby setlocal foldmethod=syntax
augroup END

" }}}

" Text {{{

" Set File type to 'text' for files ending in .txt and .asciidoc
au BufNewFile,BufRead *.txt,*.asciidoc  setfiletype asciidoc
" }}}

" Json {{{
au! BufRead,BufNewFile *.json set filetype=json foldmethod=syntax 
" }}}

" Vim {{{

augroup ft_vim
    au!

    au FileType vim setlocal foldenable
    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

" }}}

" }}}
" Mini-plugins ------------------------------------------------------------ {{{

" Stuff that should probably be broken out into plugins, but hasn't proved to be
" worth the time to do so just yet.

" Indent Guides {{{

let g:indentguides_state = 0
function! IndentGuides() " {{{
    if g:indentguides_state
        let g:indentguides_state = 0
        2match None
    else
        let g:indentguides_state = 1
        execute '2match IndentGuides /\%(\_^\s*\)\@<=\%(\%'.(0*&sw+1).'v\|\%'.(1*&sw+1).'v\|\%'.(2*&sw+1).'v\|\%'.(3*&sw+1).'v\|\%'.(4*&sw+1).'v\|\%'.(5*&sw+1).'v\|\%'.(6*&sw+1).'v\|\%'.(7*&sw+1).'v\)\s/'
    endif
endfunction " }}}
hi def IndentGuides guibg=#303030
nnoremap <leader>I :call IndentGuides()<cr>

" }}}

" }}}
" Environments (GUI/Console) ---------------------------------------------- {{{

if has('gui_running')
    " GUI Vim

    set t_Co=256 "tell the term has 256 colors

    set guifont=Menlo\ Regular\ for\ Powerline:h12
    "set guifont=Inconsolata:h16,Monaco:h17

    " Show tab number (useful for Cmd-1, Cmd-2.. mapping)
    " For some reason this doesn't work as a regular set command,
    " (the numbers don't show up) so I made it a VimEnter event
    autocmd VimEnter * set guitablabel=%N:\ %t\ %M

    " Remove all the UI cruft

    set go-=T " Disable the macvim toolbar
    set go-=l

    " Disable the scrollbars (NERDTree)
    set go-=L
    set go-=r
    set go-=R
    set go+=c " remove mac dialogs or Ctrl+F7 toggles keyboard dialog navigation

    highlight SpellBad term=underline gui=undercurl guisp=Orange

    " Different cursors for different modes.
    set guicursor=n-c:block-Cursor-blinkon0
    set guicursor+=v:block-vCursor-blinkon0
    set guicursor+=i-ci:ver20-iCursor

    if has("gui_macvim")
        " Full screen means FULL screen
        set fuoptions=maxvert,maxhorz

        " Use the normal HIG movements, except for M-Up/Down
        let macvim_skip_cmd_opt_movement = 1
        no   <D-Left>       <Home>
        no!  <D-Left>       <Home>
        no   <M-Left>       <C-Left>
        no!  <M-Left>       <C-Left>

        no   <D-Right>      <End>
        no!  <D-Right>      <End>
        no   <M-Right>      <C-Right>
        no!  <M-Right>      <C-Right>

        no   <D-Up>         <C-Home>
        ino  <D-Up>         <C-Home>
        imap <M-Up>         <C-o>{

        no   <D-Down>       <C-End>
        ino  <D-Down>       <C-End>
        imap <M-Down>       <C-o>}

        imap <M-BS>         <C-w>
        inoremap <D-BS>     <esc>my0c`y
    else
        " Non-MacVim GUI, like Gvim

        "dont load csapprox if we no gui support - silences an annoying warning
        let g:CSApprox_loaded = 1
    end
else
    " Console Vim
    " For me, this means iTerm2, possibly through tmux

    " Mouse support
    set mouse=a
endif

" }}}
" Other ------------------------------------------------------------------- {{{

" Extend .vimrc
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" }}}
