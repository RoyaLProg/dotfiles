"   ██    ██ ██ ███    ███ ██████   ██████
"   ██    ██ ██ ████  ████ ██   ██ ██
"   ██    ██ ██ ██ ████ ██ ██████  ██
"    ██  ██  ██ ██  ██  ██ ██   ██ ██
"██   ████   ██ ██      ██ ██   ██  ██████


set noexpandtab
set linebreak
set nowrap
set ruler
set number
set showmatch
syntax on
set noswapfile
set mouse=a
set shiftwidth=0
set tabstop=4
set softtabstop=-1
set autoindent
set smartindent
set relativenumber
set splitbelow
set splitright
set wildignorecase
filetype plugin indent off
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
nnoremap b1 <Plug>AirlineSelectTab1
nnoremap b2 <Plug>AirlineSelectTab2
nnoremap b3 <Plug>AirlineSelectTab3
nnoremap b4 <Plug>AirlineSelectTab4
nnoremap b5 <Plug>AirlineSelectTab5
nnoremap b6 <Plug>AirlineSelectTab6
nnoremap b7 <Plug>AirlineSelectTab7
nnoremap b8 <Plug>AirlineSelectTab8
nnoremap b9 <Plug>AirlineSelectTab9
nnoremap b0 <Plug>AirlineSelectTab0

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

iabbrev strlen int	ft_strlen(char *str)<enter>{<enter>int	i;<enter><enter>i = 0;<enter><enter>while (str[i])<enter>i++;<enter>return (i);<enter>}

nnoremap <leader>h I#ifndef <c-r>%<esc>gUaWelr_A<cr># define <c-r>%<esc>gUaWelr_A<cr><cr>#endif<esc>
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>

"if &term =~ '256color'
	"disable Background Color Erase (BCE) so that color schemes
	"render properly when inside 256-color tmux and GNU screen.
	"see also http://snk.tuxfamily.org/log/vim-256color-bce.html
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
	Plug 'vim-airline/vim-airline-themes'
	Plug 'preservim/nerdtree'
	Plug 'github/copilot.vim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'kdheepak/lazygit.nvim'
	Plug 'voldikss/vim-floaterm'
	Plug 'rhysd/vim-clang-format'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'ycm-core/YouCompleteMe'
"	Plug 'chilledheart/vim-clangd'
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
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colorscheme palenight
" set cusorcolor to blue
"""""""""""""""""""""""""""""""""""""""""""""
"              		  AIRLINE
"""""""""""""""""""""""""""""""""""""""""""""
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
"                     CLANG-FORMAT
"""""""""""""""""""""""""""""""""""""""""""""

let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format = 1

"""""""""""""""""""""""""""""""""""""""""""""
"					 CURSOR
"""""""""""""""""""""""""""""""""""""""""""""

set guicursor=n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor
aug kitty_cursor
	au!
	au Colorscheme * set guicursor=n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor
aug END

let g:python_recommended_style = 0
