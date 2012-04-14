" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" =============== Pathogen Initialization ===============
" This loads all the plugins in ~/.vim/bundle
" Use tpope's pathogen plugin to manage all other plugins

  runtime bundle/tpope-vim-pathogen/autoload/pathogen.vim
  call pathogen#infect()
  call pathogen#helptags()

" ================ General Config ====================

let mapleader = ","
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set cursorline
set ttyfast

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" alias yw to yank the entire word 'yank inner word'
" even if the cursor is halfway inside the word
" FIXME: will not properly repeat when you use a dot (tie into repeat.vim)
nnoremap ,yw yiww

" ,ow = 'overwrite word', replace a word with what's in the yank buffer
" FIXME: will not properly repeat when you use a dot (tie into repeat.vim)
nnoremap ,ow "_diwhp

"make Y consistent with C and D
nnoremap Y y$

" Professor VIM says '87% of users prefer jj over esc', jj abrams disagrees
imap jj <Esc>

" TextMate’s key mappings for identation
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" ================ Search Settings  =================

set viminfo='100,f1  "Save up to 100 marks, enable capital marks
set ignorecase " Ignore case when searching 
set smartcase " Ignore case when searching lowercase
set gdefault
set incsearch        "Find the next match as we type the search
set showmatch
set hlsearch         "Hilight searches by default

" This turns off Vim’s crazy default regex characters and makes searches use normal regexes
nnoremap / /\v
vnoremap / /\v

"Clear current search highlight
nmap <leader><space> :noh<CR>

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1


" ======= RSI Prevention - keyboard remaps ==========
"
" Certain things we do every day as programmers stress
" out our hands. For example, typing underscores and
" dashes are very common, and in position that require
" a lot of hand movement. Vim to the rescue
"

" Arpeggio lets us define key-chord combos (simultaneous key presses)
call arpeggio#load()

" Now using the middle finger of either hand you can type
" underscores with apple-k or apple-d, and add Shift
" to type dashes
imap <silent> <D-k> _
imap <silent> <D-d> _
imap <silent> <D-K> -
imap <silent> <D-D> -

" Use the two first fingers on both sides of the keyboard
" simultaneously to go to the beginning or end of line
Arpeggio nnoremap jk $
Arpeggio nnoremap fd 0

" Change inside quotes with <leader>-" and <leader>-'
nnoremap <Leader>' ci'
nnoremap <Leader>" ci"

" Add spaces around a symbol with Ctrl-Space
nnoremap <C-Space> i <esc><right>a <esc>

"Go to last edit location with ,.
nnoremap ,. '.

"When typing a string, your quotes auto complete. Move past the quote
"while still in insert mode by hitting Ctrl-a. Example:
"
" type 'foo<c-a>
"
" the first quote will autoclose so you'll get 'foo' and hitting <c-a> will
" put the cursor right after the quote
imap <C-a> <esc>wa

" make the tab key match bracket pairs
nnoremap <tab> %
vnoremap <tab> %

" ,q to toggle quickfix window (where you have stuff like GitGrep)
" ,oq to open it back up (rare)
nmap <silent> ,qc :cclose<CR>
nmap <silent> ,qo :copen<CR>

