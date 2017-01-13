set nocompatible              " be iMproved, required
filetype off                  " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Other Plugins
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ervandew/supertab'
Plugin 'honza/vim-snippets'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'majutsushi/tagbar'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'quramy/vison'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'shougo/unite.vim'
Plugin 'shougo/vimproc.vim'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-dotenv'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'vim-scripts/Gundo'
Plugin 'vim-scripts/L9'
Plugin 'vim-syntastic/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" BASIC goodness
syntax on
filetype plugin indent on
set number
set cursorline
set autoindent smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set textwidth=79
set colorcolumn=79
set spell spelllang=en_us
set foldmethod=marker
set t_Co=256
set term=xterm-256color

nmap <Left> <<
nmap <Right> >>
vmap <Left> <gv
vmap <Right> >gv
nmap <Up> [e
nmap <Down> ]e
vmap <Up> [egv
vmap <Down> ]egv

" Remap jk to <esc>, because who wants to move that far
inoremap jk <ESC>

" Enable mouse for selecting/changing windows etc.
set mouse=a

" Remap leader key
let mapleader = "\<Space>"

" Fix Spelling
nnoremap <leader>f 1z=

" Remove Mouse Scroll Wheel Click PASTE
noremap <MiddleMouse> <LeftMouse>

" Solarized color scheme
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized
call togglebg#map("<F6>")

" Nerdtree
map <silent> <F2> :NERDTreeToggle<CR>

" Status line of awesome
hi User1 ctermbg=237 ctermfg=248
hi User2 ctermbg=red   ctermfg=blue
hi User3 ctermbg=blue  ctermfg=green
set statusline=         " clear statusline for vim reload
set statusline+=%1*     " set color to User1
set statusline+=%f     " filename/path
set statusline+=\ %#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%1*     " set color to User1
set statusline+=%y    " filetype
set statusline+=\[%{FileSize()}]
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] " file format
set statusline+=%h      " help file flag
set statusline+=%m      " modified flag
set statusline+=%r      " read only flag
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''} " Git Branch (if fugitive loaded)
set statusline+=[Modified:%{strftime(\"\%c\",getftime(expand(\"\%\%\")))}]  " Last Modified
set statusline+=%=      " left/right seperator
set statusline+=[%c,    " cursor column
set statusline+=%l/%L   " cursor line/total lines
set statusline+=\ %P]   " percent through file"
function! FileSize()
  let bytes = getfsize(expand("%:p"))
  if bytes <= 0
    return ""
  endif
  if bytes < 1024
    return bytes
  else
    return (bytes / 1024) . "K"
  endif
endfunction

" Airline
set laststatus=2
let g:airline_powerline_fonts = 1

" Rainbow Parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

" Tagbar
nnoremap <silent> <F9> :TagbarToggle<CR>

" Omni Complete
set omnifunc=syntaxcomplete#Complete

" Persistent Undo
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

" Gundo
nnoremap <silent> <F5> :GundoToggle<CR>

" Vim-Indent-Lines
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=236
hi IndentGuidesEven ctermbg=233

" Vison JSON
autocmd BufRead,BufNewFile package.json Vison
autocmd BufRead,BufNewFile .bowerrc Vison bowerrc.json

" Highlight Extra Whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
