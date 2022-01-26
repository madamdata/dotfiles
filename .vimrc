filetype plugin indent on

set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'preservim/nerdtree'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required

"gui
set guifont=Courier:h12
hi Comment ctermfg=red
colorscheme tender
syntax on
let g:airline_theme='powerlineish'
let g:airline_section_warning = ''
let g:sclangTerm="open -a Terminal.app"
set t_Co=256
let mapleader = ","
let maplocalleader=","

"LEADER FUNCTIONS
nnoremap <leader>( i(<esc>l%a)<esc>
nnoremap <leader>) i(<esc>l%2wa)<esc>
nmap <leader>s :w<cr>
"replace all spaces with escape-spaces (for file finding) 
nnoremap <leader>\ :%s/\s/\\ /g<cr>
"edit vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>; :normal! mqA;<esc>`q

"yank to clipboard in visual mode
vnoremap <leader>y "+y
"paste from clipboard in normal mode
nnoremap <leader>p "+p
inoremap <leader>,p <esc>"+p

function! Nextcomma()
	if search(',','n',line('.')) != 0
		exec "normal! f,a\<cr>\<esc>"
		call Nextcomma()
	elseif 1
		exec "normal! h"
		exec "normal! f)i\<cr>\<esc>"
	endif
endfunction
nnoremap <leader>1 /part 1<cr>jz.
nnoremap <leader>2 /part 2<cr>jz.
nnoremap <leader>3 /part 3<cr>jz.
nnoremap <leader>4 /part 4<cr>jz.
nnoremap <leader>5 /part 5<cr>jz.
nnoremap <leader>6 /part 6<cr>jz.
nnoremap <leader>7 /part 7<cr>jz.

" OTHER MAPPINGS
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <M-l> :bn<cr>
noremap <M-h> :bp<cr>
"noremap <F1> :SClangStart<enter>:! tmux split-window -t0.1 -v tidal<enter><enter>
noremap <F1> :SClangStart<cr>
noremap <F2> :SClangRecompile<enter>
noremap <F3> :w<enter>
map <F4> <esc>mzoServer.supernova;s.boot<F6><esc>dd`z

"Supercollider abbrevs

iabbrev Nd Ndef(
iabbrev Pd Pdef(
iabbrev Td Tdef(
iabbrev pbn Pbind(\type,\nd,\nDef,
iabbrev srecord s.recHeaderFormat_("wav").recSampleFormat_("int24");<cr>s.record;<cr>s.stopRecording;<esc>k


" ----- OPTIONS -----
set number
set ttyfast
set lazyredraw
set scrolljump=14
set ignorecase
set smartcase
set laststatus=2
set list
set listchars=tab:\~\ 
let g:pathogen_disabled = []
call add(g:pathogen_disabled, 'command-t')
call add(g:pathogen_disabled, 'csound')
call add(g:pathogen_disabled, 'supertab')
"call add(g:pathogen_disabled, 'scvim')

"NERDTree config
"let NERDTreeChDirMode=2
nnoremap <leader>n :NERDTreeToggle %:p:h<cr>

"tidal-vim config
let g:tidal_default_config = {"socket_name": "default", "target_pane": ":0.1"}

" AUTOCOMMAND GROUPS
augroup filetypes
	autocmd!
	autocmd BufNewFile,BufRead *.pd_lua set filetype=lua
	autocmd BufNewFile,BufRead *.anote set filetype=anote
augroup END

augroup filetype_anote
	autocmd!
	autocmd FileType anote nnoremap <leader>d ^f<space>i<space>*done*<space><esc>
	autocmd FileType anote nnoremap <leader>u :s/\ \*done\*\ //g<cr>
augroup END

augroup filetype_txt
	autocmd!
	autocmd FileType text set wrapmargin=78
	autocmd FileType text set wrap
augroup END

"CtrlP"
set runtimepath^=~/.vim/bundle/ctrlp.vim

"ag - vimgrep
set grepprg=ag\ --vimgrep\ $*
"set grepprg=grep\ -n
"set grepformat=%f:%l:%c:%m