" move up/down quickly by using Cmd-j, Cmd-k
" which will move us around by functions
nnoremap <silent> <D-j> }
nnoremap <silent> <D-k> {
autocmd FileType ruby map <buffer> <D-j> ]m
autocmd FileType ruby map <buffer> <D-k> [m
autocmd FileType rspec map <buffer> <D-j> }
autocmd FileType rspec map <buffer> <D-k> {

"Move back and forth through previous and next buffers
"with ,z and ,x
nnoremap <silent> ,z :bp<CR>
nnoremap <silent> ,x :bn<CR>

" create <%= foo %> erb tags using Ctrl-k in edit mode
imap <silent> <C-K> <%=   %><Esc>3hi

" create <%= foo %> erb tags using Ctrl-j in edit mode
imap <silent> <C-J> <%  %><Esc>2hi

" Apple-* Highlight all occurrences of current word (like '*' but without moving)
" http://vim.wikia.com/wiki/Highlight_all_search_pattern_matches
nnoremap <D-*> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" These are very similar keys. Typing 'a will jump to the line in the current
" file marked with ma. However, `a will jump to the line and column marked
" with ma.  It’s more useful in any case I can imagine, but it’s located way
" off in the corner of the keyboard. The best way to handle this is just to
" swap them: http://items.sjbach.com/319/configuring-vim-right
" nnoremap ' `
" nnoremap ` '

" Go to previous file
map <Leader>p <C-^>

" =================== GUI ===========================
"
" Make it beautiful - colors and fonts
if has("gui_running")
  "tell the term has 256 colors
  set t_Co=256

  colorscheme monokai
  set background=dark

  " Show tab number (useful for Cmd-1, Cmd-2.. mapping)
  " For some reason this doesn't work as a regular set command,
  " (the numbers don't show up) so I made it a VimEnter event
  autocmd VimEnter * set guitablabel=%N:\ %t\ %M

  " fullscreen options (MacVim only), resized window when changed to fullscreen
  set fuoptions=maxvert,maxhorz 

  " remove mac dialogs or Ctrl+F7 toggles keyboard dialog navigation
  set guioptions+=c

  set columns=190
  set lines=60

  set guifont=Inconsolata:h16,Monaco:h17
else
  "dont load csapprox if we no gui support - silences an annoying warning
  let g:CSApprox_loaded = 1
endif

" Disable the scrollbars (NERDTree)
set guioptions-=r
set guioptions-=L

" Disable the macvim toolbar
set guioptions-=T

" ========= Window/Tab/Split Manipulation ==============
"
" Move between split windows by using the four directions H, L, I, N
" (note that  I use I and N instead of J and K because  J already does
" line joins and K is mapped to GitGrep the current word
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-j> <C-w>j

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

" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" Resize vertical windows by hitting plus and minus
nnoremap <silent> + <C-w>+
nnoremap <silent> - <C-w>-

" Vertical and horizontal split then hop to a new buffer
:noremap <Leader>v :vsp^M^W^W<cr>
:noremap <Leader>h :split^M^W^W<cr>

set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

" ================ Plugins ==========================

" ============================
" TagBar
" ============================
"open the taglist (method browser) using ,t
nnoremap <silent> ,T :TagbarToggle<CR>

" ============================
" tComment
" ============================
" extensions for tComment plugin. Normally
" tComment maps 'gcc' to comment current line
" this adds 'gcp' comment current paragraph (block)
" using tComment's built in <c-_>p mapping
nmap <silent> gcp <c-_>p

" Command-/ to toggle comments
map <silent> <Leader>c :TComment<CR>
imap <silent> <Leader>c <Esc>:TComment<CR>i

" ============================
" AutoTag
" ============================
" Seems to have problems with some vim files
let g:autotagExcludeSuffixes="tml.xml.text.txt.vim"

" ============================
" CamelCaseMotion
" ============================
map w <Plug>CamelCaseMotion_w
map b <Plug>CamelCaseMotion_b
map e <Plug>CamelCaseMotion_e

sunmap w
sunmap b
sunmap e

" ============================
" CoffeeScript
" ============================
au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!

" ============================
" CtrlP
" ============================
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

" Default to filename searches - so that appctrl will find application
" controller
let g:ctrlp_by_filename = 0

let g:ctrlp_working_path_mode = 0

" We don't want to use Ctrl-p as the mapping because
" it interferes with YankRing (paste, then hit ctrl-p)
let g:ctrlp_map = ',t'

" Additional mapping for buffer search
nnoremap ,b :CtrlPBuffer<cr>
nnoremap <C-b> :CtrlPBuffer<cr>

" Cmd-Shift-P to clear the cache
nnoremap <silent> <D-P> :ClearCtrlPCache<cr>

nmap <Leader>t :CtrlP<C-d><CR>

" Idea from : http://www.charlietanksley.net/blog/blog/2011/10/18/vim-navigation-with-lustyexplorer-and-lustyjuggler/
" Open CtrlP starting from a particular path, making it much
" more likely to find the correct thing first. mnemonic 'jump to [something]'
map ,jm :CtrlP app/models<CR>
map ,jc :CtrlP app/controllers<CR>
map ,jv :CtrlP app/views<CR>
map ,jh :CtrlP app/helpers<CR>
map ,jl :CtrlP lib<CR>
map ,jp :CtrlP public<CR>
map ,js :CtrlP spec<CR>
map ,jf :CtrlP fast_spec<CR>
map ,jt :CtrlP test<CR>
map ,jd :CtrlP db<CR>
map ,jC :CtrlP config<CR>
map ,jV :CtrlP vendor<CR>
map ,jF :CtrlP factories<CR>

" ============================
" EasyMotion
" ============================
" This remaps easymotion to show us only the left
" hand home row keys as navigation options which 
" may mean more typing to get to a particular spot
" but it'll all be isolated to one area of the keyboard
call EasyMotion#InitOptions({
\   'leader_key'      : '<Leader><Leader>'
\ , 'keys'            : 'fjdkslewio'
\ , 'do_shade'        : 1
\ , 'do_mapping'      : 1
\ , 'grouping'        : 1
\
\ , 'hl_group_target' : 'Question'
\ , 'hl_group_shade'  : 'EasyMotionShade'
\ })

" Make EasyMotion more yellow, less red
hi clear EasyMotionTarget
hi! EasyMotionTarget guifg=yellow

