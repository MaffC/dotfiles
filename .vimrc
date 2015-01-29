"Maff's .vimrc, please don't yell at me if you don't like what I like.

" Vundle {{{1
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'chrisbra/changesPlugin'
call vundle#end()
filetype indent plugin on
" }}}
" Basic terminal shit {{{1
set t_Co=256 "Ensure vim will use 256-colour mode where possible
set encoding=utf-8 "Unicode
set fileencoding=utf-8 "Possibly needed for changed.vim
set tabstop=4 "One tab is four spaces. A tab does not need to take up half the width of the damn screen
set shiftwidth=4 "Same
set showmatch "Show search matches
set vb t_vb= "I forget what this does
set ruler "Show current line
set incsearch "I forget what this does
set hidden "And this
set hlsearch "This too
syntax on "Enable syntax highlighting
set wildmenu "MICROSOFT VIM INTELLISENSE
set backspace=indent,eol,start "More intelligent backspacing
set nostartofline "I forget what this does
set confirm "And this
set number "Show line numbers
colors badwolf "Set colour scheme
set cursorline "Show current line. I thought this was ruler but I guess not
set showtabline=0 "I forget what this does
set shortmess=At "And this
set autoindent "Automatically indent shit
set smartindent "Intelligently indent shit
set ofu=syntaxcomplete#Complete "I have no idea what this does
set viminfo='100,<50,s10,h,\"100,:100,%,n~/.viminfo "Save my place in files
set laststatus=2 "Always show statusbar
set foldmethod=marker "use triple curly braces to indicate folds
set mouse=a "turn on mouse scrolling and whatnot
"automatically restore folds (needs fixed to not be a faggot)
au BufWinLeave * mkview
au BufWinEnter * silent loadview
" }}}
" Key mappings {{{1
"These do things like map ctrl-l to removing highlights or
"mapping alt-backspace to delete by word
nnoremap <C-L> :nohl<CR><C-L>
inoremap <C-L> <ESC>:nohl<CR><C-L>i
inoremap <ESC><BS> <C-W>
nnoremap U <C-R>
" }}}
" Airline {{{1
let g:airline_symbols={}
let g:airline_symbols.whitespace='!'
" }}}
" GVim-specific stuff {{{1
if has('gui_running')
	let g:airline_theme='solarized'
	set lines=36 columns=180 "Set default window size
	set guioptions-=m "Disable the pointless status/menu bars
	set guioptions-=T
	set guioptions-=r
	"let g:airline_powerline_fonts=1 "Powerline styling
	let g:airline_symbols.linenr='≣'
	set showtabline=1
else
	let g:airline#extensions#tabline#enabled=1
	let g:airline_theme='wombat'
	let g:airline_left_sep='►'
	let g:airline_right_sep='◄'
	let g:airline_symbols.linenr='≡'
endif
" }}}
" Extras and misc functions {{{1
"indicate when I'm going over 80 characters
"highlight OverLength ctermbg=198 ctermfg=white
"match OverLength /\%81v.\+/

"Functions and shit
"Restore cursor
function! ResCur()
	if line("'\"") <= line("$")
		normal! g`"
		return 1
	endif
endfunction
augroup resCur
	autocmd!
	autocmd BufWinEnter * call ResCur()
augroup END
" Enable changedplugin on buffer enter
autocmd BufWinEnter * EnableChanges
" }}}
