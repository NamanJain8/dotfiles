" VIM Config file | Naman Jain

set nocompatible              " be iMproved, required
set noswapfile
filetype off                  " required

call plug#begin("~/.config/nvim/plugged")
" Plugin for Git
Plug 'tpope/vim-fugitive'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-commentary'
Plug 'ervandew/supertab'
Plug 'tpope/vim-rhubarb'
" Highlight unique character in every line.
Plug 'unblevable/quick-scope'

" Plugin for Golang
Plug 'fatih/vim-go'

" Plugin for C++
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'Valloric/YouCompleteMe'

" Plugin for JS
Plug 'pangloss/vim-javascript'

Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-surround'

Plug 'morhetz/gruvbox'
Plug 'fatih/molokai'
Plug 'vim-airline/vim-airline'
call plug#end()

" Color scheme (theme)
" colorscheme gruvbox
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai
" Highlight only on some keys.
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

let g:go_fmt_command = "goimports"   " Run goimports along gofmt on each save
let g:go_auto_type_info = 1          " Automatically get signature/type info for object under cursor
" Highlight build constraints
" https://github.com/fatih/vim-go-tutorial#beautify-it
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1

" Use nvim terminal instead of background job.
let g:go_term_enabled = 1
let g:go_term_close_on_exit = 0

set number ruler hlsearch incsearch smartcase ignorecase
set scrolloff=3           " Display at least 3 lines around you cursor
                          " (for scrolling)

" Backspace behaves as expected
set backspace=indent,eol,start

" Move to begin/end of line
nnoremap B ^
nnoremap E $

" highlight the current line number
hi CursorLineNR guifg=#ffffff

" highlight text over 100 characters
" au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)
set colorcolumn=100

let mapleader = " "

" Disable arrow keys
noremap <Up>	<Nop>
noremap <Down>	<Nop>
noremap <Left>	<Nop>
noremap <Right>	<Nop>

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

nnoremap <F3> :noh<CR>
noremap <c-p> :Files<CR>
" inoremap <c-f> <ESC>:BLines<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
" Vim-go
noremap <leader>o :GoDeclsDir<CR>
" leader d is by default mapped to YcmShowDetailedDiagnostic
noremap <leader>d :GoDecls<CR>
noremap <leader>r :GoReferrers<CR>
noremap <leader>t :GoTestFunc<CR>

" Vim-fugitive
noremap <leader>v :Gbrowse<CR>
noremap <leader>b :Gblame<CR>
noremap <leader>gs :G<CR>
noremap <leader>w :GoBuild<CR>
noremap <leader>gd :G diff<CR>
noremap <leader>gca :G checkout -- .<CR>

"
noremap <leader>f :Rg<CR>
" Use leader y to copy to system clipboard
" noremap <Leader>y "+y
" noremap <Leader>p "+p
set clipboard+=unnamedplus

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Switch the buffers
" nnoremap <C-n> :bn<CR>
" nnoremap <C-m> :bp<CR>
" nnoremap <C-w> :bd<CR>
"https://github.com/fatih/vim-go-tutorial#vimrc-improvements-4
" autocmd BufNewFile,BufRead *.go setlocal
set autoindent noexpandtab tabstop=4 shiftwidth=4

" Gdiff vertically
set diffopt+=vertical

"let g:ycm_autoclose_preview_window_after_insertion = 1

" show smarter tab line
let g:airline#extensions#tabline#enabled = 1

let $FZF_DEFAULT_COMMAND="rg --files"
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.8 } }

" Search for highlighted text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Gopls for vim https://github.com/golang/tools/blob/master/gopls/doc/vim.md#vim-go
" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'

"au filetype go inoremap <buffer> . .<C-x><C-o>

" Match autocomplete as characters are typed
" https://vim.fandom.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
" Used by gopls and vim-go
" set completeopt=longest,menuone

" Reverse the direction of completion.
" let g:SuperTabDefaultCompletionType = "<c-n>"

" Enable vim hardtime which blocks repeated characters
" let g:hardtime_default_on = 1
" let g:hardtime_showmsg=1

" Run meta linter => autosave_enabled doesn't seem to work. It runs errCheck
" always.
" https://github.com/fatih/vim-go-tutorial#check-it
" let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
" let g:go_metalinter_deadline = "5s"
" let g:go_metalinter_autosave = 1
" let g:go_metalinter_autosave_enabled = ['vet', 'golint']

" Show info about the indentifier
"https://github.com/fatih/vim-go/wiki/Tutorial#identifier-resolution
set updatetime=100

" From https://stackoverflow.com/a/22253548
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Highlight text as you type the substitute ":s/.../"
" set inccommand=nosplit

" Consider all numerals as decimal
" Useful in <c-x> and <c-a>
set nrformats=

" Give more space for displaying messages.
set cmdheight=2

" Open vsplit on right.
set splitright

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" Templates
:autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp


" CPP Config {{{
" C++ Config
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" }}}
