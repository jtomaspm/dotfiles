syntax on
set encoding=utf-8
set noerrorbells
set expandtab
set shiftwidth=4
set tabstop=4
set smartindent
set nu
set wrap
set linebreak
set nolist
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set mouse=a
set clipboard=unnamedplus
set hidden
set path+=**
set wildmenu
set nocompatible
set cursorline
filetype plugin indent on
filetype plugin on

call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'ap/vim-css-color'
Plug 'rakr/vim-one'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'terryma/vim-expand-region'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

call plug#end()


" --- theme ---
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
let g:one_allow_italics = 1 " I love italic for comments
let g:airline_theme='one'
colorscheme one
set background=dark " for the dark version

" trasparent background
"hi Normal guibg=NONE ctermbg=NONE


let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:newtrw_winsize = 25

let g:ctrlp_use_caching = 0

let g:airline#extensions#tabline#enabled = 1

" expand selection
map E <Plug>(expand_region_expand)
map S <Plug>(expand_region_shrink)

" copy paste clipboard
map <F11> "+y
nnoremap <F12> "+p


" open on dir
nnoremap <leader>m :e ~/.config/<CR>
nnoremap <leader>n :e ~/Documents/UA/<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>e <bar> :NERDTreeFind <bar> :vertical resize 30<CR>
nnoremap <silent> <Leader>+ :vertical resize +10<CR>
nnoremap <silent> <Leader>- :vertical resize -10<CR>

" CoC
source ~/.config/nvim/plug-conf/coc.vim
autocmd FileType python let b:coc_root_patterns = ['.git', '.env']


" find
"nnoremap <Leader>f :find<SPACE>
nnoremap <Leader>vc :e ~/.config/nvim/init.vim<CR>

" TELESCOPE
" #####################################################
lua require('telescope').load_extension('fzy_native')

" find
" Using Lua functions
" nnoremap <leader>f :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
" current dir
nnoremap <F1> <cmd>lua require('telescope.builtin').find_files( { cwd = vim.fn.expand('%:p:h') })<cr>
" UA
nnoremap <F2> <cmd>lua require('telescope.builtin').find_files( { cwd = "~/Documents/UA/" .. vim.fn.input("Search Dir on UA > ")})<cr>
" config
nnoremap <F3> <cmd>lua require('telescope.builtin').find_files( { cwd = "~/.config/" .. vim.fn.input("Search Dir on .config > ")})<cr>
" home
nnoremap <F4> <cmd>lua require('telescope.builtin').find_files( { cwd = "~/" .. vim.fn.input("Search Dir on ~ > ")})<cr>

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').lsp_references()<cr>


" toggle search highligths
nnoremap <F7> :set hlsearch!<CR>


" tree sitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { },  -- list of language that will be disabled
    additional_vim_regex_highlighting = false,
  },
}
EOF


" gui font (for neovide)
set guifont=Monaco:h8
