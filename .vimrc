set nocompatible

" because my shell (fish) is not POSIX
"set shell=sh

call pathogen#infect()

runtime macros/matchit.vim

syntax on
filetype plugin indent on    " enable detection, plugins and indenting in one step

" Global options"{{{
" Search
" change the mapleader from \ to ,
let mapleader=","
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
colorscheme solarized


set clipboard=unnamed,unnamedplus    "Feed automatically the clipboard with the content of the unnamed register (works in both direction)

set ignorecase               " Case-insensitive searching
set smartcase                " But case-sensitive if expression contains a capital letter
set incsearch                " Highlight matches as you type
set hlsearch                 " Highlight matches
set gdefault                 " substitute on all matches by default

set number                   " Show line numbers

" Tabs and indentation.
set autoindent               " Copy indent from current line when starting a new line
set smartindent              " Smart indent when starting a new line

set tabstop=4                " Width of <Tab> char
set softtabstop=4            " Number of spaces inserted when pressing <Tab> in insert mode
set shiftwidth=4             " Number of spaces inserted when (auto)indenting
set expandtab                " In insert mode, convert tab to spaces

set textwidth=80             " line length above which to break a line
set colorcolumn=+0           " highlight the textwidth limit

set nowrap                   " Turn off line wrapping.
set scrolloff=7              " Show 7 lines of context around the cursor.
set sidescrolloff=7

set showmatch                " when inserting a bracket, briefly jump to its match

set nojoinspaces             " smarter behavior of 'J' (join lines)

set laststatus=2             " Show the status line all the time

"never ever let Vim write a backup file!
set nobackup
set noswapfile

set hidden                   " don’t ask before closing a window

set visualbell               " no beeping

" show tabs / nbsp / trailing spaces
set list listchars=nbsp:¤,tab:··,trail:¤,extends:▶,precedes:◀

set wildmenu                 " Enhanced command line completion.
set wildmode=list:longest    " Complete files like a shell.

set wildignore=*/target/*
set wildignore+=tags

"If you have :set autoread in Vim, use :checktime after pulling from hg/git to
set autoread                 " Automatically read a file that has changed on disk

"persistent undo :help new-persistent-undo
set undodir=~/.vim/undodir
set undofile
set undolevels=1000          "maximum number of changes that can be undone
set undoreload=10000         "maximum number lines to save for undo on a buffer reload

set nrformats=               "treat all numerals as decimal, even if padded with zeros
set formatoptions-=or
"}}}

" Global mappings "{{{
" Disable arrow keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

noremap H ^
noremap L $

" remap U to <C-r> for easier redo
nnoremap U <C-r>

nnoremap <Tab> za

inoremap jj <Esc>

nnoremap / /\v

nnoremap <Enter> g<c-]>

" vpaste.net
noremap vp :exec "w !vpaste ft=".&ft<CR>
vnoremap vp <ESC>:exec "'<,'>w !vpaste ft=".&ft<CR>

" Alternative: Space/BackSpace for Page Down/Up
noremap <BS> <PageUp>
noremap <Space> <PageDown>

nnoremap <leader>a ggVG

"Open last/alternate buffer
noremap <Leader><Leader> <C-^>

"clear highlighted searches
nnoremap <silent> <leader>/ :nohlsearch<CR>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" from steve losh : http://stevelosh.com/blog/2010/09/coming-home-to-vim/
nnoremap <leader>v V`]
nnoremap <leader>ft Vatzf
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" qw with qwerty lafayette
nnoremap <silent> æ :q<CR>
nnoremap <silent> é :w<CR>

" Quickly edit/reload the vimrc file
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>

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

noremap <F5> :!ctags -R

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" align end of line comments in my vimrc
nnoremap <leader>ac 0f"80i <esc>30\|dt"

" http://www.43folders.com/2004/09/15/how-does-a-nerd-hack-gtd
nnoremap <leader>tn /TODOo    [ ] 
nnoremap <leader>tx ^lrX
nnoremap <leader>tw dd/@waiting<CR>p
"}}}

" Autocommand"{{{
augroup customfiletypedetect
  au!
  au BufRead,BufNewFile *.m,*.oct set filetype=octave
  au BufNewFile,BufReadPost *.md set filetype=markdown
  " automatically reload vimrc when it's saved
  au BufWritePost .vimrc so ~/.vimrc
  au BufRead .vimrc setlocal shiftwidth=2 tabstop=2

  autocmd FileType json setlocal equalprg=python\ -mjson.tool
  "map <leader>jt <Esc>:%!python -m json.tool<CR>

  au FileType scala setlocal shiftwidth=2 tabstop=2
  au BufEnter *.scala setl formatprg=java\ -jar\ /opt/scalariform/scalariform.jar\ --stdin\ --stdout
  au FileType yaml setlocal shiftwidth=2 tabstop=2
  au BufWritePost *.mm !refresh-store
  au filetype qf map <buffer> <cr> <cr>
augroup END
"}}}

" From ornicar "{{{
" https://github.com/ornicar/dotfiles/blob/master/vim/vimrc
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
"}}}

" Plugins configuration"{{{
" Ack
"let g:ackprg="ack -H --nocolor --nogroup --column"
let g:ackprg="ag --nogroup --nocolor --column --ignore=tags"
nmap <leader>j mA:Ack<space>
nmap <leader>ja mA:Ack "<C-r>=expand("<cword>")<cr>"
nmap <leader>jA mA:Ack "<C-r>=expand("<cWORD>")<cr>"

" CtrlP
nnoremap <Leader>o :CtrlP<CR>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_by_filename = 1
let g:ctrlp_max_files = 0 "no limit

nmap <F8> :TagbarToggle<CR>

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set noshowmode

" Tern
let tern#is_show_argument_hints_enabled=1

" cra.vim
autocmd! BufWritePost cra.vim source <afile>
let g:NbCPPerYear = 22
let g:NbRTPerYear = 9
let g:NbRemainingCP = 21 " remaining CP end of 2013

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors=1

let g:syntastic_sh_checkers = ["sh", "shellcheck", "checkbashisms"]
let g:syntastic_markdown_checkers = ["mdl"]
let g:syntastic_yaml_checkers = ["jsyaml"]
" gem install mdl
" brew install checkbashisms
" npm install -g jsyaml
"}}}

" Scala"{{{
"Error format for SBT, and shortcut to open SBT quickfix file :
"-----vim.rc-------
set errorformat=%E\ %#[error]\ %#%f:%l:\ %m,%-Z\ %#[error]\ %p^,%-C\ %#[error]\ %m
set errorformat+=,%W\ %#[warn]\ %#%f:%l:\ %m,%-Z\ %#[warn]\ %p^,%-C\ %#[warn]\ %m
set errorformat+=,%-G%.%#
noremap <silent> <Leader>ff :cf /tmp/sbt.quickfix<CR>
noremap <silent> <Leader>fn :cn<CR>
"}}}

" AXA related stuff "{{{
let g:scala_sort_across_groups=1
let g:scala_first_party_namespaces='\(com.axa\|axa\)'
set wildignore+=*/node_modules/*
set wildignore+=*/tomcat_runner/*
set wildignore+=*/jetty_runner/*
set wildignore+=*/thirdparties/*
"}}}

"Learn Vim Script"{{{
:onoremap in( :<c-u>normal! f(vi(<cr>
":help omap-info
:onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
:onoremap ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>
":help normal
":help execute
":help expr-quote
"}}}

" vim: set ft=vim fdm=marker fmr={{{,}}} fdl=0:
