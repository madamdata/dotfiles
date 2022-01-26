syntax on
filetype plugin indent on
let g:sclangTerm="open -a Terminal.app"
set t_Co=256
let mapleader = ","
let maplocalleader=","
execute pathogen#infect()
colorscheme nightsky

"gui
set guifont=Courier:h12
hi Comment ctermfg=red

"LEADER FUNCTIONS
nnoremap <leader>( i(<esc>l%a)<esc>
nnoremap <leader>) i(<esc>l%2wa)<esc>
"<leader>u duplicate line, go to same cursor position on copied line, ciw.
"<leader>U - same thing, but comments out original line. 
"<leader>U - same thing, but comments out original line.
nnoremap <leader>u m`yyp``jciw
nmap <leader>U m`<leader>cyp``jciw 
nmap <leader>r <F6>
nmap <leader>s :w<cr>
nmap <leader>k <F12>
nmap <leader>p <F5>
"replace all spaces with escape-spaces (for file finding) 
nnoremap <leader>\ :%s/\s/\\ /g<cr>
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>; :normal! mqA;<esc>`q
nnoremap <leader>l <esc>f,w
nnoremap <leader>h <esc>F,b
"nnoremap <leader>y f,<esc>a<cr><esc>

"yank to clipboard in visual mode
vnoremap <leader>yc "+y
"paste from clipboard in normal mode
nnoremap <leader>pc "+p
function! Nextcomma()
	if search(',','n',line('.')) != 0
		exec "normal! f,a\<cr>\<esc>"
		call Nextcomma()
	elseif 1
		exec "normal! h"
		exec "normal! f)i\<cr>\<esc>"
	endif
endfunction
nnoremap <leader>y :call Nextcomma()<cr> 
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
let g:airline_theme='base16_ashes'
let g:airline_section_warning = ''
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

