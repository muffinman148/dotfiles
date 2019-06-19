""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Marc's vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin()

" Airline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

" Temp fix for Powerline DeprecationWarning for imp module
" More info here: https://github.com/powerline/powerline/issues/1925
if has('python3')
      silent! python3 1
endif
" Powerline
" Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

" Code management
Plug 'tpope/vim-commentary'     " comment/uncomment lines with gcc or gc in visual mode
Plug 'scrooloose/nerdcommenter'
Plug 'tomtom/tcomment_vim'      " provides easy to use, file-type sensible comments for Vim
Plug 'ervandew/supertab'        " use <Tab> for all your insert completion needs (:help ins-completion).
Plug 'scrooloose/syntastic'     " syntax checking plugin for Vim.
Plug 'Chiel92/vim-autoformat'   " formats code with one button
Plug 'skwp/greplace.vim'        " search and replace across many files
Plug 'mhinz/vim-signify'        " SVN/Git Gutter

" File Management
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree' " file drawer, open with :NERDTreeToggle

" Git
Plug 'tpope/vim-fugitive'     " the ultimate git helper
" Plug 'airblade/vim-gitgutter' " shows a git diff in the gutter

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/goyo.vim'       " Distraction free writing
Plug 'junegunn/limelight.vim'  " Highlighting for md sections
Plug 'amix/vim-zenroom2'       " Padding for focused read/write

" Notetaking
Plug 'jceb/vim-orgmode'

" OrgMode Recommended Plugins
Plug 'tpope/vim-speeddating'       " C-x and C-a now work on Dates
Plug 'vim-scripts/SyntaxRange'     " :[range]SyntaxIgnore :[range]SyntaxInclude | Changes Syntax of selected area
Plug 'itchyny/calendar.vim'        " :Calendar -view=year -split=vertical -width=27
Plug 'chrisbra/NrrwRgn'            " :NR to create temp buffer of selected item
Plug 'majutsushi/tagbar'           " <f8> :TagbarToggle
Plug 'vim-scripts/taglist.vim'     " :h :TlistToggle
Plug 'vim-scripts/utl.vim'         " Allows for Universal Text Linking

" Misc
Plug 'tpope/vim-surround'       " surround text with things
Plug 'sjl/gundo.vim'            " Visualize your Vim undo tree.
Plug 'tpope/vim-repeat'         " Allows '.' repeats of plugin maps/commands
Plug 'chrisbra/vim-autoread/'   " Allows vim to auto update a buffer
Plug 'skywind3000/asyncrun.vim' 

" Syntax highlighting.
Plug 'lumiliet/vim-twig'            " Twig syntax highlighting.
Plug 'elzr/vim-json'                " JSON code highlighting.
Plug 'terryma/vim-multiple-cursors' " Multiple cursors for simultaneous editing

" Movement
Plug 'justinmk/vim-sneak'
Plug 'terryma/vim-smooth-scroll' " Smooth scrolling with <c - f> & <c - b>

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'

" Python
" Plug 'klen/python-mode'

" All of your Plugins must be added before the following line 
call plug#end()

let mapleader=' '
let maplocalleader=','


" To move to a misspelled word, use ]s and [s. The ]s command will move the
" cursor to the next misspelled word, the [s command will move the cursor back
" through the buffer to previous misspelled words.
" Once the cursor is on the word, use z=, and Vim will suggest a list of
" alternatives that it thinks may be correct.

" Toggles Set Spell
map <F5> :setlocal spell! spelllang=en_us<CR>
hi SpellBad ctermfg=white ctermbg=red
hi SpellCap ctermfg=black ctermbg=blue
hi SpellLocal ctermfg=white ctermbg=green
hi SpellRare ctermfg=white ctermbg=magenta

" Creates Spell File on Load
for d in glob('~/.vim/spell/*.add', 1, 1)
    if filereadable(d) && (!filereadable(d . '.spl') || getftime(d) > getftime(d . '.spl'))
        silent exec 'mkspell! ' . fnameescape(d)
    endif
endfor

" Sets Spell File
set spellfile=~/.vim/spell/en.utf-8.add

" Spell Checks within Comments
syntax enable
syntax spell toplevel

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
 
set formatoptions=cqrjn " This is a sequence of letters which describes how
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
 
set hlsearch        " When there is a previous search pattern, highlight all
                    " its matches.
 
set incsearch       " While typing a search command, show immediately where the
                    " so far typed pattern matches.
 
set ignorecase      " Ignore case in search patterns.
 
set mouse=a         " Enable the use of the mouse.

set number          " values above and below respectively

set tabstop=4       " Number of spaces that a <Tab> in the file counts for.
 
set textwidth=79    " Maximum width of text that is being inserted. A longer
                    " line will be broken after white space to get this width.
autocmd BufNew,BufRead *.org set textwidth=0
 
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

" Hit '%' on 'if' to jump to 'else'
runtime macros/matchit.vim

