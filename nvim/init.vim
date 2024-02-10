"   ██    ██ ██ ███    ███ ██████   ██████
"   ██    ██ ██ ████  ████ ██   ██ ██
"   ██    ██ ██ ██ ████ ██ ██████  ██
"    ██  ██  ██ ██  ██  ██ ██   ██ ██
"██   ████   ██ ██      ██ ██   ██  ██████


set linebreak
set nowrap
set ruler
set number
set showmatch
syntax on
set noswapfile
set mouse=a
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent
set relativenumber
set splitbelow
set splitright
set wildignorecase
command! W :w
command! WQ :wq
command! Wq :wq
set scrolloff=3

let mapleader=" "

nnoremap <leader>w :w<cr>
nnoremap <leader>b :Telescope buffers<cr>
nnoremap <leader>f :Telescope find_files<cr>
nnoremap <leader>t :Telescope<cr>
nnoremap <leader>o gT
nnoremap <leader>p gt
nnoremap <leader>m I#include <libc.h><cr><cr>int main(int ac, char **av)<cr>{<cr>}<esc>ko
nnoremap <leader>d :windo difft<cr>
nnoremap <leader>do :diffo<cr>
nnoremap <leader>lg :LazyGit<cr>
nnoremap <leader>t :terminal<cr>
nnoremap <leader>' :FloatermNew<cr>

nnoremap bp :bprev<cr>
nnoremap bn :bnext<cr>
nnoremap b1 :b1<cr>
nnoremap b2 :b2<cr>
nnoremap b3 :b3<cr>
nnoremap b4 :b4<cr>
nnoremap b5 :b5<cr>
nnoremap b6 :b6<cr>
nnoremap b7 :b7<cr>
nnoremap b8 :b8<cr>
nnoremap b9 :b9<cr>
nnoremap b0 :b10<cr>

nnoremap ª :m .+1<CR>==
nnoremap º :m .-2<CR>==

inoremap ª <Esc>:m .+1<CR>==gi
inoremap º <Esc>:m .-2<CR>==gi

vnoremap ª :m '>+1<CR>gv=gv
vnoremap º :m '<-2<CR>gv=gv

iabbrev strlen int	ft_strlen(char *str)<enter>{<enter>int	i;<enter><enter>i = 0;<enter><enter>while (str[i])<enter>i++;<enter>return (i);<enter>}

nnoremap <leader>h I#ifndef <c-r>%<esc>gUaWelr_A<cr># define <c-r>%<esc>gUaWelr_A<cr><cr>#endif<esc>
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>

"if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
"    set t_ut=
"endif

"""""""""""""""""""""""""""""""""""""""""""""
"              		 VIMPLUG 
"""""""""""""""""""""""""""""""""""""""""""""

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
	Plug 'drewtempelmeyer/palenight.vim'
	Plug 'vim-airline/vim-airline'
	Plug 'preservim/nerdtree'
	Plug 'github/copilot.vim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'kdheepak/lazygit.nvim'
	Plug 'voldikss/vim-floaterm'
	Plug 'rhysd/vim-clang-format'
	Plug 'chilledheart/vim-clangd'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""
"              		 NERDTREE 
"""""""""""""""""""""""""""""""""""""""""""""

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | wincmd p | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open the existing NERDTree on each new tab.
"autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" Refresh NERDTREE whith <cr>r
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>


"""""""""""""""""""""""""""""""""""""""""""""
"              		  COLOR CODEeD
"""""""""""""""""""""""""""""""""""""""""""""
let g:color_coded_enabled = 1
let g:color_coded_filetypes = ['c', 'cpp', 'objc']

"""""""""""""""""""""""""""""""""""""""""""""
"              		  PALENIGHT
"""""""""""""""""""""""""""""""""""""""""""""

if has('termguicolors')
	set termguicolors
endif
" The configuration options should be placed before `colorscheme edge`.
set background=dark
colorscheme palenight

"""""""""""""""""""""""""""""""""""""""""""""
"              		  AIRLINE
"""""""""""""""""""""""""""""""""""""""""""""
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='palenight'
"let g:airline#extensions#tabline#buffer_nr_show = 0
"if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"endif

set t_Co=256
runtime vim-airline.vim
"""""""""""""""""""""""""""""""""""""""""""""
"              		  SYNTASTIC
"""""""""""""""""""""""""""""""""""""""""""""

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"""""""""""""""""""""""""""""""""""""""""""""
"              		  CURSORLINE
"""""""""""""""""""""""""""""""""""""""""""""
"let g:airline_colornum_enabled = 1
"set cursorline
"hi clear CursorLine

"""""""""""""""""""""""""""""""""""""""""""""
"                     CLANG-FORMAT
"""""""""""""""""""""""""""""""""""""""""""""

let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format = 1
