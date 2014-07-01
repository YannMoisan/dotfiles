set nocompatible

" because my shell (fish) is not POSIX
"set shell=sh

call pathogen#infect()

runtime macros/matchit.vim

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

set textwidth=120

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

set visualbell

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

set wildmenu " Enhanced command line completion.
set wildmode=list:longest " Complete files like a shell.
set wildignore=**/target/*
set wildignore+=tags

set clipboard=unnamed,unnamedplus "Feed automatically the clipboard with the content of the unnamed register (works in both direction)

"If you have :set autoread in Vim, use :checktime after pulling from hg/git to
"load all the new changes into existing buffers.
set autoread

" change the mapleader from \ to ,
let mapleader=","

"persistent undo :help new-persistent-undo
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

nnoremap / /\v

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
"let g:ackprg="ack -H --nocolor --nogroup --column"
let g:ackprg="ag --nogroup --nocolor --column --ignore=tags"

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
"

"Error format for SBT, and shortcut to open SBT quickfix file :
"-----vim.rc-------
set errorformat=%E\ %#[error]\ %#%f:%l:\ %m,%-Z\ %#[error]\ %p^,%-C\ %#[error]\ %m
set errorformat+=,%W\ %#[warn]\ %#%f:%l:\ %m,%-Z\ %#[warn]\ %p^,%-C\ %#[warn]\ %m
set errorformat+=,%-G%.%#
noremap <silent> <Leader>ff :cf /tmp/sbt.quickfix<CR>
noremap <silent> <Leader>fn :cn<CR>

" config for cra.vim
autocmd! BufWritePost cra.vim source <afile>

let g:NbCPPerYear = 22
let g:NbRTPerYear = 9
" remaining CP end of 2013
let g:NbRemainingCP = 21

au BufEnter *.scala setl formatprg=java\ -jar\ /opt/scalariform/scalariform.jar\ --stdin\ --stdout

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Strip the newline from the end of a string
function! Chomp(str)
  return substitute(a:str, '\n$', '', '')
endfunction

" Find a file and pass it to cmd
function! DmenuOpen(cmd)
  let fname = Chomp(system("git ls-files | dmenu -i -l 20 -p " . a:cmd))
  if empty(fname)
    return
  endif
  execute a:cmd . " " . fname
endfunction

map <c-t> :call DmenuOpen("tabe")<cr>
map <c-f> :call DmenuOpen("e")<cr>
" Compatible with ranger 1.4.2 through 1.6.*
"
" Add ranger as a file chooser in vim
"
" If you add this function and the key binding to the .vimrc, ranger can be
" started using the keybinding ",r".  Once you select a file by pressing
" enter, ranger will quit again and vim will open the selected file.

fun! RangerChooser()
    exec "silent !ranger --choosefile=/tmp/chosenfile " . expand("%:p:h")
    if filereadable('/tmp/chosenfile')
        exec 'edit ' . system('cat /tmp/chosenfile')
        call system('rm /tmp/chosenfile')
    endif
    redraw!
endfun
map ,r :call RangerChooser()<CR>

" Axa
au! BufRead,BufNewFile *.mm,*.m set filetype=json
autocmd FileType scala setlocal shiftwidth=2 tabstop=2
map <leader>jt <Esc>:%!python -m json.tool<CR>

let g:ctrlp_by_filename = 1

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<cr>:copen<cr>

" Replace what's selected
vnoremap <C-h> ""y:%s/<C-R>=escape(@", '/\')<cr>//g<Left><Left>

" Pull word under cursor into LHS of a substitute (for quick search and replace)
nmap <leader>zs :%s#<C-r>=expand("<cword>")<cr>#

" Global quick search-replace
nmap <leader>sr :!ack -l <C-r>=expand("<cword>")<cr> \|
      \ xargs perl -pi -E 's/<C-r>=expand("<cword>")<cr>//g'<left><left><left>

" Start a substitute
nmap <leader>ss :%s/\v

" Fast file renaming
nmap R :let _pfn="<C-R>=expand("%:.")<cr>"<cr>q:iRename <C-R>=expand(_pfn)<cr><esc>^w
