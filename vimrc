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
