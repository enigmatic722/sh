if &compatible
    set nocompatible
endif    

set backspace=indent,eol,start

let g:mapleader=" "

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

" disable commentary new line auto
set incsearch
set vb t_vb=
set formatoptions-=cro 
set cursorline
set shellcmdflag=-command
set autochdir
set splitright
set splitbelow
set matchpairs+=<:>
set omnifunc=syntaxcomplete#Complete
set suffixesadd=.java
set path+=**
set nu rnu
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set wildmode=list:full
"set wildcharm=<C-n>
set shortmess-=S
set hlsearch
set smartindent
filetype plugin indent on 

set mouse=a
set ttymouse=sgr
" if has("mouse_sgr")
"   set ttymouse=sgr
" else
"   set ttymouse=xterm2
" end

nnoremap <rightmouse> p
xnoremap <rightmouse> y

inoremap <rightmouse> <C-r>"
xnoremap <rightmouse> y

inoremap <middlemouse> <Esc>
tnoremap <middlemouse> <leftmouse><C-@>N
nnoremap <middlemouse> i
vnoremap <middlemouse> <Esc>

""set guitablabel=%t
""set tabline=%t
inoremap <C-s> <C-o>:w<cr>
nnoremap <C-s> :w<cr>
nnoremap <cr> %
vnoremap <cr> %
nnoremap - 3<C-w><
nnoremap = 3<C-w>>
nnoremap _ 3<C-w>+
nnoremap + 3<C-w>-
" nnoremap <silent> <c-k> :wincmd k<CR>
" nnoremap <silent> <c-j> :wincmd j<CR>
" nnoremap <silent> <c-h> :wincmd h<CR>
" nnoremap <silent> <c-l> :wincmd l<CR>
nnoremap <C-k> :cp<cr>
nnoremap <C-j> :cn<cr>
nnoremap <C-l> :.cc<cr>
nnoremap <space> :.cc<cr><C-w>w
command! -nargs=1 Vg vimgrep <q-args> % | copen
nnoremap <leader>s :vimgrep  % <bar> :copen<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
"nnoremap <leader>f :vimgrep /<c-r><c-w>/j **/*.{c,h,txt} <bar> :copen <CR>
" nnoremap <leader>g :vimgrep /<c-r><c-w>/j **/*. <bar> :copen<Left><Left><Left><Left><Left><Left><Left><Left><Left>
nnoremap <leader>g :vimgrep // % <bar> :copen<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
nnoremap zh zszH
cnoremap <c-p> <up>
cnoremap <c-n> <down>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

inoremap <C-l>  <Right>
inoremap <C-h>  <Left>
inoremap <C-k>  <Up>
inoremap <C-j>  <Down>
inoremap <C-a>  <C-o>^
inoremap <C-e>  <End>


" experiment
"inoremap <up> <c-p>
"inoremap <down> <c-n>
"nmap <up> <c-p>
"nmap <down> <c-n>

nnoremap & :&&<CR>
xnoremap & :&&<CR>
"nnoremap <C-w>n :vnew<cr>
"nnoremap <C-w>' <C-w>n
nnoremap <C-w><PageDown> <C-w>j
nnoremap <C-w><PageUp> <C-w>k

