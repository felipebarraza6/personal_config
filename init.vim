set encoding=utf-8
set nocompatible            " disable compatibility to old-time vi
"set foldcolumn=1
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set number                     " Show current line number
set relativenumber             " Show relative line numbers
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set foldlevelstart=99
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

call plug#begin()
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'CopilotC-Nvim/CopilotChat.nvim', { 'branch': 'canary' }
    Plug 'sheerun/vim-polyglot'
    Plug 'xiyaowong/transparent.nvim'
    Plug 'tpope/vim-fugitive'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    Plug 'honza/vim-snippets'
    Plug 'zbirenbaum/copilot.lua'
    Plug 'scrooloose/nerdtree'
    Plug 'preservim/nerdcommenter'
    Plug 'vim-airline/vim-airline'
    Plug 'mhinz/vim-startify'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'ayaz-amin/cyberpunk.nvim' , {'branch' : 'main'}
call plug#end()

" Configuración de CoC.nvim para el autocompletado
set completeopt=menu,menuone,noselect

" Mapeo para activar/desactivar el autocompletado
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


" Abrir el archivo bajo el cursor en una ventana dividida verticalmente
nnoremap gf :vert winc f<CR>

" Copiar la ruta completa del archivo actual al portapapeles con yf
nnoremap <silent> yf :let @+=expand('%:p')<CR>

" Copiar la ruta del directorio del archivo actual al portapapeles con yd
nnoremap <silent> yd :let @+=expand('%:p:h')<CR>

" Saltar a la última posición del cursor al abrir un archivo
" Descomenta este bloque si lo necesitas
" if has("autocmd")
"   au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
"     \| exe "normal! g'\"" | endif
" endif
"
"
let g:copilot#enabled = 1

"set guifont=DroidSansMono_Nerd_Font:h11
let g:airline_powerline_fonts = 1
"let g:airline_theme='violet'

let g:webdevicons_enable_nerdtree = 1

let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

"set termguicolors
let g:airline_theme='cyberpunk'

let g:cyberpunk_cursorline="cyberpunk_cursorline"
autocmd vimenter * colorscheme cyberpunk

g:copilot_suggest


lua << EOF
require('CopilotChat').setup {
  debug = true, -- Habilitar depuración
  -- Ver la sección de Configuración para más opciones
}

EOF




