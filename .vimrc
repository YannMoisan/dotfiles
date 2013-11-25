set nocompatible

execute pathogen#infect()

syntax on
filetype plugin indent on " enable detection, plugins and indenting in one step

set ignorecase " Case-insensitive searching.
set smartcase " But case-sensitive if expression contains a capital letter.
set incsearch " Highlight matches as you type.
set hlsearch " Highlight matches.

set number

" Tabs and indentation.
set expandtab
set autoindent
set smartindent

" Configure tabstyle...
set tabstop=4
set softtabstop=4
set shiftwidth=4

set nowrap " Turn off line wrapping.
set scrolloff=7 " Show 7 lines of context around the cursor.
set sidescrolloff=7

"never ever let Vim write a backup file!
set nobackup
set noswapfile

set hidden

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

set wildmenu " Enhanced command line completion.
set wildmode=list:longest " Complete files like a shell.
set wildignore=**/target/*

set clipboard=unnamedplus "Feed automatically the clipboard with the content of the unnamed register (works in both direction)

" change the mapleader from \ to ,
let mapleader=","

"persistent undo 
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" configure solarized color theme
if has('gui_running')
    set background=light
else
    set background=dark
endif
set t_Co=16
let g:solarized_termcolors=16
colorscheme solarized

" Desactiver les touches directionnelles
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

:inoremap jj <Esc>

nnoremap <Enter> g<c-]>
autocmd filetype qf map <buffer> <cr> <cr>

" vaste.net
:map vp :exec "w !vpaste ft=".&ft<CR>
:vmap vp <ESC>:exec "'<,'>w !vpaste ft=".&ft<CR>

" paste in insertion mode, without auto-indent, (<C-r>* auto-indent)
inoremap KJ <C-O>"*p

" Alternative: Space/BackSpace for Page Down/Up
noremap <BS> <PageUp>
noremap <Space> <PageDown>

" http://www.43folders.com/2004/09/15/how-does-a-nerd-hack-gtd
nnoremap <leader>tn /TODOo    [ ] 
nnoremap <leader>tx ^lrX
nnoremap <leader>tw dd/@waiting<CR>p

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>
nnoremap <silent> [Q :cfirst<CR>
nnoremap <silent> ]Q :clast<CR>

" open a vertical split and switch over (v)
nnoremap <leader>v <C-w>v<C-w>l
nnoremap ŭ <C-w>v<C-w>l

" open a horizontal split (s)
nnoremap <leader>s <C-w>s
nnoremap ß <C-w>s

"Quick buffer navigation
nnoremap gb :buffers<CR>:sb<Space>

" switching / moving / creating tabs
noremap <silent> <Esc>y :tabnew<CR>
noremap <silent> <Esc>u :tabprev<CR>
noremap <silent> <Esc>i :tabnext<CR>
noremap <silent> <Esc>U :exe "tabmove " .(tabpagenr()-2)<CR>
noremap <silent> <Esc>I :exe "tabmove " . tabpagenr()<CR>

" automatically reload vimrc when it's saved
augroup filetype_vimrc
    autocmd!
    autocmd BufWritePost .vimrc so ~/.vimrc
augroup END

noremap H ^
noremap L $

" remap U to <C-r> for easier redo
nnoremap U <C-r>

"Open last/alternate buffer 
noremap <Leader><Leader> <C-^>

"clear highlighted searches
nmap <silent> ,/ :nohlsearch<CR>

map <F5> :!ctags -R

" Sudo to write
cmap w!! w !sudo tee % >/dev/null

" Parametres par defaut pour ack
let g:ackprg="ack -H --nocolor --nogroup --column"
" Place un marqueur et cherche
nmap <leader>j mA:Ack<space>
" Place un marqueur et cherche le mot sous le curseur
nmap <leader>ja mA:Ack "<C-r>=expand("<cword>")<cr>"
nmap <leader>jA mA:Ack "<C-r>=expand("<cWORD>")<cr>"

"let g:ctrlp_map=',c'
let g:ctrlp_map = '<c-p>'

let g:ctrlp_root_markers = ['.ctrlp']

let s:tlist_def_scala_settings = 'scala;t:trait;c:class;T:type;m:method;C:constant;l:local;p:package;o:object'

nmap <F8> :TagbarToggle<CR>

"use conf in vim-scala/plugin.vim
"let g:tagbar_type_scala = {
"    \ 'ctagstype' : 'Scala',
"    \ 'kinds'     : [
"        \ 'p:packages:1',
"        \ 'V:values',
"        \ 'v:variables',
"        \ 'T:types',
"        \ 't:traits',
"        \ 'o:objects',
"        \ 'a:aclasses',
"        \ 'c:classes',
"        \ 'r:cclasses',
"        \ 'm:methods'
"    \ ]
"    \ }
