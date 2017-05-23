set nocompatible    " be iMproved, required
filetype off        " required

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Plugins
    " TODO: Less plug
    " TODO: Nerdcommenter
    " TODO: Supertab
    " Syntax
        Plug 'https://github.com/pangloss/vim-javascript'
        Plug 'https://github.com/mxw/vim-jsx'
        Plug 'https://github.com/wavded/vim-stylus'
        Plug 'https://github.com/ryym/vim-riot'

    " Other
        Plug 'git://github.com/altercation/vim-colors-solarized.git'
        Plug 'https://github.com/scrooloose/nerdtree'
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
        Plug 'junegunn/fzf.vim'

" Initialize plugin system
call plug#end()
filetype plugin indent on   " required

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

    " Minimal number of lines to scroll when cursor gets off the screen
    set scrolljump=5

    " Minimal number of lines to keep above and below the cursor
    " Typewriter mode = keep current line in the center
    " set scrolloff=999

    " Display invisible characters
    set list
    if version >= 700
        set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
    else
        set listchars=tab:»\ ,trail:·,extends:>,precedes:<,nbsp:_
    endif

    " Wrap long lines
    set wrap

    " Don't break words when wrapping
    " Only available when compiled with the +linebreak feature
    set linebreak

" Environment
    " Store lots of history entries: :cmdline and search patterns
    set history=1000

    " Backspacing settings
    " start     allow backspacing over the start of insert;
    "           CTRL-W and CTRL-U stop once at the start of insert.
    " indent    allow backspacing over autoindent
    " eol       allow backspacing over line breaks (join lines)
    set backspace=indent,eol,start

    " Backup и swp files
    " Don't create backups
    set nobackup
    " Don't create swap files
    set noswapfile

" Search
    " While typing a search command, show pattern matches as it is typed
    " Only available when compiled with the +extra_search feature
    set incsearch
    " When there is a previous search pattern, highlight all its matches
    " Only available when compiled with the +extra_search feature
    set hlsearch
    " Ignore case in search patterns
    set ignorecase
    " Override the 'ignorecase' if the search pattern contains upper case characters
    set smartcase
    " All matches in a line are substituted instead of one
    set gdefault

" Status line
    function! FileSize()
        let bytes = getfsize(expand("%:p"))
        if bytes <= 0
            return ""
        endif
        if bytes < 1024
            return bytes . "B"
        else
            return (bytes / 1024) . "K"
        endif
    endfunction

    function! CurDir()
        return expand('%:p:~')
    endfunction

    " Last window always has a status line
    set laststatus=2
    " Content of the status line
    " Only available when compiled with the +statusline feature
    set statusline=[
    " Buffer number
    set statusline+=%n] 
    " File name
    set statusline+=[%t]
    " Modified flag
    set statusline+=%m
    " set statusline+=\ \
    " Paste mode flag
    set statusline+=%{&paste?'[paste]':''}
    " File encoding
    set statusline+=[%{&fileencoding}]
    " Type of file
    " Only available when compiled with the +autocmd feature
    set statusline+=%y
    " Column number
    " set statusline+=\ %3.3(%c%)
    " Current line / number of lines in buffer
    set statusline+=[%3.9(%l/%L%)]
    " Percentage through file in lines
    " set statusline+=\ \ %2.3p%%
    " File size
    " set statusline+=\ \ %{FileSize()}
    " Truncate here if line is too long
    set statusline+=%<
    " Path to the file
    set statusline+=%=%{CurDir()}

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
        let g:NERDTreeWinSize = 50

    " Ack
        " Replace ack on the_silver_searcher
        let g:ackprg = 'ag --vimgrep'

    " FZF
        " Mapping selecting mappings
        nmap <leader><tab> <plug>(fzf-maps-n)
        xmap <leader><tab> <plug>(fzf-maps-x)
        omap <leader><tab> <plug>(fzf-maps-o)

        " Insert mode completion
        imap <c-x><c-k> <plug>(fzf-complete-word)
        imap <c-x><c-f> <plug>(fzf-complete-path)
        imap <c-x><c-j> <plug>(fzf-complete-file-ag)
        imap <c-x><c-l> <plug>(fzf-complete-line)

        " Ignoring certain patterns
        let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'

" Шорткаты
    let mapleader = ","

    " Find file in nerdtree
        nmap ,n :NERDTreeFind<CR>

    " ,bl
        " Show buffers
        nnoremap <Leader>bl :<C-u>ls<cr>:b

    " ,bp
        " Go to prev buffer
        nnoremap <Leader>bp :<C-u>bp<cr>

    " ,bn
        " Go to next buffer
        nnoremap <Leader>bn :<C-u>bn<cr>

    " ,bd
        " Remove buffer
        nnoremap <Leader>bd :<C-u>bd<cr>

    " <Esc><Esc>
        " Clear the search highlight in Normal mode
        nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

    " < >
        vnoremap < <gv
        vnoremap > >gv

    " n и N
        " Search matches are always in center
        nnoremap n nzz
        nnoremap N Nzz
        nnoremap * *zz
        nnoremap # #zz
        nnoremap g* g*zz
        nnoremap g# g#zz

    " ,ts
        " Fix trailing white space
        nnoremap <leader>ts :<C-u>%s/\s\+$//e<CR>

    " ,p
        " Toggle the 'paste' option
        set pastetoggle=<Leader>p

    " Ctrl T
        nnoremap <C-t> :<C-u>Files<cr>

    " Ctrl B
        nnoremap <C-b> :<C-u>Buffers<cr>

    " ,gst
        " Git status
        nnoremap <leader>gst :<C-u>GFiles?<cr>

    " ,w
        " Toggle wrap
        nnoremap <leader>w :setlocal wrap!<cr>

    " ,f
        nnoremap <leader>f :<C-u>execute "Ag " . expand("<cword>") <Bar> cw<CR>
