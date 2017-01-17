set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Airline
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'

" Code management
Plugin 'tpope/vim-commentary' " comment/uncomment lines with gcc or gc in visual mode
Plugin 'scrooloose/nerdcommenter'
Plugin 'tomtom/tcomment_vim' "provides easy to use, file-type sensible comments for Vim
Plugin 'ervandew/supertab' "use <Tab> for all your insert completion needs (:help ins-completion).
Plugin 'scrooloose/syntastic' "syntax checking plugin for Vim.
Plugin 'Chiel92/vim-autoformat' "formats code with one button
Plugin 'skwp/greplace.vim' " search and replace across many files
"Plugin 'w0rp/ale' " Hope for better than syntastic

" File Management
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree' " file drawer, open with :NERDTreeToggle

" Git
Plugin 'tpope/vim-fugitive' " the ultimate git helper
Plugin 'airblade/vim-gitgutter' " shows a git diff in the gutter

" Markdown
Plugin 'godlygeek/tabular'

" Misc
Plugin 'tpope/vim-surround' " surround text with things
Plugin 'sjl/gundo.vim' " Visualize your Vim undo tree.
Plugin 'tpope/vim-repeat' " Allows '.' repeats of plugin maps/commands

" Syntax highlighting.
Plugin 'evidens/vim-twig' " Twig syntax hightlighting.
Plugin 'elzr/vim-json' " JSON code highlighting.
Plugin 'terryma/vim-multiple-cursors' " Multiple cursors for simultaneous editing

" Movement
Plugin 'justinmk/vim-sneak'
Plugin 'terryma/vim-smooth-scroll' " Smooth scrolling with <c - f> & <c - b>

" tmux
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tmux-plugins/vim-tmux'

" Python
Plugin 'klen/python-mode'

" All of your Plugins must be added before the following line 
call vundle#end()            " required
filetype plugin indent on    " required

let mapleader=' '


" To move to a misspelled word, use ]s and [s. The ]s command will move the
" cursor to the next misspelled word, the [s command will move the cursor back
" through the buffer to previous misspelled words.
" Once the cursor is on the word, use z=, and Vim will suggest a list of
" alternatives that it thinks may be correct.
"set spell spelllang=en_us

"set clipboard=unnamed


" .vimrc
" See: http://vimdoc.sourceforge.net/htmldoc/options.html for details

" For multi-byte character support (CJK support, for example):
"set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1
       
set autoindent      " Copy indent from current line when starting a new line
                    " (typing <CR> in Insert mode or when using the "o" or "O"
                    " command).
 
set background=dark " When set to "dark", Vim will try to use colors that look
                    " good on a dark background. When set to "light", Vim will
                    " try to use colors that look good on a light background.
                    " Any other value is illegal.
 
set backspace=2     " Influences the working of <BS>, <Del>, CTRL-W
                    " and CTRL-U in Insert mode. This is a list of items,
                    " separated by commas. Each item allows a way to backspace
                    " over something.
 
set cursorline

" set cursorline colors
highlight cursorline term=bold cterm=NONE ctermbg=237 ctermfg=none

" Set color of number column on cursorline
highlight cursorlinenr ctermbg=235 ctermfg=red

" Highlights the current line number.
highlight linenr term=bold cterm=none ctermfg=darkgrey ctermbg=none gui=none guifg=darkgrey

set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
                    " Spaces are used in indents with the '>' and '<' commands
                    " and when 'autoindent' is on. To insert a real tab when
                    " 'expandtab' is on, use CTRL-V <Tab>.
 
set formatoptions=c,q,r " This is a sequence of letters which describes how
                    " automatic formatting is to be done.
                    "
                    " letter    meaning when present in 'formatoptions'
                    " ------    ---------------------------------------
                    " c         Auto-wrap comments using textwidth, inserting
                    "           the current comment leader automatically.
                    " q         Allow formatting of comments with "gq".
                    " r         Automatically insert the current comment leader
                    "           after hitting <Enter> in Insert mode. 
                    " t         Auto-wrap text using textwidth (does not apply
                    "           to comments)
                    " n         recognize numbered lists
 