" ============================
" fugitive.git
" ============================
" For fugitive.git, dp means :diffput. Define dg to mean :diffget
nnoremap <silent> ,dg :diffget<CR>
nnoremap <silent> ,dp :diffput<CR>

map <Leader>ggs :Gstatus<CR>
map <Leader>ggc :Gcommit<CR>
map <Leader>ggb :Gblame<CR>
"add the current file to commit
map <Leader>gga :Gwrite<CR>
map <Leader>ggd :Gdiff<CR>

" ============================
" GitGrep
" ============================
"git grep the current word using K (mnemonic Kurrent)
nnoremap <silent> K :GitGrep <cword><CR>
function! GetVisual()
        let reg_save = getreg('"')
        let regtype_save = getregtype('"')
        let cb_save = &clipboard
        set clipboard&
        normal! ""gvy
        let selection = getreg('"')
        call setreg('"', reg_save, regtype_save)
        let &clipboard = cb_save
        return selection
endfunction

"git grep visual selection
vnoremap K :<C-U>execute GitGrep(GetVisual())<CR>

"git grep current word up to the next exclamation point using ,K
nnoremap ,K viwf!:<C-U>execute GitGrep(GetVisual())<CR>

"grep for 'def foo'
nnoremap <silent> ,gd :GitGrep 'def <cword>'<CR>

"GitGrep - open up a git grep line, with a quote started for the search
nnoremap ,gg :GitGrep ""<left>
"GitGrep Current Partial
nnoremap ,gcp :GitGrepCurrentPartial<CR>
"GitGrep Current File
nnoremap ,gcf :call GitGrep(expand("%:t:r"))<CR>

" ============================
" CTags
" ============================
" hit ,f to find the definition of the current class
" this uses ctags. the standard way to get this is Ctrl-]
nnoremap <silent> ,f <C-]>

" use ,F to jump to tag in a vertical split
nnoremap <silent> ,F :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr>

" use ,gf to go to file in a vertical split
nnoremap <silent> ,gf :vertical botright wincmd f<CR>

" ============================
" NERD tree
" ============================
" Make nerdtree look nice
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

" Auto open nerd tree on startup
let g:nerdtree_tabs_open_on_gui_startup = 1
" Focus in the main content window
let g:nerdtree_tabs_focus_on_files = 1

nmap <Leader>n :NERDTreeTabsToggle<CR>

" Open the project tree and expose current file in the nerdtree with Ctrl-\
nnoremap <Leader>\ :NERDTreeFind<CR>

" ============================
" Tabularize - alignment
" ============================
" Hit Cmd-Shift-A then type a character you want to align by
nmap <D-A> :Tabularize /
vmap <D-A> :Tabularize /

" ============================
" SplitJoin plugin
" ============================
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

" ============================
" VimBookmarking
" ============================
" Set anonymous bookmarks
nmap ,Bb :ToggleBookmark<cr>
nmap ,Bn :NextBookmark<cr>
nmap ,Bp :PreviousBookmark<cr>
nmap ,Bc :ClearBookmarks<cr>

" w!! to write a file as sudo
" stolen from Steve Losh
cmap w!! w !sudo tee % >/dev/null

" ============================
" yankring
" ============================
let g:yankring_history_file = '.yankring-history'

" ============================
" Sytastic
" ============================
"mark syntax errors with :signs
let g:syntastic_enable_signs=1
"automatically jump to the error when saving the file
let g:syntastic_auto_jump=0
"show the error list automatically
let g:syntastic_auto_loc_list=1
"don't care about warnings
let g:syntastic_quiet_warnings=0

" ============================
" Sorround
" ============================
" via: http://whynotwiki.com/Vim
" Ruby
" Use v or # to get a variable interpolation (inside of a string)}
" ysiw#   Wrap the token under the cursor in #{}
" v...s#  Wrap the selection in #{}
let g:surround_113 = "#{\r}"   " v
let g:surround_35  = "#{\r}"   " #

" Select text in an ERb file with visual mode and then press s- or s=
" Or yss- to do entire line.
let g:surround_45 = "<% \r %>"    " -
let g:surround_61 = "<%= \r %>"   " =

" Remove key map becuase has conflicts with tComment
autocmd VimEnter * nunmap <Leader>ci

" ============================
" Unimpaired
" ============================
" https://github.com/carlhuda/janus/blob/master/vimrc

" Unimpaired configuration
" Bubble single lines
nmap <C-k> [e
nmap <C-j> ]e

nmap <C-Up> [e
nmap <C-Down> ]e

" Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv

vmap <C-Up> [egv
vmap <C-Down> ]egv