nnoremap <leader>t <C-w>T
nnoremap <leader>' ``
nnoremap <leader>; :tabe $MYVIMRC<cr>
nnoremap <leader>z :source $MYVIMRC<cr>
nnoremap <leader>, %
command! Df normal! :windo diffthis<cr>
command! D windo diffthis
" command! Do normal! :diffoff!<cr>
command! Do diffoff!
" command! -nargs=1 Ss let @/ = escape(<q-args>, '/')|normal! /<C-R>/<CR>
command! -nargs=1 SS let @/ = '\V'.escape(<q-args>, '\')
" command! -nargs=1 SS let @/ = '\V'.escape(<q-args>, '\')|set hlsearch
command! -nargs=1 SearchWithSlash let @/ = '\V'.escape(<q-args>, '/\')|normal! /<C-R>/<CR>

xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction
"command escape shortcut key
" cnoremap <C-e> <C-r>=escape('','\')<left><left><left><left><left><left>
" inoremap <C-e> <C-r>=escape('','\')<left><left><left><left><left><left>

autocmd VimEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufNewFile,BufRead * setlocal formatoptions-=ro
""autocmd BufRead,BufNewFile *.jsp set filetype=html
autocmd BufRead *.class set syntax=java
autocmd! FileType json set filetype=jsonc
au BufRead,BufNewFile *.vrapperrc set filetype=vim
au BufRead,BufNewFile *.v set filetype=coq
au BufRead,BufNewFile *.idr set filetype=idris
au BufRead,BufNewFile *.hsc set filetype=haskell
au BufRead,BufNewFile *.bpk set filetype=haskell
au BufRead,BufNewFile *.hsig set filetype=haskell
au BufRead,BufNewFile *.jsh set filetype=java
au BufRead,BufNewFile *.log set filetype=log
au BufRead,BufNewFile *log* set filetype=log
au BufRead,BufNewFile secure set filetype=log
au BufRead,BufNewFile *sql set filetype=SQL
au BufRead,BufNewFile *bat set filetype=dosbatch
au BufRead,BufNewFile *tmprc set filetype=sh
au BufRead,BufNewFile .termrc set filetype=vim
au BufRead,BufNewFile *dirrc set filetype=sh
au BufRead,BufNewFile *.defs set filetype=sh
au BufRead,BufNewFile *.conf set filetype=config
au BufRead,BufNewFile *.properties set filetype=config
au BufRead,BufNewFile *.nginx set ft=nginx
au BufRead,BufNewFile */etc/nginx/* set ft=nginx
au BufRead,BufNewFile */usr/local/nginx/conf/* set ft=nginx
au BufRead,BufNewFile nginx.conf set ft=nginx
au BufRead,BufNewFile *.nft,nftables.conf setfiletype nftables


" commentary
autocmd! FileType vim setl cms=\"%s 
autocmd! FileType sh setl cms=#%s 
autocmd! FileType crontab setl cms=#%s 
autocmd! FileType sshdconfig setl cms=#%s 

set wildignore+=*.hi,*.o

"autocmd! BufNewFile *.java exe \"normal Opublic class \" . expand('%:t:r')
"autocmd! BufNewFile *.java exe "normal ipublic class " . expand('%:t:r') . " {\n\n}\<Esc>gg"
"autocmd! BufRead *.java if getfsize(expand('%'))==0|exe "normal ipublic class " . expand('%:t:r') . " {\n\n}\<Esc>gg"|endif
"autocmd! BufNewFile *.java exe "normal ipublic class " . expand('%:t:r') . " {\n\n\<Esc>gg"
"autocmd! BufRead *.java if getfsize(expand('%'))==0|exe "normal ipublic class " . expand('%:t:r') . " {\n\n\<Esc>gg"|endif
nnoremap <home> ^
inoremap <home> <c-o>^

vnoremap g; g_
vnoremap <End> g_
nnoremap <A-i> :tabr<CR>
nnoremap <A-;> :tabl<CR>
nnoremap <A-left> <C-o>
nnoremap <A-right> <C-i>

command! P normal! p
command! Off normal! :diffoff!<cr>

if !exists('g:lasttab')
  let g:lasttab = 1
endif
""nmap gl :exe "tabn ".g:lasttab<CR>
""au TabLeave * let g:lasttab = tabpagenr()

nnoremap <silent> <leader>h :noh<cr>
nnoremap ch :set hlsearch<cr>
nnoremap co :copen<cr>
" nnoremap <leader>c :ccl<cr>
" noremap <A-S-j> :cn<cr>
" noremap <A-S-k> :cp<cr>

set fileencodings=utf-8,big5,gbk,latin1
set encoding=utf-8
set ignorecase
set autoread
set nowrap
"set list listchars=tab:\:\ ,trail:·,extends:?,precedes:?,nbsp:×
set ai
"set ruler
set background=dark
set termguicolors
" show full path
set laststatus=2
set statusline+=%F

"set virtualedit=block # visual block
"" always yank to clip
" set clipboard=unnamed
set scrolloff=3
set iskeyword+=\$
syntax on
" autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
nnoremap dl ^"_D
nnoremap d "_d
nnoremap D "_D
nnoremap x "_x
" nnoremap s "_s
vnoremap s "_s
nnoremap c "_c
nnoremap C "_C
vnoremap d "_d
vnoremap c "_c
vnoremap d "_d
vnoremap D "_D
vnoremap c "_c
"vnoremap y "*y
"nnoremap y "*y
"nnoremap Y "*y$ 
"nnoremap y" "*yi"
"nnoremap y( "*yi(
"nnoremap y' "*yi'
"nnoremap y< "*yi<
"nnoremap y{ "*yi{
"nnoremap y[ "*yi[
"vnoremap x "*x
"noremap P "*P
"noremap p "*p
nnoremap Y y$
nnoremap yl ^y$
nnoremap gp "_cw<C-r>"<Esc>b
"nnoremap <leader>v "_cw<C-r>*<Esc>b
"noremap <leader>p "*p
"noremap <leader>P "*P
nnoremap <leader>x x
nnoremap <leader>d d
nnoremap <leader>D D
nnoremap <leader>c c
nnoremap <leader>C C
"nnoremap <A-UP> :m-2<CR> 
"nnoremap <A-DOWN> :m+1<CR> 
nnoremap <leader>n :set nonu! rnu!<CR>
nnoremap <F2> :set nonu nornu<CR>
nnoremap <F3> :set nu nornu<CR>
inoremap <F2> <C-o>:set nonu nornu<CR>
inoremap <F3> <C-o>:set nu nornu<CR>

nnoremap <leader>w :set wrap!<CR>
nnoremap <C-n> :set rnu!<CR>
nnoremap <leader>w :set nowrap!<CR>
inoremap <C-o>o <Esc>o
inoremap <C-o>O <Esc>O
nnoremap o o<Space><BS><Esc>
nnoremap O O<Space><BS><Esc>
vnoremap v( vi(
vnoremap v' vi'
"vnoremap v< vi<
" vnoremap v{ vi{
" vnoremap v[ vi[
vnoremap " c""<Esc>P
vnoremap ' c''<Esc>P
vnoremap ( c()<Esc>P
vnoremap { c{}<Esc>P
vnoremap [ c[]<Esc>P
nnoremap gs i~~<C-o>A~~<Esc>
vnoremap gs c~~~~<esc><left><left>p
" nnoremap gh ciW****<Left><Left><C-o>P<Esc>
" vnoremap gh c****<Esc><Left>P
nnoremap dh F*a<C-w><C-o>f*<Del><Del><Esc>
"vnoremap < c<><Esc>P
vnoremap < <gv
vnoremap > >gv
" inoremap <C-j> ____<left><left>

"inoremap jk <ESC>
"nnoremap <Tab> :><CR>
"nnoremap <S-Tab> :<<CR>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
"maybe for mac or linux
" tab series
"command T -nargs=1 :tabnew +<args>buf
"nnoremap T :tabnew\|0r!grep -n '' #<Left><Left><Left>
"command! -nargs=1 T :args <args> | tab all

""tabs
nnoremap <leader>q :bd<cr>
nnoremap <leader>! :bd!<cr>
nnoremap <silent> <A-S-i> :tabm 0 <CR>
nnoremap <silent> <A-S-m> :execute 'tabm' tabpagenr('$') <CR>
"nnoremap tmi :tabm 0 <CR>
"nnoremap tm; :execute 'tabm' tabpagenr('$') <CR>
"nnoremap <C-left> :tabm -1 <CR>
"nnoremap <C-right> :tabm +1 <CR>
nnoremap <A-h> :tabm -1 <CR>
nnoremap <A-l> :tabm +1 <CR>
nnoremap <silent> <leader>mi :tabm 0 <CR>
nnoremap <silent> <leader>m; :tabm <CR>
nnoremap <leader>1 :tabr<CR>
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 :tabl<CR>
" nnoremap <leader>; :tabl<CR>
nnoremap <leader>t :tabnew 
nnoremap <C-t> :tabnew 
nnoremap <leader>v :vnew 

nnoremap <S-tab> gT
nnoremap <tab>   gt

:cnoremap <C-A>  <Home>
:cnoremap <C-D>  <Del>
:cnoremap <C-E>  <End>
:cnoremap <C-l>  <Right>
:cnoremap <C-H>  <Left>
:cnoremap <C-k>  <Up>
:cnoremap <C-j>  <Down>
" recall newer command-line
" recall previous (older) command-line
" back one word
" " back one word
" :cnoremap <C-B> <S-Left>
" :cnoremap <C-F> <S-Right>

inoremap <C-f>. <Space>-><Space>
inoremap <C-f>> <Space>=><Space>
" inoremap <C-f>, <> <Left>
inoremap <C-f>[ 「」<Left>
inoremap <C-@>[ {}<Left>
inoremap <C-f>, <><Left>
inoremap <C-@>\| \|\|<Left>
inoremap <C-f>\| \|\|<Left>

"close others
nnoremap <silent> tco :tabo <CR>

nnoremap <leader>/ /\<\>/<Left><Left><Left>
"nnoremap f /\<\><Left><Left>
command! -nargs=1 F normal! /\<<args>\>/<CR>

""Replace Commands
vnoremap <C-r> "hy:%s/<C-r>h//gcI<left><left><left>
"nnoremap cpq ggw"*yt;o.<c-r>=expand('%:r')<Cr><Esc>^P^"*y$u
nnoremap cpq gg^w"*yt;:let @" .= ".".expand("%:r")<cr>
nnoremap cpp i<space><c-r>=expand('%:r')<Cr><space>
nnoremap cpd :let @" = expand("%:p:h")<cr>
nnoremap cpf :let @" = expand("%:p")<cr>
nnoremap cpn :let @" = expand("%")<cr>
command! Cpf normal! :let @* = expand("%")<cr>
command! Cpd normal! :let @* = expand("%:p")<cr>
command! Pd normal! i<c-r>=expand('%:p')<Cr>
command! Pn normal! i<c-r>=expand('%:r')<Cr>
command! Pf normal! i<c-r>=expand('%')<Cr>
command! Grp %s/.*\n.*\n/\0\r/g
command! ReverseBackslash %s/\\/\//g "reverse backslash
command! ReverseSlash %s/\//\\/g "reverse backslash
command! -range=% DeleteBlankLn :<line1>,<line2>g/^\s*$/d  "delete blank line with visual select
command! -range=% DeleteBlankLnAll :<line1>,<line2>s/^\d*//g  "delete blank line
nnoremap db :g/^$/d<cr>
command! -range=% Trl :<line1>,<line2>s/\s\+$//e "delete blank 
command! -range=% Trh :<line1>,<line2>s/^\s\+//e "delete blank 
"command! Dbl g/^\s*$/d "delete blank line
command! Edq %s/\"/\\\"/g "escape double quote
command! -nargs=1 Lh %s/^\w\@=/<args>/g 
command! -nargs=1 Ll %s/$/<args>/g
command! -nargs=1 D %s/<args>//gcI
"command! -nargs=1 Db ,$s/<args>//gcI

vnoremap r :s///g<left><left><left>
nnoremap <leader>r :%s///gcI<left><left><left><left>
" replace current line
nnoremap <leader>l :s///gI<left><left><left>
" nnoremap <leader>n :%s///gn<CR>
" nnoremap R :R args 
" command! -nargs=+ R call R (<f-args>)
" function! R(arg0, ...)
"     let arg1 = get(a:, 1, 0)
"     let arg2 = get(a:, 2, 0)
"     if a:0 == 2
"         execute printf('%%substitute/%s/%s/gcI', arg1, arg2)
"     elseif a:0 == 1
"         execute printf('%%substitute//%s/gcI', arg1)
" 	else
"         execute printf('%%s///gcI')
"     endif
" endfunction

command! -nargs=+ Rb call Rb (<f-args>)
function! Rb(...)
    let arg1 = get(a:, 1, 0)
    let arg2 = get(a:, 2, 0)
    if a:0 == 2
        execute printf(',$substitute/%s/%s/gcI', arg1, arg2)
    else
        execute printf(',$substitute//%s/gcI', arg1)
    endif
endfunction

command! -nargs=+ Rbw call Rbw (<f-args>)
function! Rbw(...)
    let arg1 = get(a:, 1, 0)
    let arg2 = get(a:, 2, 0)
    if a:0 == 2
        execute printf(',$substitute/\<%s\>/%s/gcI', arg1, arg2)
    else
        execute printf(',$substitute//%s/gcI', arg1)
    endif
endfunction

command! -nargs=1 Rl s//<args>/gcI

command! -nargs=+ Rw call Rw (<f-args>)
function! Rw(...)
    let arg1 = get(a:, 1, 0)
    let arg2 = get(a:, 2, 0)
    if a:0 == 2
        execute printf('%%substitute/\<%s\>/%s/gcI', arg1, arg2)
    else
        execute printf('%%substitute//%s/gcI', arg1)
    endif
endfunction

command! -nargs=+ Dh call Dh(<f-args>)
function! Dh( ... )
	let arg1 = get(a:, 1, 0)
    let arg2 = get(a:, 2, 0)
    if a:0 == 2
		execute printf('%%substitute/.*%s/%s/g', a:1, a:2)
    else
	    execute printf('%%substitute/.*%s//g', a:1)
    endif
endfunction

command! -nargs=+ Dbw call Dbw(<f-args>)
function! Dbw( ... )
    let arg1 = get(a:, 1, 0)
    let arg2 = get(a:, 2, 0)
    if a:0 == 2
        execute printf('%%substitute/.*\<%s\>/%s/g', a:1, a:2)
    else
        execute printf('%%substitute/.*\<%s\>/%s/g', a:1, a:1)
    endif
endfunction

command! -nargs=+ Da call Da(<f-args>) 
function! Da( ... )
    let arg1 = get(a:, 1, 0)
    let arg2 = get(a:, 2, 0)
    if a:0 == 2
		execute printf('%%substitute/%s.*/%s/g', a:1, a:2)
    else
		execute printf('%%substitute/%s.*//g', a:1)
    endif	
endfunction

command! -nargs=+ Daw call Daw(<f-args>)
function! Daw( ... )
    let arg1 = get(a:, 1, 0)
    let arg2 = get(a:, 2, 0)
    if a:0 == 2
        execute printf('%%substitute/\<%s\>.*/%s/g', a:1, a:2)
    else
        execute printf('%%substitute/\<%s\>.*//g', a:1)
    endif
endfunction

command! -nargs=1 Fil v/.*<args>/d
command! -nargs=1 Filn g/.*<args>/d
command! -nargs=1 Filw v/.*\<<args>\>/d
command! -nargs=1 Filwn g/.*\<<args>\>/d

command! -nargs=1 Dg g/<args>/d
command! -nargs=1 Dv v/<args>/d

""""""""""Close Tabs
command! BufCurOnly silent! execute '%bd|e#|bd#'
function! OnlyAndNerdtree()
    let currentWindowID = win_getid()
    windo if win_getid() != currentWindowID && &filetype != 'nerdtree' | close | endif
endfunction
command! Only call OnlyAndNerdtree()
nnoremap <A-w> :BufCurOnly<cr>
" nnoremap <A-e> :Tcl<cr>
" nnoremap <A-q> :Tcr<cr>

function! TabCloseRight(bang)
    let cur=tabpagenr()
    while cur < tabpagenr('$')
        exe 'tabclose' . a:bang . ' ' . (cur + 1)
    endwhile
endfunction

function! TabCloseLeft(bang)
    while tabpagenr() > 1
        exe 'tabclose' . a:bang . ' 1'
    endwhile
endfunction

command! -bang Tcl call TabCloseRight('<bang>')
command! -bang Tcr call TabCloseLeft('<bang>')
nnoremap tci :Tcr<cr>
nnoremap tc; :Tcl<cr>


":tabm[ove] 0 => 將當前 tab 視窗順序移動到順序 0
"
":tabc[lose] => 關閉該 tab 視窗
":.+1,$tabdo :tabc
":.-1,0tabdo :tabc
":tabo[nly] => 關閉其它 tab 視窗
""""""""""

function! Cond(Cond, ...)
  let opts = get(a:000, 0, {})
  return a:Cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif
colorscheme onedark

""Auto-Complete
""inoremap {<CR> {<CR>}<Esc>ko
""inoremap [<CR> [<CR>]<Esc>ko
""inoremap (<CR> (<CR>)<Esc>ko

""inoremap " ""<Left>
""inoremap ( ()<Left>
""inoremap [ []<Left>
""inoremap { {}<Left>
""inoremap ' ''<Left>

""""""Netrw
" netrw magic
" enable mouse usage. makes it easier to browse multiple tabs
" hide netrw top message
"let g:netrw_banner=0
"" tree listing by default
"let g:netrw_liststyle=3
"" hide vim swap files
"let g:netrw_list_hide='.*\.swp$'
"" open files in left window by default
"let g:netrw_chgwin=3
"let g:netrw_browse_split = 3
"let g:netrw_winsize = 20
"let g:netrw_altv = 1
"let g:netrw_preview = 1
"let g:netrw_alto = 0

""nnoremap <silent> <C-e> :rightbelow 25vs<CR>:e .<CR>
""nnoremap <silent> <C-e> :abo 25vs<CR>:e .<CR>
" remap control-enter to open files in new tab
""nmap <silent> <C-CR> t :abo 25vs<CR>:e .<CR>:wincmd h<CR>
" the same remap as above - may be necessary in some distros
""nmap <silent> <NL> t :abo 25vs<CR>:e .<CR>:wincmd h<CR>
""another open
"nnoremap <C-n> :Lexplore %:p:h<CR>
nnoremap <Leader>e :Lexplore %:p:h<CR>
""nnoremap <Leader>e :Lexplore %:p:h<CR>

""autoopen
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
""augroup END

""Plugin
set runtimepath^=~/.vim/bundle/delimitMate
set runtimepath^=~/.vim/bundle/vim-commentary
set runtimepath^=~/.vim/bundle/vim-log-highlighting
set runtimepath^=~/.vim/bundle/vim-sneak
set runtimepath^=~/.vim/bundle/python-syntax
set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/rainbow-csv
set runtimepath^=~/.vim/bundle/vim-airline
set runtimepath^=~/.vim/bundle/vim-airline-themes
set runtimepath^=~/.vim/bundle/vim-nftables
set runtimepath^=~/.vim/bundle/nerdtree.vim

nnoremap <leader>e :NERDTreeToggle<CR>
tnoremap <C-@>e <C-@>:NERDTreeToggle<CR>
nnoremap <C-@>e :NERDTreeToggle<CR>
let NERDTreeMapOpenInTab='<ENTER>'
let g:NERDTreeMapActivateNode = 'l'
nmap <right> l
set pastetoggle=<F4>
" set runtimepath^=~/.vim/bundle/log-highlight.nvim

""Plugin_delimitMate
let g:delimitMate_expand_cr=1
let g:delimitMate_expand_space=1
let g:delimitMate_matchpairs='(:),{:},[:]'
" autocmd! FileType rs let b:delimitMate_matchpairs = '(:),{:},[:],":"'

"" plugin Commentary
xmap <C-_> <Plug>Commentary
imap <C-_> <C-o><Plug>CommentaryLine
nmap <C-_> <Plug>Commentary
omap <C-_> <Plug>Commentary
nmap <C-_> <Plug>CommentaryLine

let g:sneak#use_ic_scs = 1
nmap ' <Plug>Sneak_s
nmap " <Plug>Sneak_S
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F

let g:python_highlight_all = 1


"""Plugin_CtrlP
" set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.class 
set wildignore+=**/target/**
" set wildignore+=**/node_modules/**
" let g:ctrlp_extensions = ['buffertag']
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  'target',
"   \ 'file': '\v\.(exe|so|dll)$',
"   \ 'link': 'some_bad_symbolic_links',
"   \ }
" let g:ctrlp_prompt_mappings = {
"     \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
"     \ 'AcceptSelection("t")': ['<cr>'],
" 	\ 'AcceptSelection("h")': ['<a-x>', '<c-x>'],
" 	\ 'AcceptSelection("v")': ['<a-v>', '<c-v>', '<RightMouse>'],
"     \ }

" let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_open_multiple_files = 'tj'
"""

"" airline
let g:airline_theme = 'onedark'
" let g:airline_mode_map_codes = 0
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#tab_nr_type = 1
" Configure the minimum number of tabs needed to show the tabline
let g:airline#extensions#tabline#tab_min_count = 2
" Configure the minimum number of buffers needed to show the bufferline within the tabline
let g:airline#extensions#tabline#buffer_min_count = 2
" let g:airline#extensions#whitespace#mixed_indent_algo = 2
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#fnamemod = ':t'

" set laststatus=2
let g:airline#extensions#tabline#show_buffers = 0
" let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#formatter = 'unique_tail'

augroup HITABFILL
    autocmd!
    autocmd User AirlineAfterInit hi airline_tabfill ctermbg=NONE guibg=NONE
    autocmd User AirlineAfterInit hi airline_c  ctermbg=NONE guibg=NONE
augroup END


"TabLine only file name
" set showtabline=2
""""""""""""""" tabline
"set tabline=%!MyTabLine()
"function MyTabLine()
"  let s = '' " complete tabline goes here
"  " loop through each tab page
"  for t in range(tabpagenr('$'))
"    " select the highlighting for the buffer names
"    if t + 1 == tabpagenr()
"      let s .= '%#TabLineSel#'
"    else
"      let s .= '%#TabLine#'
"    endif
"    " empty space
"    let s .= ' '
"    " set the tab page number (for mouse clicks)
"    let s .= '%' . (t + 1) . 'T'
"    " set page number string
"    let s .= t + 1 . ' '
"    " get buffer names and statuses
"    let n = ''  "temp string for buffer names while we loop and check buftype
"    let m = 0 " &modified counter
"    let bc = len(tabpagebuflist(t + 1))  "counter to avoid last ' '
"    " loop through each buffer in a tab
"    for b in tabpagebuflist(t + 1)
"      " buffer types: quickfix gets a [Q], help gets [H]{base fname}
"      " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
"      if getbufvar( b, "&buftype" ) == 'help'
"        let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
"      elseif getbufvar( b, "&buftype" ) == 'quickfix'
"        let n .= '[Q]'
"      else
"        "let n .= pathshorten(bufname(b))
"        let n .= bufname(b)
"      endif
"      " check and ++ tab's &modified count
"      if getbufvar( b, "&modified" )
"        let m += 1
"      endif
"      " no final ' ' added...formatting looks better done later
"      if bc > 1
"        let n .= ' '
"      endif
"      let bc -= 1
"    endfor
"    " add modified label [n+] where n pages in tab are modified
"    if m > 0
"      "let s .= '[' . m . '+]'
"      let s.= '+ '
"    endif
"    " add buffer names
"    if n == ''
"      let s .= '[No Name]'
"    else
"      "let s .= n
"      let s .= fnamemodify(n, ":t") 
"    endif
"    " switch to no underlining and add final space to buffer list
"    "let s .= '%#TabLineSel#' . ' '
"    let s .= ' '
"  endfor
"  " after the last tab fill with TabLineFill and reset tab page nr
"  let s .= '%#TabLineFill#%T'
"  " right-align the label to close the current tab page
"  if tabpagenr('$') > 1
"    let s .= '%=%#TabLine#%999XX'
"  endif
"  return s
"endfunction

" java
ab sout System.out.println
ab psvm public static void main(String[] args)
ab pcl public class

" shortcut
command! Als tabe ~/.bashrc
command! Alsdir tabe ~/.dirrc

" selection count
set showcmd

nnoremap <C-h> <C-i>
nnoremap <C-l> <C-o>
nnoremap <C-j> ]c
nnoremap <C-k> [c
nnoremap <expr> <Down> &diff ? ']c' : '<down>'

" terminal
set shell=bash
set shellcmdflag=-c 
" set shellquote=\"
" set shellxquote=


" nnoremap <leader>s :term<CR>
nnoremap <silent> <leader>s :term<cr><C-@>:file <c-r>="bash".bufnr("%")<cr><cr>
" nnoremap <leader>v :vert term<cr>
nnoremap <silent> <leader>v :vert term<cr><C-@>:file <c-r>="bash".bufnr("%")<cr><cr>

nnoremap <leader>t :tab term<cr>
" nnoremap <C-q> :sb bash2<CR>
" tnoremap <expr> <C-q> bufname("%") == 'bash2' ? '<C-@>:hide<CR>' : '<C-@>:sb bash2<cr>'
" nnoremap <expr> <C-q> bufexists("bash2") == 1 ? ':sb bash2<CR>' : ':term<cr><C-@>:file bash2<cr><cr>'
" tnoremap <expr> <C-q> bufname("%") == 'bash2' ? '<C-@>:hide<CR>' : '<C-@>:sb bash2<cr>'
" nnoremap <expr> <C-q> bufexists("bash") == 1 ? ':sb bash \| 18wincmd _<CR>' : ':term ++rows=18<cr><C-@>:file bash<cr><cr>'
nnoremap <expr> <C-q> bufwinnr("bash") != -1 ? ':call win_gotoid(bufwinid("bash")) \| <C-@>:hide<cr>' : (bufexists("bash") == 1 ? ':bo sb bash \| 18wincmd _<CR>' : ':bo term ++rows=18<cr><C-@>:file bash<cr>')
tnoremap <expr> <C-q> bufname("%") == 'bash' ? '<C-@>:hide<CR>' : '<C-@>:bo sb bash<cr>'
" nnoremap <expr> <C-s> bufexists("!bash") == 1 ? ':vert sb !bash<cr>' : ':vert term<cr><C-@>:file "!bash"<cr><cr>'
" tnoremap <expr> <C-s> bufname("%") == '!bash' ? '<C-@>:hide<CR>' : '<C-@>:vert sb !bash<cr>'
" tnoremap <C-q> <C-@>:hide<CR>

tnoremap <C-@>m <C-@>:hide<CR>
tnoremap <C-@><C-m> <C-@>:hide<CR>

nnoremap <C-@><space> :<BS>
nnoremap <C-@><C-@> :<BS>

nmap <C-@> <C-w>

nnoremap <C-w>r <C-w>=
nnoremap <C-w><C-r> <C-w>=
nnoremap <C-w>m :hide<CR>
nnoremap <C-w><C-m> :hide<CR>

" nnoremap <c-w>; :vert sbnext<cr>
nnoremap <C-w>; :ls<cr>:vert sb
nnoremap <C-w>' :ls<cr>:sb
" tnoremap <C-@>' <C-@>:ls<cr>:sb
" nnoremap <C-s> :vert sbnext<cr>
" nnoremap <C-s> :vert sb bash<cr>
nnoremap <C-w>: :sbnext<cr>
nnoremap <C-w>v :vert term<cr>
nnoremap <C-w><C-v> :vert term<cr>
nnoremap <C-w>s :term<cr>
nnoremap <C-w><C-@> :term<cr>
nnoremap <C-w>w :tabclose<cr>

nnoremap <C-@>1 <C-w>:tabr<CR>
nnoremap <C-@>2 <C-w>2gt
nnoremap <C-@>3 <C-w>3gt
nnoremap <C-@>4 <C-w>4gt
nnoremap <C-@>5 <C-w>5gt
nnoremap <C-@>6 <C-w>6gt
nnoremap <C-@>7 <C-w>7gt
nnoremap <C-@>8 <C-w>8gt
nnoremap <C-@>9 <C-w>:tabl<CR>

nnoremap <C-@>d <C-w>T

nnoremap - 3<C-w><
nnoremap = 3<C-w>>
nnoremap + 3<C-w>+
nnoremap _ 3<C-w>-

nnoremap <C-up> <C-w>3+
nnoremap <C-down> <C-w>3-
nnoremap <C-left> <C-w>3<
nnoremap <C-right> <C-w>3>

nnoremap <C-w>] gt
nnoremap <C-w><C-]> gt
nnoremap <C-w>[ gT
nnoremap <C-w><C-[> gT

inoremap <C-\> \|\|<Left>

set termwinkey=<C-@>
tnoremap <C-j> <C-j>
tnoremap <C-j> <Down>
" tnoremap <Esc><Esc> <C-@>N
tnoremap <C-@>r <C-@>=
tnoremap <C-@><C-r> <C-@>=
" tnoremap <C-@>m <C-@>_
" tnoremap <C-@><C-m> <C-@>_
tnoremap <C-@>i <C-@>\|
tnoremap <C-@><C-i> <C-@>\|

tnoremap <C-up> <C-@>3+
tnoremap <C-down> <C-@>3-
tnoremap <C-left> <C-@>3<
tnoremap <C-right> <C-@>3>

execute "set <M-f>=\ef"
inoremap <M-f> <Esc>ea

execute "set <M-l>=\el"
inoremap <M-l> <S-Right>

execute "set <M-h>=\eh"
inoremap <M-h> <S-Left>

" tnoremap <C-@>s <C-@>:term<cr>
" tnoremap <C-@><C-s> <C-@>:term<cr>

tnoremap <silent> <C-@>s <C-@>:term<cr><C-@>:file <c-r>="bash".bufnr("%")<cr><cr>
tnoremap <silent> <C-@><C-s> <C-@>:term<cr><C-@>:file <c-r>="bash".bufnr("%")<cr><cr>

tnoremap <silent> <C-@>v <C-@>:vert term<cr><C-@>:file <c-r>="bash".bufnr("%")<cr><cr>
tnoremap <silent> <C-@><C-v> <C-@>:vert term<cr><C-@>:file <c-r>="bash".bufnr("%")<cr><cr>
tnoremap <silent> <C-@>n <C-@>:tab term<cr><C-@>:file <c-r>="bash".bufnr("%")<cr><cr>
tnoremap <silent> <C-@><C-n> <C-@>:tab term<cr><C-@>:file <c-r>="bash".bufnr("%")<cr><cr>
tnoremap <C-@>d <C-@>T
tnoremap <C-@>q <C-@>:q!<cr>
tnoremap <C-@><C-q> <C-@>:q!<cr>
tnoremap <C-@>z <C-@>:qa!<cr>
" tnoremap <C-@>c <C-@>:qa!<cr>
tnoremap <C-@><C-c> <C-@>:qa!<cr>

tnoremap <C-@>o <C-@>:ls<cr>:sb
tnoremap <C-@><C-o> <C-@>:ls<cr>:sb
" tnoremap <C-s> <C-@>:vert sb bash<cr>

" tnoremap <C-@>' <C-@>:sbnext<cr>
tnoremap <C-@>; <C-@>:ls<cr>:vert sb
tnoremap <C-@>' <C-@>:ls<cr>:sb

tnoremap <C-@>] <C-@>gt
tnoremap <C-@><C-]> <C-@>gt
tnoremap <C-@>[ <C-@>gT
tnoremap <C-@><C-[> <C-@>gT

tnoremap <C-@>1 <C-@>:tabr<CR>
tnoremap <C-@>2 <C-@>2gt
tnoremap <C-@>3 <C-@>3gt
tnoremap <C-@>4 <C-@>4gt
tnoremap <C-@>5 <C-@>5gt
tnoremap <C-@>6 <C-@>6gt
tnoremap <C-@>7 <C-@>7gt
tnoremap <C-@>8 <C-@>8gt
tnoremap <C-@>9 <C-@>:tabl<cr>
tnoremap <C-@>/ <C-@>N/
tnoremap <C-@>? <C-@>N?

tnoremap <C-@><BS> <C-@>N:<BS>i
nnoremap <C-@><BS> <C-@>N:<BS>i
tnoremap <C-@><space> <C-@>N
tnoremap <C-@><C-@> <C-@>N

tnoremap <C-@>p <C-@>""
tnoremap <C-@><c-p> <C-@>""

set ttimeoutlen=0

execute "set <M-f>=\ef"
inoremap <M-f> <Esc>ea

execute "set <M-l>=\el"
execute "set <M-h>=\eh"

" inoremap <M-l> <S-Right>
inoremap <M-l> <Esc>ea
inoremap <M-h> <S-Left>

tnoremap <M-l> <C-Right>
tnoremap <M-h> <C-Left>

nnoremap <M-h> :tabm -1 <CR>
nnoremap <M-l> :tabm +1 <CR>

execute "set <M-e>=\ee"
tnoremap <M-e> <C-@>:NERDTreeToggle<CR>
nnoremap <M-e> :NERDTreeToggle<CR>
inoremap <M-e> <C-o>:NERDTreeToggle<CR>

execute "set <M-q>=\eq"
nnoremap <expr> <M-q> bufwinnr("bash") != -1 ? ':call win_gotoid(bufwinid("bash")) \| <C-@>:hide<cr>' : (bufexists("bash") == 1 ? ':bo sb bash \| 18wincmd _<CR>' : ':term ++rows=18<cr><C-@>:file bash<cr>')
inoremap <expr> <M-q> bufwinnr("bash") != -1 ? '<C-q>:call win_gotoid(bufwinid("bash")) \| <C-@>:hide<cr>' : (bufexists("bash") == 1 ? ':bo sb bash \| 18wincmd _<CR>' : '<C-o>:term ++rows=18<cr><C-@>:file bash<cr>')
tnoremap <expr> <M-q> bufname("%") == 'bash' ? '<C-@>:hide<CR>' : '<C-@>:bo sb bash<cr>'

nnoremap th :tabm -1 <CR>
nnoremap tl :tabm +1 <CR>

set fillchars+=vert:\▏
set fillchars+=eob:\ 


""""""" auto quit terminal
autocmd QuitPre * call <sid>TermForceCloseAll()
function! s:TermForceCloseAll() abort
  let term_bufs = filter(range(1, bufnr('$')), 'getbufvar(v:val, "&buftype") == "terminal"')
  for t in term_bufs
    execute "bd! " t
  endfor
endfunction

" nnoremap [D <C-w>h
" nnoremap [C <C-w>l
" nnoremap [A <C-w>k
" nnoremap [B <C-w>j

" inoremap [D <C-o><C-w>h
" inoremap [C <C-o><C-w>l
" inoremap [A <C-o><C-w>k
" inoremap [B <C-o><C-w>j


" tnoremap [D <C-@>h
" tnoremap [C <C-@>l
" tnoremap [A <C-@>k
" tnoremap [B <C-@>j

