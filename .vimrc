set nocompatible              " be iMproved, required
filetype off                  " required

if !exists("g:syntax_on")
   syntax enable
endif
" Keep track of my undo/redo history
set undofile
" And store it in ~/.vim/undodir. Without this, the file is stored in the
" directory of the file you are editing
set undodir=~/.vim/undodir
set title
set smartindent
set expandtab
set shiftwidth=3
set softtabstop=3
set splitright
set splitbelow
set backspace=indent,eol,start  " Makes backspace key more powerful.
set ruler
set et
set tabstop=3
set shiftwidth=3
set scrolloff=3
set updatetime=250
set number
" highlight column
"set cursorcolumn
" highlight row
"set cursorline

" python indent
autocmd BufNewFile,BufRead *.py setlocal tabstop=3 softtabstop=3 shiftwidth=3 textwidth=80 smarttab expandtab

" Display M$ Word docs
autocmd BufReadPost *.doc,*.docx,*.rtf,*.odp,*.odt silent %!pandoc "%" -tplain -o /dev/stdout

" In many terminal emulators the mouse works just fine, thus enable it.
" if has('mouse')
"    set mouse=a
" endif

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" MAKE WHITESPACE VISIBLE (https://kinbiko.com/vim/my-shiniest-vim-gems/)
" Show invisible characters using set listchars=tab:>-,trail:· This means that tabs should be shown as > followed by a stream of - characters. The number of - characters depends on how many spaces a tab should be as defined by your tabstop setting. Any trailing whitespace shows up as an interpunct (·). To get this working you’ll need to follow the above config with set list. Pretty rock ‘n roll.
" set listchars=tab:>-,trail:·
" set list
"

" Move visual selection 
vnoremap J :m '>+1<cr>gv=gv 
vnoremap K :m '<-2<cr>gv=gv

colorscheme wombat256grf

" Vundle shit
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-sensible'
Plugin 'Yggdroot/indentLine'
Plugin 'ojroques/vim-scrollstatus'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'dense-analysis/ale'

call vundle#end()            " required
filetype plugin indent on    " required

let NERDTreeIgnore=['\.pyc', '\.o', '\.class', '\.lo',"elm-stuff","elm.js"]
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>

let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"let g:indentLine_char = 'c'

let g:airline_section_x = '%{ScrollStatus()}'
"let g:scrollstatus_size = 12
"let g:scrollstatus_symbol_track = '-'
"let g:scrollstatus_symbol_bar = '|'

" ALE
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