" ============================
" QuickFix Search
" ============================
" Stolen from Steve Losh vimrc: https://bitbucket.org/sjl/dotfiles/src/tip/vim/.vimrc
" Open a Quickfix window for the last search.
nnoremap <silent> <leader>q/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Ack for the last search.
nnoremap <silent> <leader>qa/ :execute "Ack! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>

" GitGrep the last search (my own invention)
nnoremap <silent> <leader>qg/ :execute "GitGrep '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>

" ============================
" Persist Undo
" ============================
" persistent undos - undo after you re-open the file
" but this gives warnings under command line vim
" use only in macvim
if v:version > '702'
  set undodir=~/.vim/backups
  set undofile
endif

" ============================
" Gundo
" ============================
nmap ,u :GundoToggle<CR>

" open on the right so as not to compete with the nerdtree
let g:gundo_right = 1 

" a little wider for wider screens
let g:gundo_width = 60

" ============================
" PowerLine
" ============================
let g:Powerline_symbols='fancy'
" let g:Powerline_theme='skwp'
" let g:Powerline_colorscheme='skwp'

" ============================
" Lusty Juggler
" ============================
let g:LustyJugglerSuppressRubyWarning = 1
let g:LustyJugglerAltTabMode = 1
let g:LustyJugglerShowKeys = 'a' " show a/s/d/f keys 

" ============================
" ShowMarks
" ============================
" Tell showmarks to not include the various brace marks (),{}, etc
let g:showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXY"

" ============================
" Solarized
" ============================
hi! link txtBold Identifier

" ============================
" Neocomplcache
" ============================
" A beter autocomplete system!

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_smart_case = 1

" default # of completions is 100, that's crazy
let g:neocomplcache_max_list = 5

" words less than 3 letters long aren't worth completing
let g:neocomplcache_auto_completion_start_length = 3

" Map standard Ctrl-N completion to Cmd-Space
inoremap <C-Space> <C-n>

" This makes sure we use neocomplcache completefunc instead of 
" the one in rails.vim, otherwise this plugin will crap out
let g:neocomplcache_force_overwrite_completefunc = 1

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Enable omni completion.
autocmd FileType css,sass,scss,less setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

" ============================
" Others Stuff
" ============================
" via: http://rails-bestpractices.com/posts/60-remove-trailing-whitespace
" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()
nmap ,w :StripTrailingWhitespaces<CR>

" Use Q to intelligently close a window 
" (if there are multiple windows into the same buffer)
" or kill the buffer entirely if it's the last window looking into that buffer
function! CloseWindowOrKillBuffer()
  let number_of_windows_to_this_buffer = len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))

  if number_of_windows_to_this_buffer > 1
    wincmd c
  else
    bdelete
  endif
endfunction

nnoremap <silent> Q :call CloseWindowOrKillBuffer()<CR>

" WRAPPING ====
" http://vimcasts.org/episodes/soft-wrapping-text/
function! SetupWrapping()
  set wrap linebreak nolist
  set showbreak=…
endfunction

" TODO: this should happen automatically for certain file types (e.g. markdown)
command! -nargs=* Wrap :call SetupWrapping()<CR>

" This will disable the arrow keys while you’re in normal mode to help you learn to use hjkl.
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>

map <up> gk
imap <up> <C-o>gk
map <down> gj
imap <down> <C-o>gj

map j gj
map k gk
vmap $ g$
vmap ^ g^
vmap 0 g^
nmap j gj
nmap k gk
nmap $ g$
nmap ^ g^
nmap 0 g^
map E <Plug>CamelCaseMotion_b

" get rid of that stupid goddamned help key that you will invaribly hit constantly while aiming for escape
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap ; :

au FocusLost * :wa

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
au BufNewFile,BufRead *.less,*.css,*.sass,*.scss nnoremap <buffer> <leader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
" positioned inside of them AND the following code doesn't get unfolded.
au BufNewFile,BufRead *.less,*.css,*.sass,*.scss inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>

"statusline setup
set statusline=%#DiffAdd#
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline=%#DiffAdd#
set statusline+=%f\  
set statusline+=%#LineNr# "switch to colors used for line number
set statusline+=%{fugitive#statusline()}
set statusline+=%#DiffAdd#  "switch back to normal
set statusline+=%=      "left/right separator
set statusline+=%m      "modified flag

"display a warning if &paste is set
set statusline+=%#DiffChange#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%#LineNr# "switch to colors used for line number
set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
set statusline+=%#DiffAdd# "switch to colors used for line number
set statusline+=%c:     "cursor column
set statusline+=%l/%L   "cursor line/total lines
"set statusline+=\ %P    "percent through file
set laststatus=2

"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

" Invisible characters *********************************************************
set list
set listchars=tab:>.,trail:.,extends:#
nmap <leader>i :set list!<CR> " Toggle invisible chars


" Start Colorizer
autocmd VimEnter * ColorHighlight

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