inoremap jk <ESC>`^

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
" For help on \v run ':h magic'

" Substitute command colon separated shortcut
noremap <Leader>; :s:\v::g<Left><Left><Left>
noremap <Leader>' :%s:\v::g<Left><Left><Left>

" Deletes Whitespace
noremap <Leader>dws :%s:\v^\s*$\n::g<CR> 

" Edit and source vimrc file
nnoremap <Leader>ev :vs $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

" Source File
nnoremap <Leader>sf :edit %<CR>

" Insert php var_dump() and die() for debugging
noremap <Leader>d ovar_dump();die('here');k0f(a

" Add getter and setters for properties
nnoremap <f1> 0/private\<bar>protected\<bar>publicww"zywjmqGo?}dGopublic function set "zpbhx~A($"zpA){	$this->"zpA = $"zpA;return $this;}<<oo	public function get "zpbhx~A(){	return $this->"zpA;}}V(((((='q

" Show Buffers
nnoremap <leader>b :ls<CR>:buffer<space>

" Show Marks
nnoremap <leader>m :marks<CR>

" Add getter and setters for properties
" nnoremap <f2> 0/string\<bar>int\<bar>long\<bar>double\<bar>float\<bar>char\<bar>boolw"zywjmqGo?}dGostring set "zpbhx~A($"zpA){ $this->"zpA = $"zpA;return $this;}<<oo string get "zpbhx~A(){ return $this->"zpA;}}V(((((='q

" Testing for Class creation
" nnoremap <f3> 0/class (\w+) \{j/protected\<bar>private

" Toggles Line Number
" map <F4> :set nu! relativenumber!<CR> :GitGutterToggle<CR>

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

"""""""""""""""""""""""""""""""""""""""
" Python Mode
"""""""""""""""""""""""""""""""""""""""
" let g:pymode_options_colorcolumn = 1

"""""""""""""""""""""""""""""""""""""""
" Powerline
"""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
" Airline
"""""""""""""""""""""""""""""""""""""""

" need it for airline symbols
set encoding=utf-8

" airline settings
let g:airline_powerline_fonts = 1
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
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = 'PASTE'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_detect_spelllang=0

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"""""""""""""""""""""""""""""""""""""""
" Syntastic
"""""""""""""""""""""""""""""""""""""""
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'
let g:statline_syntastic = 0

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticToggleMode<CR> 

"""""""""""""""""""""""""""""""""""""""
" NERDCommenter
"""""""""""""""""""""""""""""""""""""""
let g:NERDSpaceDelims = 1

"""""""""""""""""""""""""""""""""""""""
" gitgutter
"""""""""""""""""""""""""""""""""""""""
" nmap ]h <Plug>GitGutterNextHunk
" nmap [h <Plug>GitGutterPrevHunk

"""""""""""""""""""""""""""""""""""""""
" .------..------..------.            "
" |O.--. ||R.--. ||G.--. | Vim-Orgmode"
" | :/\: || :(): || :/\: | Recommended"
" | :\/: || ()() || :\/: | Plugins    "
" | '--'O|| '--'R|| '--'G|            "
" `------'`------'`------'            "
"""""""""""""""""""""""""""""""""""""""
" Tagbar
"""""""""""""""""""""""""""""""""""""""
nmap <f8> :TagbarToggle<CR>
"""""""""""""""""""""""""""""""""""""""
" Utl
"""""""""""""""""""""""""""""""""""""""
" Note: This only works with our osascript running from ~
" let g:utl_cfg_hdl_scm_http_system = \" silent !firefox -remote 'ping()' && firefox -remote 'openURL( %u )' || firefox '%u#%f' &"
let g:utl_cfg_hdl_scm_http_system = "!~/bin/firefox-tab.sh '%u'"

"-----------------END-----------------"

" run php on current file
" nnoremap <f3> :!php % <CR>

" Gundo Tree
nmap <Leader>g :GundoToggle<CR>

" Display statistics
nmap <Leader>ds g<C-g>

" Saves File
nmap <Leader>s :w<CR>
nmap <Leader>sa :w %:h/

" Yank whole file to clipboard
nmap <Leader>a :%y*<CR>

" Paste from clipboard
nmap <Leader>v "*P
vmap <Leader>v "*P

" Copy to Clipboard
nmap <Leader>c "*Y
vmap <Leader>c "*y

" Toggles Paste Mode
set pastetoggle=<f3>

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

" Search Highlighting Toggle
let hlstate=0
nnoremap <Leader>l :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>

" Force Save/Write a file as root
cmap w!! w !sudo tee % > /dev/null

"""""""""""""""""""""""""""""""""""""""
" Goyo
"""""""""""""""""""""""""""""""""""""""
function! s:goyo_enter()
    highlight StatusLineNC ctermfg=none 
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
    set noshowmode
    set noshowcmd
    set scrolloff=999
    highlight clear cursorline
    Limelight
    " ...
endfunction

function! s:goyo_leave()
    " Resets these to my defaults
    highlight cursorline term=bold cterm=NONE ctermbg=237 ctermfg=none
    highlight cursorlinenr ctermbg=235 ctermfg=red
    highlight linenr term=bold cterm=none ctermfg=darkgrey ctermbg=none gui=none guifg=darkgrey
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
    set showmode
    set showcmd
    set scrolloff=5
    Limelight!
    " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

nnoremap <silent> <leader>z :Goyo<cr>

"""""""""""""""""""""""""""""""""""""""
" Limelight
"""""""""""""""""""""""""""""""""""""""

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

"""""""""""""""""""""""""""""""""""""""
" CTRLP
"""""""""""""""""""""""""""""""""""""""
let g:ctrlp_max_files=0

"""""""""""""""""""""""""""""""""""""""
" vim-signify
"""""""""""""""""""""""""""""""""""""""
let g:signify_vcs_list = [ 'git', 'svn' ]
 nmap <leader>gj <plug>(signify-next-hunk)
 nmap <leader>gk <plug>(signify-prev-hunk)

"""""""""""""""""""""""""""""""""""""""
" Grep Changes
"""""""""""""""""""""""""""""""""""""""
set grepformat=%f:%l:%c:%m
if executable('rg') " ripgrep
    set grepprg=rg\ --vimgrep\ $*
elseif executable('ag') " silver searcher
    set grepprg=ag\ --vimgrep\ $*
endif

"""""""""""""""""""""""""""""""""""""""
" Tmux Changes
"""""""""""""""""""""""""""""""""""""""
set mouse+=a
if &term =~ '^screen'
" tmux knows the extended mouse mode
    set ttymouse=xterm2
endif
