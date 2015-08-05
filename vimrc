scriptencoding utf-8 
set encoding=utf-8

set backspace=2   " Backspace deletes like most programs in insert mode set
set nocompatible  " Use Vim settings, rather then Vi settings set nobackup 
set nowritebackup 
set noswapfile    
set history=50 
set ruler         " show the cursor position all the time 
set showcmd       " display incomplete commands
set incsearch     " do incremental searching 
set laststatus=2  " Always display the status line 
set autowrite     " Automatically :write before running commands

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

execute pathogen#infect()

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.handlebars set filetype=html

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Generate tags
  autocmd BufWritePost *.c,*.cpp,*.h,*.php silent! !ctags &
  autocmd BufWritePost *.py silent! !ptags.py &
augroup END

" Pythonic
set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Color scheme
syntax enable
colorscheme solarized
if has('gui_running')
    set background=light
else
    let g:solarized_termcolors=256
    set background=dark
endif

" Numbers
set number
set numberwidth=5

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" ahhh, ESC relief
inoremap jk <ESC>

" special quotes
inoremap '' ’
inoremap "" ”

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Tab movement
nnoremap <C-h> :tabp<CR>
nnoremap <C-l> :tabn<CR>

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1

" pymode
let g:pymode_folding = 0

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1 
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1 
let g:syntastic_check_on_wq = 0 
let g:syntastic_javascript_checkers = ['jshint']
