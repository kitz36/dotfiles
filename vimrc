" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.

"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Enable filetype detection.  Vim will attempt to distinguish the filetype
" when a new file is created or edited.  Vim will set the 'filetype' option
" and trigger a FileType event
filetype on

" EXPERIMENTAL
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
"filetype indent plugin on

" Enable syntax highlighting
syntax on
set background=dark

"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" EXPERMIMENTAL - disabled at work
" Better command-line completion
"set wildmenu

" EXPERIMENTAL - the following was taken from my work .vimrc
"set wildignore=*.o,*~,*.pyc

" EXPERIMENTAL
" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline
"
"------------------------------------------------------------
" CMP: Must have options {{{1
"
" These are highly recommended options.

" Move the cursor to the matched string while typing a search pattern.
" Complete the search by pressing Enter or cancel by pressing Esc.  When
" typing the search pattern, press Ctrl-L to insert the next character
" from the match or press Ctrl-R Ctrl-W to complete the current matching
" word.
set incsearch

" show matching brackets when cursor is over them
set showmatch
" set how many tenths of a second to blink when matching brackets
set matchtime=3

"------------------------------------------------------------
" CMP: Experimental options {{{1
"
" EXPERIMENTAL
" don't redraw the screen when a macro is running.  looks nicer but
" might make debug of macros more difficult
"set lazyredraw

" EXPERIMENTAL
" (don't) change how characters in a pattern are interpreted.
" Vim has four levels of character matching in petterns:
"    "very magic" (\v)   - all ASCII characters except '0'-'9', 'a'-'z',
"                          'A'-'Z', and '_' have a special meaning
"    "magic" (\m)        - default matching
"    "nomagic" (\M)      - most characters are treated as literal
"                          characters; escaping them gives them special
"                          meaning
"    "very nomagic" (\V) - only escaped characters have a special meaning.
" Examples:
" after:  \v     \m       \M      \V     matches 
"              'magic' 'nomagic'
"         $       $        $      \$     matches end-of-line
"         .       .        \.     \.     matches any character
"         *       *        \*     \*     any number of the previous atom
"         ()      \(\)     \(\)   \(\)   grouping into an atom
"         |       \|       \|     \|     separating alternatives
"         \a      \a       \a     \a     alphabetic character
"         \\      \\       \\     \\     literal backslash
"         \.      \.       .      .      literal dot
"         \{      {        {      {      literal '{'
"         a       a        a      a      literal 'a'
"set magic

" set the amount of time Vim waits, in milliseconds, for a mapping or
" key sequence to be received.  default is 1000
set timeoutlen=500

" EXPERIMENTAL
" Quickly time out on keycodes, but never time out on mappings
"set notimeout ttimeout ttimeoutlen=200

" set character encoding to UTF-8.  default is set by your locale or
" from $LANG, else default is 'latin1'
set encoding=utf8

" don't change the DOS/Unix file format (EOL's).  this option is set
" automatically when a buffer is loaded.  default is unix.
"set fileformat=unix

" automatically detect <EOL> as DOS, Unix, or Mac.  default to Unix
" Note that it does not affect new buffers
set fileformats=unix,dos,mac

" wrap lines to fit in the window
set wrap
" wrap long lines at characters in the 'breakat' variable
" (default " ^I!@*-*;:,./?")
set linebreak

" EXPERIMENTAL - enabled at work
" By default, when pressing the left/right arrow keys, Vim will NOT move to the
" previous/next line after reaching the first/last character.  This causes
" the left and right arrow keys, as well as h and l, to wrap when used at the
" beginning and end of lines.  Note that '<' and '>' are the cursor keys
" used in normal and visual mode, and '[' and ']' are the cursor keys in
" insert mode
set whichwrap+=<,>,h,l,[,]

" EXPERIMENTAL
" set the maximum width of inserted text to 500 lines
"set textwidth=500

"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Keep a minimum of 7 lines above and below to cursor.  This will make some
" context visible around where you are working.
set scrolloff=7

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
"set autoindent

" Apply smart auto-indenting when starting a new line.  Normally autoindent
" should also be on if this is enabled.  An indent is automatically inserted:
" - After a line ending in '{'
" - After a line starting with a keyword in 'cinwords'
" - Before a line starting with '}' (only with the "O" command).
" Note: works for C-like programs, but can also be used for other languages.
" 'cindent' does something like this, works better in most cases, but is more
" strict.
"set startindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" EXPERIMENTAL
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
"set confirm

" Use visual bell instead of beeping when doing something wrong
"set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
"set mouse=a

" EXPERIMENTAL - disabled at work
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
"set number

" EXPERIMENTAL
" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
"set shiftwidth=4
"set tabstop=4


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" map '0' to the first non-blank character
map 0 ^

" EXPERIMENTAL
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Map <Space> to / (search) and Ctrl-<space> to ? (backwards search)
"map <space> /
"map <c-space> ?

" Disable highlight when <leader><cr> is pressed
"map <silent> <leader><cr> :noh<cr>

" Simplify moving between windows
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l

" Simplify tab management
"map <leader>tn :tabnew<cr>
"map <leader>to :tabonly<cr>
"map <leader>tc :tabclose<cr>
"map <leader>tm :tabmove


"------------------------------------------------------------
"
" Colors

colorscheme desert
"colorscheme murphy


"------------------------------------------------------------
"
" GVim

if has("gui_running")
    " set a GVim-specific colorscheme
    colorscheme murphy
    " disable the toolbar
    set guioptions-=T
    " enable tab pages
    set guioptions+=e
    " use 256 colors
    set t_Co=256
    " set the tab label format to Modified (+) <space> filename (tail)
    set guitablabel=%M\ %t
    " set font
    set guifont=Monospace\ 8
endif



"------------------------------------------------------------
"
" New functionality

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

"------------------------------------------------------------
"
" Helper Functions
"
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
