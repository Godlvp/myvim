"basic
syntax enable
set nocompatible
set backspace=2
set directory-=.
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set expandtab
"set list
"set listchars=tab:▸\ ,eol:¬
set autoindent
set cindent
set smartindent      
"for C/C++
"set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s)}   
set number
set showmatch
set mouse=a
set ruler
set showcmd
set incsearch
set sidescroll=1
set whichwrap=b,s,<,>,[,]
set foldmethod=marker

"set fileformats=unix,dos
" keyboard shortcuts
inoremap jj <ESC>

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

"install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
	source ~/.vimrc.bundles
endif

call vundle#end()
filetype plugin indent on

"autocmd FileType python set omnifunc=pythoncomplete#Complete 

"molokai
let g:molokai_original = 1

"solarized
set t_Co=16
set background=dark
"let g:solarized_termtrans = 1
colorscheme solarized

"ultisnips
let g:UltiSnipsSnippetDirectories=['UltiSnips']
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsListSnippets = '<C-Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

"airline
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

if exists('$TMUX')
	set term=screen
endif
set t_Co=256
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
" separator
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" tabline show number of buffers
let g:airline#extensions#tabline#buffer_nr_show = 1
" change buffer
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>

"taglist
"location of ctags
"let Tlist_Ctags_Cmd = '/usr/bin/ctags'
"let Tlist_Show_One_File = 1
"let Tlist_Exit_OnlyWindow = 1
"let Tlist_Use_Right_Window = 1
"let Tlist_GainFocus_On_ToggleOpen = 1

"markdown-mode
let g:vim_markdown_folding_disabled=1

"nerdtree
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '.pyc$', '.pyo$', '.obj$', '.o$', '.so$', '.egg$', '^.git$', '^.svn$', '^.hg$' ]
let g:netrw_home='~/bak'
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTreeType') && b:NERDTreeType == 'primary') | q | end

"tagbar
"let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_width=30
let g:tagbar_autofocus = 1

"ctags
set tags=tags;
"set tags+=~/code/python/tags
"set tags+=~/.vim/tags/systags
set tags+=~/.vim/tags/python.tags
set autochdir
" update current folder tags by tg 
"nmap tg :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q *<CR>:set tags+=./tags<CR>

"python syntax highlight
let python_highlight_all = 1

"syntastic
let g:syntastic_error_symbol = '?'  "set error or warning signs
let g:syntastic_warning_symbol = '?'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
"let g:syntastic_python_checker='flake8,pyflakes,pep8,pylint'
"let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_python_checkers=['flake8']
"highlight SyntasticErrorSign guifg=white guibg=black

let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
let g:syntastic_enable_balloons = 1 "whether to show balloons

"multiple cursors
let g:multi_cursor_use_default_mapping=0
"Default mapping
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"delimitmate for python
au FileType python let b:delimitMate_nesting_quotes = ['''']

"rainbow
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
"always on rainbow
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"pymode 
let g:pymode_rope = 0 
let g:pymode = 1
"keymap
let mapleader = ','
nnoremap <leader>d :NERDTreeToggle<CR>
"nnoremap <leader>[ :TlistToggle<CR>
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>] :TagbarToggle<CR>
nnoremap <leader>us :UltiSnipsEdit<CR>