"set hlsearch        " When there is a previous search pattern, highlight all
                    " its matches.
 
set incsearch       " While typing a search command, show immediately where the
                    " so far typed pattern matches.
 
set ignorecase      " Ignore case in search patterns.
 
set mouse=a         " Enable the use of the mouse.

set number          " values above and below respectively

set tabstop=4       " Number of spaces that a <Tab> in the file counts for.
 
set textwidth=79    " Maximum width of text that is being inserted. A longer
                    " line will be broken after white space to get this width.
 
set relativenumber  " Shows current line as well as ascending and descending 

set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.
 
set showcmd         " Show (partial) command in status line.

set showmatch       " When a bracket is inserted, briefly jump to the matching
                    " one. The jump is only done if the match can be seen on the
                    " screen. The time to show the match can be set with
                    " 'matchtime'.
 
set smartcase       " Override the 'ignorecase' option if the search pattern
                    " contains upper case characters.
 
set smarttab        " When on, a <Tab> in front of a line inserts blanks
                    " according to 'shiftwidth'. 'tabstop' is used in other
                    " places. A <BS> will delete a 'shiftwidth' worth of space
                    " at the start of the line.
 
set ruler           " Show the line and column number of the cursor position,
                    " separated by a comma.
 

set wildmenu

set wildmode=list:longest 


" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.

"------------------------------------------------------------
" Features 
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

syntax on           " Enable syntax highlighting

"set visualbell      " Use visual bell instead of beeping when doing something wrong

"set cmdheight=2     " Set the command window height to 2 lines, to avoid many
" cases of having to press <Enter> to continue"

set matchtime=5     " how many tenths of a second to blink matching brackets for

set laststatus=2    "To display the status line always

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Sets how many lines of history VIM has to remember
set history=100  " default 20

" For regular expressions turn magic on
set magic   " Magic on should be default but to make sure

" When you use :set list it will show tabs and everything but spaces as
" something
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

set timeoutlen=500
"set ttimeoutlen=0

imap jk <ESC>

" Window moving
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>

nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" Substitute command in "very magic" mode by adding \v aka grep extended
nnoremap / /\v
vnoremap / /\v
cnoremap %s/ %smagic/\v

" Substitute command colon separated shortcut
noremap <Leader>; :s:\v::g<Left><Left><Left>
noremap <Leader>' :%s:\v::g<Left><Left><Left>

" Edit and source vimrc file
nnoremap <Leader>ev :vs $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

" Comment lines or paragraph with //
" nnoremap <Leader>cl mzI//<esc>'z
" nnoremap <Leader>cp mzVip:s/^\s*\zs\ze/\/\//<cr><esc>'z

" nnoremap <Leader>ul mzV:s/\%V\(\s*\)\/\//\1<cr>'z
" nnoremap <Leader>up mzVip:s/\%V\(\s*\)\/\//\1<cr>'z

" vnoremap <Leader>cl mz:s/^\s*\zs\ze/\/\/<cr>'z
" vnoremap <Leader>ul mzV:s/\%V\(\s*\)\/\//\1<cr>'z

