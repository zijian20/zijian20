set nocompatible

set history=500

set ruler
set number

set backspace=eol,start,indent
set whichwrap+=<,>,h,l,[,]

set list
set listchars+=lead:.,trail:.

set lazyredraw

"set magic

set showmatch

set mouse=a

set encoding=utf8

set fileformats=unix,dos,mac

set expandtab
set shiftwidth=4
set tabstop=4

set autoindent
set smartindent 
set wrap

set laststatus=2

set tabpagemax=1000

set splitright
set splitbelow

set secure

"augroup remember_folds
"    autocmd!
"    autocmd BufWinLeave * mkview
"    autocmd BufWinEnter * silent! loadview
"augroup END

function FoldLine()
    let line = getline(v:foldstart)
    let lcount = v:foldend - v:foldstart
    let lines = " lines"
    if lcount == 1
        let lines = " line"
    endif
    return join(["+" .. substitute(v:folddashes, "^-", "", "") .. repeat(" ", indent(v:foldstart) - len(v:folddashes)), trim(line), " \t(", lcount, lines, ": ", v:foldstart, "-", v:foldend,")"], "")
endfunction

set foldmethod=indent
set foldcolumn=0
set foldtext=FoldLine()
set fillchars=fold:\ 

autocmd FileType make setlocal noexpandtab
"autocmd FileType python setlocal noexpandtab
"autocmd FileType text setlocal cc=81
autocmd BufNewFile,BufRead,BufReadPost *.ms set syntax=groff

" color settings
set colorcolumn=80

"set t_Co=256
set termguicolors
colorscheme retrobox
"colorscheme habamax
set background=dark

highlight! default link ColorColumn CursorColumn
highlight! default link FoldColumn LineNr
"highlight! default link Folded Question
highlight Folded ctermfg=109 cterm=bold guifg=#83a598 gui=bold guibg=none ctermbg=none
highlight Normal guibg=none ctermbg=none

"nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

filetype on
filetype indent on
filetype plugin on
syntax enable
