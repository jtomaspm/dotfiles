syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set mouse=a

" find
set path+=**
set wildmenu
set nocompatible

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

filetype plugin on


call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'kien/ctrlp.vim'
Plug 'mbbill/undotree'
Plug 'Valloric/YouCompleteMe'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'ap/vim-css-color'

call plug#end()


" colorscheme nord
" set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:newtrw_winsize = 25

let g:ctrlp_use_caching = 0

let g:airline#extensions#tabline#enabled = 1

" copy paste clipboard
vnoremap <C-c> "+y
map <C-v> "+p

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>e :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

" find
nnoremap <Leader>f :find<SPACE>


" YouCompleteMe
nnoremap <silent> <Leader>d :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>w :YcmCompleter FixIt<CR>

