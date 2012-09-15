My vim & bash config files for Mac OSX
======================================

This is a collection of best of breed tools from across the web, from scouring other people's dotfile repos, blogs, and projects.

To install run
--------------
    git clone https://github.com/eduarbo/dotfiles.git ~/.dotfiles && cd ~/.dotfiles && ./install.sh
    git submodule init
    git submodule update

Screenshots
-----------
![iTerm2 with eduarbo color theme](http://i.minus.com/iDiKGtFcFmfl4.png)

Features
--------
* Ctrl + left/right arrows move forward/backward a word on bash
* Up/ down arrow partial search in history
* Added alias for Git, mvim and Directories
* Git repo information on Prompt
* Bash Completion
* Git Completion
* Git Flow Completion
* Nice Prompt
* Nice Color template for iTerm2, based in the [hg prompt from Steve Losh](http://stevelosh.com/projects/hg-prompt/) to adapt it to git.

Vim Configuration
=================

![My Macvim](http://i.minus.com/ig3nxvvgSCZGS.png)

Features
--------
* You can use `Ctrl-c`, `Ctrl-v`, `Ctrl-x`, and `Ctrl-a` for quick yank, paste, cut and select all.
* Drag lines
* Quick editing
* Make the tab key match bracket pairs
* Window navigation with h,j,k,l by holding down the Ctrl key
* Compiling Less files from Vim every save action
* TextMate’s key mappings for identation
* Smart input assistant for (), [], {}, and so on
* Syntax checking for applescript, c, coffee, cpp, css, cucumber, cuda, docbk, erlang, eruby, fortran, gentoo_metadata, go, haml, haskell, html, javascript, json, less, lua, matlab, perl, php, puppet, python, rst, ruby, sass/scss, sh, tcl, tex, vala, xhtml, xml, xslt, yaml, zpt
* Snippets files for various programming languages
* Paste large amounts of text into Vim.

Dependencies
------------

You will need to install those packages:
* Ack
* JSLint
* Less
* cTags

And have VIM version 7.3 In OS X you can install it with brew `brew install macvim`

Also you need to install node.js and npm for install some node packages and
other dependencies.

**Install on Debian / Ubuntu with:**

    sudo apt-get install nodejs npm ack-grep ctags

**Install on OSX (I will suggest to use [homebrew](http://mxcl.github.com/homebrew/)):**

    brew install ack ctags node && curl http://npmjs.org/install.sh | sh

Once you have installed node and npm install these packages required for some
plugins:

    npm install jslint -g
    npm install less -g


Included plugins
----------------

* NERDTree - everyone's favorite tree browser
* ShowMarks - creates a visual gutter to the left of the number column showing you your marks
* CtrlP - `,f` to find a file
* Fugitive - "a git wrapper so awesome, it should be illegal...". Try Gstatus and hit - to toggle files. Git d to see a diff.

Convenience mappings
--------------------

* `jj` - Escape in insert mode
* `;` - Same as `:`
* `,u` - Unfuck my screen (redraw)
* `,w` - Clean trailing whitespace
* `,p` - Go to previous file
* `,D` - Diffoff
* `,V` - Easier linewise reselection
* `Y` - Make Y consistent with C and D
* `S` - Split line
* `,S` - Sort CSS properties
* `,i` - Toggle [i]visible chars
* `,'` - Change inside single quotes
* `,"` - Change inside double quotes
* `Ctrl-Space` - Add spaces around a symbol
* `,.` - Go to last edit location
* `Ctrl-l` - to insert a => hashrocket
* `Ctrl-\Ctrl-\` - Create <%= foo %> erb tags in edit mode
* `Ctrl-\` - Create <% foo %> erb tags in edit mode
* `Alt-j` - Drags lines down in any mode
* `Alt-k` - Drags lines up in any mode
* `Ctrl-f` - File name completition
* `Ctrl-]` - tag completition
* `Enter` - Inserts new line in normal mode
* `Shift-Enter` - Prepends new line in normal mode
* `Ctrl-u` - Change case
* `F7` - Panic buttons ;) try it!
* `:Wrap` - To make Vim break lines without breaking words.
* `F2` - Paste mode, disable all kinds of smartness and just pasting a whole
  buffer of text
* `Q` - Format the current paragraph (or selection)
* `,yy` - Copy to Desktop Environment
* `,pp` - Past from Desktop Environment

**Typos:**
* `E` - :e!
* `Q` - :q!
* `W` - :w!
* `QA` - :qa!
* `Qa` - :qa!
* `Wa` - :wa!
* `WA` - :wa!
* `Wq` - :wq!
* `WQ` - :wq!

**Search/Code Navigation:**
* `*` - Highlight all occurrences of current word
* `,Space` - Clear matches
* `H` - Same as `^`
* `L` - Same as `$`
* `Tab` - Make the tab key match bracket pairs
* `gI` - gi already moves to "last place you exited insert mode", so we'll map gI to something similar: move to last change
* `,?` - Open a Quickfix window for the last search.
* `,/` - Ack for the last search.
* `,a` - Start searching with Ack
* `,C` - Toggle "keep current line in the center of the screen" mode
* `space` - Space to toggle folds.

Plugins
-------

[Sparkup](https://github.com/rstacruz/sparkup): A parser for a condensed HTML format
* `Ctrl-e` - Execute sparkup
* `Ctrl-s` - Jump to the next empty tag/attribute

Troubleshooting
---------------

**Macvim is falling to compile with the correct version, it is using an older
one**

Try this: 
    cd /System/Library/Frameworks/Python.framework/Versions
    sudo mv Current Current-sys
    sudo ln -s /usr/local/Cellar/python/2.7.3/Frameworks/Python.framework/Versions/2.7 Current

    brew install macvim

    sudo mv Current Current-brew
    sudo mv Current-sys Current

Credits
-------

I just compile here all I liked from other projects in just one place, so all the credits are for:

* [YADR](https://github.com/skwp/dotfiles)
* [Steve Losh](https://bitbucket.org/sjl/dotfiles/src)
* [Federico Ramallo](https://github.com/framallo/Vim-for-Rails)

I would also like to thank [Federico](https://github.com/framallo) for transmit me the passion for Vim :)
