"Load Pathogen and all bundles
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

"BASIC goodness
syntax on
filetype plugin indent on
set number
set cursorline
set autoindent smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
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

"Remap jk to <esc>
inoremap jk <ESC>

"Enable mouse for selecting/changing windows etc.
set mouse=a

"Remap leader key
let mapleader = "\<Space>"

"Fix Spelling
nnoremap <leader>f 1z=

"Remove Mouse Scroll Wheel Click PASTE
noremap <MiddleMouse> <LeftMouse>

"FuzzyFinder
map <silent> <C-t> :FufCoverageFile<CR>
let g:fuf_file_exclude='\v\~$|\.(o|exe|dll|bak|orig|sw[po])$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'

"Highlight end of line whitespace.
"set list
set listchars=trail:.

"Syntastic syntax error checking options
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0
let g:syntastic_auto_loc_list=1
let g:syntastic_jsl_conf="~/.vim/config/jsl.conf"
let g:syntastic_html_tidy_ignore_errors = [
    \ ' proprietary attribute ' ,
    \ 'trimming empty <',
    \ 'unescaped &' ,
    \ 'is not recognized!',
    \ 'discarding unexpected'
    \ ]

"Solarized color scheme
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized
call togglebg#map("<F6>")

"javascript libraries
let g:used_javascript_libs = 'jquery,angularjs,requirejs,underscore,jasmine,angularui,flux,react'

"rainbow parentheses
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

"Persistanb undo
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

"Custom indent-guides config
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=236
hi IndentGuidesEven ctermbg=233

" Omni Complete
set omnifunc=syntaxcomplete#Complete

"Gundo
nnoremap <silent> <F5> :GundoToggle<CR>

"Nerdtree
map <silent> <F2> :NERDTreeToggle<CR>

"Tagbar
nnoremap <silent> <F9> :TagbarToggle<CR>

"Status line of awesome
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

"Vim Snippets
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,ruby-rails,ruby-1.9'
let g:snipMate.scope_aliases['javascript'] = 'javascript, javascript.d3, javascript_jquery, javascript-jquery'
let g:snipMate.scope_aliases['vim'] = 'vim'
let g:snipMate.scope_aliases['sh'] = 'sh'
let g:snipMate.scope_aliases['css'] = 'css'
let g:syntastic_disabled_filetypes=['html']

autocmd BufRead,BufNewFile *.es6 setfiletype javascript

"Airline
set laststatus=2
let g:airline_powerline_fonts = 1