" Insert php var_dump() and die() for debugging
noremap <Leader>d ovar_dump();die('here');k0f(a

" Add getter and setters for properties
nnoremap <f1> 0/private\<bar>protected\<bar>publicww"zywjmqGo?}dGopublic function set "zpbhx~A($"zpA){	$this->"zpA = $"zpA;return $this;}<<oo	public function get "zpbhx~A(){	return $this->"zpA;}}V(((((='q

" Add getter and setters for properties
nnoremap <f2> 0/string\<bar>int\<bar>long\<bar>double\<bar>float\<bar>char\<bar>boolw"zywjmqGo?}dGostring set "zpbhx~A($"zpA){ $this->"zpA = $"zpA;return $this;}<<oo string get "zpbhx~A(){ return $this->"zpA;}}V(((((='q

" Testing for Class creation
" nnoremap <f3> 0/class (\w+) \{j/protected\<bar>private

"""""""""""""""""""""""""""""""""""""""
" Nerdtree
"""""""""""""""""""""""""""""""""""""""

" Show hidden files by default in NERDTree
let NERDTreeShowHidden=1

" map leader+d to toggle nerdtree
map <leader>j :NERDTreeToggle<cr>

" show current file in nerdtree
map <leader>f :NERDTreeFind<cr>

" Set NerdTree Window size
let NERDTreeWinSize = 40

"https://github.com/scrooloose/nerdtree/issues/162#issuecomment-107643011
nmap <silent> <Leader>t :call g:WorkaroundNERDTreeToggle()<CR>

function! g:WorkaroundNERDTreeToggle()
  try | NERDTreeToggle | catch | silent! NERDTree | endtry
endfunction

"-----------------END-----------------"

"""""""""""""""""""""""""""""""""""""""
" Airline
"""""""""""""""""""""""""""""""""""""""

" need it for airline symbols
set encoding=utf-8

" airline settings
let g:airline#extensions#syntastic#enabled=1
let g:airline_powerline_fonts=1
let g:airline_theme='distinguished'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = 'π'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'ξ'

"-----------------END-----------------"
"""""""""""""""""""""""""""""""""""""""
" Syntastic
"""""""""""""""""""""""""""""""""""""""
"let g:syntastic_javascript_checkers=['eslint']
let g:statline_syntastic = 0
"
"""""""""""""""""""""""""""""""""""""""
" Ale
"""""""""""""""""""""""""""""""""""""""
"let g:ale_filetype_blacklist = ['nerdtree', 'unite', 'COMMIT_EDITMSG']

"""""""""""""""""""""""""""""""""""""""
" Tmux
"""""""""""""""""""""""""""""""""""""""
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ' '}

"-----------------END-----------------"

" run php on current file
nnoremap <f3> :!php % <CR>

" Display statistics
nmap <Leader>g g<C-g>

" Paste from OS X PasteBoard, but I have it configured so it works very well in
" insert mode and in normal mode. The nopaste setting makes sure that
" auto-indent doesn't go crazy when you try to paste something in. 
"nmap <Leader>v :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
"imap <Leader>v <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>

" Copies text to OS X PasteBoard. If you are in normal mode, it will just grab
" the line your working on. If you in visual mode however, it will grab all the
" selected text. 
"nmap <Leader>c :.w !pbcopy<CR><CR>
"vmap <Leader>c :w !pbcopy<CR><CR>

" Saves File
nmap <Leader>s :w<CR>
nmap <Leader>sa :w %:h/

" Yank whole file to clipboard
nmap <Leader>a :%y*<CR>

" Paste from clipboard
nmap <Leader>v "*P
vmap <Leader>v "*P

" Copy to Clipboard
nmap <Leader>c "*y

" Paste from clipboard
nmap <Leader>v "*P
vmap <Leader>v "*P

" Copy to Clipboard
nmap <Leader>c "*Y
vmap <Leader>c "*y

" Line-break at Cursor
nnoremap K i<CR><Esc>

" Scrolling Gradually
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 15, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 15, 4)<CR>

"Globstar Setting
"set shell+=\ -O\ globstar
set shell=/usr/local/bin/bash\ -O\ globstar

" Vim-Sneak f override
nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S
xmap f <Plug>Sneak_s
xmap F <Plug>Sneak_S
omap f <Plug>Sneak_s
omap F <Plug>Sneak_S


" Sets New Windows to Right/Below
set splitright

nnoremap <Leader>wv :vnew<CR>
nnoremap <Leader>wn :new<CR>
