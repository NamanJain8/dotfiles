" VIM Config file | Naman Jain

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/nerdtree/plugin/NERD_tree.vim
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" For search across filesystem
Plugin 'mileszs/ack.vim'

" Plugin for git
Plugin 'tpope/vim-fugitive'
Plugin 'machakann/vim-highlightedyank'
Plugin 'tpope/vim-commentary'
Plugin 'ervandew/supertab'
Plugin 'wakatime/vim-wakatime'
Plugin 'tpope/vim-rhubarb'
Plugin 'unblevable/quick-scope'

" Color Scheme
Plugin 'altercation/vim-colors-solarized'

Plugin 'bronson/vim-trailing-whitespace'
Plugin 'tpope/vim-surround'

Plugin 'preservim/nerdtree'
Plugin 'preservim/nerdcommenter'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin for go
Plugin 'fatih/vim-go'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'

Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

" All of your Plugins must be added before the following line
call vundle#end()           " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line

" -- Display
set title                 " Update the title of your window or your terminal
set number                " Display line numbers
set ruler                 " Display cursor position
set wrap                  " Wrap lines when they are too long

set scrolloff=3           " Display at least 3 lines around you cursor
                          " (for scrolling)

set guioptions=T          " Enable the toolbar

" -- Search
set ignorecase            " Ignore case when searching
set smartcase             " If there is an uppercase in your search term
                          " search case sensitive again
set incsearch             " Highlight search results when typing
set hlsearch              " Highlight search results

" -- Beep
set visualbell            " Prevent Vim from beeping
set noerrorbells          " Prevent Vim from beeping

" Backspace behaves as expected
set backspace=indent,eol,start

set tabstop=4
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" Hide buffer (file) instead of abandoning when switching
" to another buffer
set hidden

" Enable syntax highlighting
syntax enable
hi CursorLineNR guifg=#ffffff " highlights current line

autocmd BufNewFile,BufRead *.go setlocal autoindent noexpandtab tabstop=4 shiftwidth=4
" Enable file specific behavior like syntax highlighting and indentation
filetype on
filetype plugin on
filetype indent on

" Use the dark version of Solarised
set background=dark
colorscheme solarized

noremap " " <nop>
let mapleader=" "

" Use DejaVu Sans font
set guifont=Deja\ Sans\ Mono\ 10
set antialias

" Activate the NERDTree when launching vim
" autocmd vimenter * NERDTree

" Disabling the directional keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Move to begin/end of line
nnoremap B ^
nnoremap E $

let mapleader=" "

" Ack config
" Default params for ack
let g:ackprg="ack -H --nocolor --nogroup --column"
" Add a mark and search
nmap <leader>j mA:Ack<space>
" Add a mark and search for the word under the cursor
nmap <leader>ja mA:Ack "<C-r>=expand("<cword>")<cr>"
nmap <leader>jA mA:Ack "<C-r>=expand("<cWORD>")<cr>"

" Ctags config
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Press <leader> Enter to remove search highlights
noremap <silent> <leader><cr> :noh<cr>
" NerdTree toogle
map <C-o> :NERDTreeToggle<CR>
" Remove arrows
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

noremap <C-s-tab> :tabr<cr>
noremap <C-tab> :tabl<cr>
" nnoremap <C-w> :tabc<CR>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

noremap <C-p> :Files<CR>

" Splits settings
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

command! -bang -nargs=* Ag
  \ call fzf#vim#grep(
  \   'ag --column --numbers --noheading --color --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O


" Debug options for go (vim-go)
let g:go_debug_windows = {
      \ 'vars':       'rightbelow 60vnew',
      \ 'stack':      'rightbelow 10new',
\ }
