""Felipe Garay vim conf file""

"Queremos usar Vim
set nocompatible

syntax enable

set smartindent

"Que nos muestre el comando que estamos escribiendo
set showcmd

set background=dark

set hlsearch

"para que lo guarde antes de hacer make, entre otras cosas
set autowrite

"Formato Unix siempre
set fileformat=unix

"Sin beeps en los errores
set noerrorbells

"cuando cambiamos de buffer nos deja cambiar sin guardar
set hidden

"Muestra puntos si la linea no cabe en la ventana
set wrap linebreak showbreak=...

"Muestra la posicion del cursor en la parte inferior
set ruler


"Opciones de GVIM
set guioptions= "sacamos toda la gui, no quiero ningun menu
set guioptions-=L

" Always show line numbers, but only in current window.
"set number
":au WinEnter * :setlocal number
":au WinLeave * :setlocal nonumber


"Tratamos de mantener 80 caracteres maximo
set textwidth=80


"{{{En la gui usamos zenburn, en la terminal el por defecto no mas
if has("gui_running")
	colorscheme zenburn
else
	set background=dark
	colorscheme default
endif
"}}}


filetype plugin on
filetype indent on
set ofu=syntaxcomplete#Complete

"{{{ Maps

"Para tener resize con + y - con ventanas horizontales
if bufwinnr(1)
	nmap + <C-W>+
	nmap - <C-W>-
endif
"resize con + y - con ventanas verticales
"if bufwinnr(1)
"	map - <C-W><C-W>
"	map + <S-C-W><S-C-W>
"endif

nnoremap <F1> :NERDTree<CR>
nnoremap <F2> :copen<CR>
nnoremap <F3> :GundoToggle<CR>
nnoremap <F4> :TagbarOpen<CR>

"acciones con los buffers
nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <F6> :buffers<CR>:vert sb <Space>
nnoremap <F7> :buffers<CR>:to sb <Space>

"Para movernos por los errores
nnoremap <F10> :cp<CR>
nnoremap <F11> :cn<CR>

"Alt keys: Activa o desactiva ciertas funcionalidades
nnoremap <A-n> :setlocal number!<CR>
nnoremap <A-s> :setlocal spell! spelllang=es<CR>
nnoremap <A-c> :close<CR>


"pone en la linea de comando para editar un archivo en el directorio del arhivo
"actual
nnoremap <Leader>nf :e %h:p/

"Cambiamos de tabs al igual que en 
nmap gt :tabn<CR>
nmap gT :tabp<CR>

imap jk <Esc> 

"}}}

set laststatus=2

"Buscar ctags
set tags=tags;/


"Scons Files
autocmd BufReadPre,BufNewFile SConstruct set filetype=python
autocmd BufReadPre,BufNewFile SConscript set filetype=python

"scons como make
set makeprg=scons

"sudo en el archivo que estamos editando con :W
:command! W w !sudo tee % > /dev/null


"{{{ Archivos de vim
set backup " backups are nice ...
set backupdir=$HOME/.vim/backup// " but not when they clog .
set directory=$HOME/.vim/swap// " Same for swap files
set viewdir=$HOME/.vim/views// " same for view files
"}}}

""STATUSLINE
set statusline=


"{{{ persistent undo
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
"}}}




"{{{ Opciones plugins
"patogen
call pathogen#infect() 

"nerdtree
let NERDTreeIgnore=['\~$', '\.pyc$', '\.o$', '\.out$', '\.hi$'] "Procesos de compilacion
let NERDTreeIgnore+=['\.png$', '\.jpg$', '\.gif$']  "Imagenes
let NERDTreeIgnore+=['\.pid$', '__.py$', 'tags'] "otros

"LaTexSuite alias Vim-LaTeX
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule_pdf='evince'
let g:tex_flavor='latex'
set grepprg=grep\ -nH\ $*
"}}}