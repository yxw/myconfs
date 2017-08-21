" Refered to: 
"   1. http://mislav.uniqpath.com/2011/12/vim-revisited/
"   2. Amix - http://amix.dk/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tips  -- by WillYang
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   1. <buffer>, <silent>, <special>, <script>, <expr> and <unique> are SPECIAL 
"    map arguments. They can be used in any order, but they must appear right after
"    the command, before any other arguments.
"    <buffer>: To make the mapping be effective in the current buffer ONLY.
"    <silent>: To define a mapping which will not be echoed on the command line.
"       ':silent' is command too.
"    <special>: To define a mapping with <> notation for special keys, even though
"               the '<' flag may appear in 'cpoptions'. e.g.:
"               :map <special> <F12> /Header<CR>
"    others see: http://vimdoc.sourceforge.net/htmldoc/map.html#:abbreviate-%3Cbuffer%3E
"
"   2. <Leader>
"    To define a mapping, which uses the 'mapleader' variable, the special string 
"    <Leader> can be used. It is replaced with the string value of 'mapleader'.
"    If 'mapleader' is not set or empty, a backslash is used instead.
"
"    <LocalLeader> is just like <Leader>, except that it uses 'maplocalleader' instead
"    of 'mapleader'. <LocalLeader> is to be used for mappings which are local to a buffer.
"
"   3. *map: map in different model
"    :nmap (:nm)    Normal mode (When typing commands)
"    Visual mode    (when typing commands while the Visual area is highlighted.
"    Operator-pending mode: When an operator is pending (after "d", "y", "c", etc.)
"
"   4. ruler: show the line and column number of the cursor position, seperated by a comma.
"
"   5. key maps:
"    notation   meaning     
"    <BS>       backspace 
"    <NL>       linefeed
"    <CR>,<Enter>       <Return>
"    <Bar>      |
"    <Left>     cursor-left (left arrow?)
"    <S-Left>     shift-cursor-up
"    <C-Left>     contral-cursor-left
"    <S-...>     shift-key
"    <C-...>     control-key
"    <M-...>     alt-key or meta-key
"    <A-...>     same as <M-...>
"    <D-...>     command-key (Mac only)
"    others use ":help xxx" to see details
"
"   6. iab <key> <expansion>:
"    Typing <key> (insert mode) and space will be expanded to <expansion>
"
"
"   7. In a search, \s finds whitespace, and \+ finds one or more occurrences
"    see: DeleteTrailingWS()
"
"   8. "1p, "3p, etc:
"    paste the last x delete
"    more sophiscated functions see yanking plugin
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" must be first line
set nocompatible                " choose no compatibility with legacy vi

" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier.
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Encodings
    
    " make vim recognize different kinds of file encodings
    let &termencoding=&encoding
    set fileencodings=utf-8,gbk,ucs-bom,cp936
    set encoding=utf-8
    set guifontwide=NSimSun


    set showcmd                     " display incomplete commands
    filetype plugin indent on       " load file type plugins + indentation
    set nu                          " Line numbers on

    "Set mapleader
    let mapleader = ","

    "" Whitespace
    " set nowrap                      " don't wrap lines
    " Wrap lines
    set wrap
    set tabstop=4 shiftwidth=4      " a tab is two spaces (or set this to 4)
    set expandtab                   " use spaces, not tabs (optional)
    set backspace=indent,eol,start  " backspace through everything in insert mode

    "Bbackspace and cursor keys wrap to
    "Allow specified keys that move the cursor left/right to move to 
    "the prev/next line when the cursor is no the first/last char in the line.
    " < and > means <Left> and <Right>
    set whichwrap+=<,>,h,l

    "" Searching
    set hlsearch                    " highlight matches
    set incsearch                   " incremental searching
    set ignorecase                  " searches are case insensitive...
    set smartcase                   " ... unless they contain at least one capital letter

    "Set magic on
    "Changes the special characters that can be used in search patterns.
    set magic

    "No sound on errors.
    set noerrorbells
    set novisualbell
    set t_vb=

    "show matching bracets
    set showmatch

    "How many tenths of a second to blink
    set mat=2

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
    "Always hide the statusline
    set laststatus=2

    function! CurDir()
        let curdir = substitute(getcwd(), expand('~'), "~/", "g")
        return curdir
    endfunction

    "Format the statusline
    set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn backup off
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Moves
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "Set 5 lines to the curors - when moving vertical..
    set so=5


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Plug-ins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    """ pathogen.vim
    execute pathogen#infect()

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "" => Colors and Fonts
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "" coloring use solarized color scheme
    syntax enable
    " Assume a dark background for terminal and light for GUI
    if has('gui_running')
        set background=light
        
        " Font setting on different platform
        if has("gui_gtk2")
            set guifont=Inconsolata\ 12
        elseif has("gui_macvim")
            set guifont=Menlo\ Regular:h14
        elseif has("gui_win32")
            set guifont=Consolas:h11:cANSI
        endif
        
    else
       set background=dark
    endif
    set t_Co=16
    let g:solarized_termcolors=16
    colorscheme solarized

    """ Settings for twitvim
    "let twitvim_browser_cmd = '/usr/bin/firefox'
    let twitvim_force_ssl = 1

