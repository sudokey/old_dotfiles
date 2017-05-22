set nocompatible 	" be iMproved, required
filetype off 		" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
	Bundle 'git://github.com/altercation/vim-colors-solarized.git'
	Bundle 'https://github.com/pangloss/vim-javascript'
    Bundle 'https://github.com/mxw/vim-jsx'
    Bundle 'git://github.com/kien/ctrlp.vim.git'
    Bundle 'https://github.com/scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on
" To ignore plugin indent changes, instead use:
" filetype plugin on

" Interface
	" Character encoding used inside Vim
	" Only available when compiled with the +multi_byte feature
	set encoding=utf-8

	" Character encodings considered when starting to edit an existing file
	" Only available when compiled with the +multi_byte feature
	set fileencodings=utf-8,cp1251

	" Always add lf in the end of file
	set fileformat=unix

	" Enhance command-line completion
	" Only available when compiled with the +wildmenu feature
	set wildmenu

	" Set completion mode
	" When more than one match, list all matches and complete first match
	" Then complete the next full match
	set wildmode=list:longest,full

	" Ignore following files when completing file/directory names
	set wildignore+=.hg,.git,.svn
	set wildignore+=*.DS_Store
	set wildignore+=*.pyc
	set wildignore+=*/node_modules/*
	" set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg

	" Set title of the window to filename [+=-] (path) - VIM
	" Only available when compiled with the +title feature
	set title

	" Show (partial) command in the last line of the screen
	" Comment this line if your terminal is slow
	" Only available when compiled with the +cmdline_info feature
	set showcmd

	" Copy indent from current line when starting a new line
	set autoindent

	" Do smart indenting when starting a new line
	" Only available when compiled with the +smartindent feature
	set smartindent

	" Number of spaces to use for each step of (auto)indent
	set shiftwidth=4

	" Use spaces instead of tab
	set expandtab

	" Number of spaces that a tab counts for
	set tabstop=4

	" Number of spaces that a tab counts for while performing editing operations
	set softtabstop=4

    " Number of pixel lines inserted between characters
    " Only in GUI
    set linespace=1

    " Highlight the screen line of the cursor
    " Only available when compiled with the +syntax feature
    set cursorline

    " Turn off cursor blinking in normal mode
    " Only available when compiled with GUI enabled
    set guicursor=n:blinkon0

    " Remove all components and options of the GUI
    " Only available when compiled with GUI enabled
    set guioptions=

    " Number of colors
    set t_Co=256

    " Splitting a window will put the new window below the current one
    " See :sp
    " Only available when compiled with the +windows feature
    set splitbelow

    " Splitting a window will put the new window right of the current one
    " See :vsp
    " Only available when compiled with the +vertsplit feature
    set splitright

    " Don't show the intro message starting Vim
    set shortmess+=I

    " Turn mouse pointer to a up-down sizing arrow
    " Only available when compiled with the +mouseshape feature
    set mouseshape=s:udsizing,m:no

    "  Hide the mouse when typing text
    " Only works in GUI
    set mousehide

    " Edit several files in the same time without having to save them
    set hidden

    " No beeps, no flashes
    set visualbell
    set t_vb=

    " List of directories which will be searched when using :find, gf, etc.
    " Search relative to the directory of the current file
    " Search in the current directory
    " Search downwards in a directory tree
    " Only available when compiled with the +path_extra feature
    set path=.,,**

" Plugins
    " Solarized
    let g:solarized_termcolors=256
    syntax enable
    set background=dark
    colorscheme solarized

    " JSX
    let g:jsx_ext_required = 0

    " CtrlP
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'

    " Nerdtree
    nnoremap <Bs> :<C-u>NERDTreeToggle<CR>
    let NERDTreeShowBookmarks=1
    let NERDTreeChDirMode=2
    let NERDTreeQuitOnOpen=1
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=0
    " Disable display of the 'Bookmarks' label and 'Press ? for help' text
    let NERDTreeMinimalUI=1
    " Use arrows instead of + ~ chars when displaying directories
    let NERDTreeDirArrows=1
    let NERDTreeBookmarksFile= $HOME . '/.vim/.NERDTreeBookmarks'
    nmap ,n :NERDTreeFind<CR>

" Шорткаты
    let mapleader = ","

    nmap ,f :NERDTreeFind<CR>
