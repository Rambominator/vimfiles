if has('vim_starting')
    set encoding=utf-8
    scriptencoding utf-8

    if !has('nvim')
        set nocompatible
    endif

    let s:is_windows = has('win16') || has('win32') || has('win64')
    let s:is_cygwin = has('win32unix')
    function! IsWindows()
        return s:is_windows
    endfunction
    function! IsMac()
        return !s:is_windows && !s:is_cygwin
            \ && (has('mac') || has('macunix') || has('gui_macvim') ||
            \ (!executable('xdg-open') &&
            \ system('uname') =~? '^darwin'))
    endfunction
    function! IsLinux()
        return !IsWindows() && !IsMac()
    endfunction
    function! IsPutty()
        return !empty($PUTTY)
    endfunction

    if IsWindows()
        let $VIMHOME = $HOME.'/vimfiles'
    else
        let $VIMHOME = $HOME.'/.vim'
    endif

    set runtimepath+=$VIMHOME/bundle/neobundle.vim/
endif

call neobundle#begin($VIMHOME.'/bundle/')

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
\    'build': {
\        'windows' : 'tools\\update-dll-mingw',
\        'unix': 'make -f make_unix.mak',
\        'mac': 'make -f make_mac.mak',
\    },
\ }

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'bling/vim-airline'
NeoBundle 'ludovicchabant/vim-lawrencium'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'embear/vim-localvimrc'
NeoBundle 'gorkunov/smartpairs.vim'
NeoBundle 'xaviershay/tslime.vim'
NeoBundle 'vim-scripts/matchit.zip'
NeoBundle 'bkad/CamelCaseMotion'
NeoBundle 'jmcomets/vim-pony'
NeoBundle 'pearofducks/ansible-vim'
NeoBundle 'morhetz/gruvbox'

NeoBundleLazy 'tpope/vim-repeat', {
            \    'autoload': {
            \       'mappings': '.'
            \    }
            \ }
NeoBundleLazy 'tpope/vim-fireplace', {
            \    'autoload': {
            \       'filetypes': ['clojure']
            \    }
            \ }
NeoBundleLazy 'vim-scripts/paredit.vim', {
            \    'autoload': {
            \       'filetypes': ['clojure']
            \    }
            \ }
NeoBundleLazy 'tpope/vim-jdaddy', {
            \    'autoload': {
            \       'filetypes': ['json', 'python'],
            \       'filename_patterns': ['\.json$', '\.py$']
            \    }
            \ }
NeoBundleLazy 'AndrewRadev/splitjoin.vim', {
            \    'autoload': {
            \        'mappings': [['nxo', 'gS', 'gJ']]
            \    }
            \ }
NeoBundleLazy 'justinmk/vim-sneak', {
            \    'autoload': {
            \        'mappings': [['nxo', 's']]
            \    }
            \ }
NeoBundleLazy 'Shougo/unite.vim', {
            \ 'commands' : [{ 'name' : 'Unite',
            \                 'complete' : 'customlist,unite#complete_source' }],
            \ 'depends' : 'Shougo/neomru.vim',
            \ }
NeoBundleLazy 'Shougo/neomru.vim'
NeoBundleLazy 'Shougo/neosnippet', {
            \    'autoload': {
            \        'depends' : ['Shougo/neosnippet-snippets'],
            \        'insert': 1,
            \        'filetypes': 'snippet',
            \        'unite_sources': [
            \           'snippet',
            \           'neosnippet/user',
            \           'neosnippet/runtime'
            \       ],
            \    }
            \ }
NeoBundleLazy 'Shougo/echodoc', {
            \    'autoload': {
            \        'insert': 1
            \    }
            \ }
NeoBundleLazy 'Shougo/unite-help'
NeoBundleLazy 'tsukkee/unite-tag'
NeoBundleLazy 'Shougo/neocomplete', {
            \    'autoload': {
            \        'insert': 1
            \    }
            \ }
NeoBundleLazy 'rking/ag.vim', {
            \    'autoload': {
            \       'commands': ['Ag', 'AgAdd', 'AgFromSearch']
            \    }
            \ }
NeoBundleLazy 'mitsuhiko/vim-python-combined', {
            \    'autoload': {
            \       'filetypes': 'python'
            \    }
            \ }
NeoBundleLazy 'fatih/vim-go', {
            \    'autoload': {
            \       'filetypes': 'go'
            \    }
            \ }
NeoBundleLazy 'hail2u/vim-css3-syntax', {
            \    'autoload': {
            \       'filetypes': ['css', 'scss', 'html', 'htmldjango']
            \    }
            \ }
NeoBundleLazy 'thinca/vim-qfreplace', {
            \    'autoload': {
            \        'commands': ['Qfreplace']
            \    }
            \ }
NeoBundleLazy 'thinca/vim-quickrun', {
            \    'autoload': {
            \        'commands': ['QuickRun'],
            \        'mappings' : '<Plug>(quickrun)',
            \    }
            \ }
NeoBundleLazy 'thinca/vim-unite-history'
NeoBundleLazy 'ujihisa/unite-colorscheme'
NeoBundleLazy 'gregsexton/MatchTag', {
            \    'autoload': {
            \        'filetypes': ['html', 'xml', 'htmldjango']
            \    }
            \ }
NeoBundleLazy 'mbbill/undotree', {
            \    'autoload': {
            \        'commands': ['UndotreeToggle']
            \    }
            \ }
NeoBundleLazy 'majutsushi/tagbar', {
            \    'autoload': {
            \        'commands': ['TagbarToggle']
            \    }
            \ }
NeoBundleLazy 'kana/vim-niceblock', {
            \    'autoload': {
            \       'mappings': '<Plug>'
            \    }
            \ }
NeoBundleLazy 't9md/vim-quickhl', {
            \    'autoload': {
            \        'mappings' : '<Plug>',
            \    }
            \ }
NeoBundleLazy 'eagletmt/ghcmod-vim', {
            \    'autoload': {
            \       'filetypes': 'haskell'
            \    }
            \ }
NeoBundleLazy 'eagletmt/neco-ghc', {
            \    'autoload': {
            \       'filetypes': 'haskell'
            \    }
            \ }
NeoBundleLazy 'rstacruz/sparkup', {
            \    'rtp': 'vim',
            \    'autoload': {
            \        'filetypes': ['html', 'xml', 'htmldjango']
            \    }
            \ }
NeoBundleLazy 'ryanss/vim-hackernews', {
            \    'commands': ['HackerNews']
            \ }
NeoBundleLazy 'pangloss/vim-javascript', {
            \   'build': {
            \       'unix': 'cp ftdetect/* ~/.vim/ftdetect/'
            \   },
            \   'autoload': {
            \       'filetypes': 'javascript',
            \       'filename_patterns': '\.js$'
            \   }
            \ }
NeoBundleLazy 'elzr/vim-json', {
            \   'build': {
            \       'unix': 'cp ftdetect/* ~/.vim/ftdetect/'
            \   },
            \   'autoload': {
            \       'filetypes': 'json',
            \       'filename_patterns': '\.json$'
            \   }
            \ }
NeoBundleLazy 'wting/rust.vim', {
            \   'build': {
            \       'unix': 'cp ftdetect/* ~/.vim/ftdetect/'
            \   },
            \   'autoload': {
            \       'filetypes': 'rust',
            \       'filename_patterns': '\.rs$'
            \   }
            \ }
NeoBundleLazy 'derekwyatt/vim-scala', {
            \   'build': {
            \       'unix': 'cp ftdetect/* ~/.vim/ftdetect/'
            \   },
            \    'autoload': {
            \       'filetypes': 'scala',
            \       'filename_patterns': '\.scala$'
            \    }
            \ }


call neobundle#end()

filetype plugin indent on

NeoBundleCheck


" reset my autocmd group
augroup MyAutoCmd
    autocmd!
augroup END



"* * * * * * * * * * * * * * * * * SETUP * * * * * * * * * * * * * * * * * * *
" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *


" turn on syntax highlighting
syntax on

" allow backspacing over everything in INS mode
set backspace=indent,eol,start

" store lots of :cmdline history
set history=1000

" show incomplete cmds down the bottom
set showcmd

" show current mode down the bottom
set showmode

" add line numbers
set number

" start wrapped lines with the string
if IsWindows() || IsPutty()
    set showbreak=...
else
    set showbreak=↪..
endif

" wrap lines
set wrap

" don't break words
set linebreak

" listchars
set list listchars=tab:»·

" add some line space for easy reading
set linespace=4

" disable visual bell
if !has('nvim')
    set visualbell t_vb=
endif

" always show statusline
set laststatus=2

" hide buffers when not displayed
set hidden

" remap leader
let g:mapleader = "\<Space>"
nnoremap <Space> <Nop>

" russian keymap
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" turn off needless toolbar on gvim/mvim
set guioptions-=T
set guioptions-=m
" off scrollbar
set guioptions-=rL
" no guitablabel
set guioptions-=e
set guioptions+=c


" indent settings
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab
set autoindent
set smartindent

" fold based on indent
set foldmethod=indent

" deepest fold is 3 levels
set foldnestmax=3

" dont fold by default
set nofoldenable

" make cmdline tab completion similar to bash
set wildmode=list:longest

" enable ctrl-n and ctrl-p to scroll thru matches
set wildmenu
set wildignore=*.aux,*.log,*.class,*.o,*.obj,*~,.git,*.pyc

" don't continue comments when pushing o/O
set formatoptions-=o

" vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

" some stuff to get the mouse going in term
set mouse=a
if !has('nvim')
    set ttymouse=xterm2
endif

" backup
set nobackup
set nowritebackup
set noswapfile
set backupdir-=.
set autowrite

if has('nvim')
    set viminfo+=n$VIMHOME/.viminfo.shada
else
    set viminfo+=n$VIMHOME/.viminfo
endif

" store undo
if has('persistent_undo')
    set undodir=$VIMHOME/undo,.
    set undofile
endif

" split to right
set splitright
set splitbelow

" reload when files modified outside of vim
set autoread

" fast terminal connection
if !has('nvim')
    set ttyfast
endif

" yank use system clipboard
set clipboard=unnamed

" ignore case only if contains upper case
set ignorecase
set smartcase

" incremental search
set incsearch

" match highlight
set hlsearch

" search from the top at the end
set wrapscan

" don't redraw while macro execution
set lazyredraw

" toggle paste
set pastetoggle=<F2>

" for echodoc
set noshowmode
set completeopt+=menuone
set completeopt-=preview

let g:netrw_liststyle=3

if has('gui_running')
    if IsWindows()
        set guifont=Consolas:h12:cRUSSIAN
    else
        set guifont=Consolas\ 12
    endif
    set langmenu=en_US.UTF-8
else
    if !has('nvim')
        set t_Co=16
    endif
endif

" theme
if IsLinux()
    let g:base16colorspace=256
endif

if filereadable($HOME.'/.vimrc.local')
    source $HOME/.vimrc.local
else
    if IsWindows()
        if has('gui_running')
            colorscheme base16-default
        else
            colorscheme solarized
        endif
    else
        colorscheme base16-default
    endif
    set background=dark
end

set colorcolumn=80

" encoding
if !has('gui_running')
    if IsWindows()
        set termencoding=cp1251
    else
        set termencoding=
    endif
endif



"* * * * * * * * * * * * * * * * * MAPPING * * * * * * * * * * * * * * * * * *
" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

" n always search forward and N backward
nnoremap <expr> n  'Nn'[v:searchforward].'zvzz'
nnoremap <expr> N  'nN'[v:searchforward].'zvzz'

" move current line above or below
noremap <Leader>k  :<c-u>execute 'move -1-'. v:count1<cr>
noremap <Leader>j  :<c-u>execute 'move +'. v:count1<cr>

" edit vimrc
nnoremap <Leader>ev :<C-u>edit $MYVIMRC<CR>

" toggle paste
nmap <F2> :set invpaste paste?<CR>

" switch between two files
map <Leader><Leader> <C-^>

" use arrow keys for windows size change
map <Up> <C-W>+
map <Down> <C-W>-
map <Left> <C-W><
map <Right> <C-W>>

" make <c-m> clear the highlight as well as redraw
nmap <leader>m :nohls<CR>

" map Q to something useful
map Q gq

command! -bang Q q<bang>
command! -bang QA q<bang>
command! -bang Qa q<bang>

" make Y consistent with C and D
nmap Y y$

" key mapping for window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" key mapping for saving file
nmap <C-s> :w<CR>

" write with sudo
cmap w!! %!sudo tee > /dev/null %

" remove trailing whitespace
nmap <leader>t :%s/\s\+$<CR>

" indent
nmap < <<
nmap > >>
xmap < <gV
xmap > >gV

" use sane regexes
nmap / /\v
vmap / /\v

" reselect pasted text
nmap <Leader>v V`]

" replace multiple
nmap <Leader>r cgn

" replace selected text
vnoremap <Leader>p "_dP

" move selected lines
vnoremap <C-j> :m'>+<CR>gv=gv
vnoremap <C-k> :m-2<CR>gv=gv
vnoremap <C-h> <gv
vnoremap <C-l> >gv

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>

command! CountSearch execute '%s///gn'
command! CopyFilename execute 'let @+=expand("%:t")'
command! CopyFilepath execute 'let @+=expand("%:p")'
command! -range ApplyQMacros execute '<line1>,<line2>normal! @q'


"* * * * * * * * * * * * * * * * * PLUGINS * * * * * * * * * * * * * * * * * *
" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

"localvimrc
if neobundle#tap('vim-localvimrc')
    let g:localvimrc_persistent = 1

    call neobundle#untap()
endif

"YouCompleteMe
if neobundle#tap('YouCompleteMe')
    if (IsMac())
        let g:ycm_path_to_python_interpreter = '/usr/local/bin/python'
    endif

    call neobundle#untap()
endif


" signify
"==============================================================================
if neobundle#tap('vim-signify')
    let g:signify_vcs_list = [ 'git', 'hg' ]
    let g:signify_sign_change = '~'
    let g:signify_disable_by_default = 1

    call neobundle#untap()
endif


" CamelCaseMotion
"==============================================================================
if neobundle#tap('CamelCaseMotion')
    nmap <silent> W <Plug>CamelCaseMotion_w
    xmap <silent> W <Plug>CamelCaseMotion_w
    omap <silent> W <Plug>CamelCaseMotion_w
    nmap <silent> B <Plug>CamelCaseMotion_b
    xmap <silent> B <Plug>CamelCaseMotion_b
    omap <silent> B <Plug>CamelCaseMotion_b

    call neobundle#untap()
endif


" vim-javascript
"==============================================================================
if neobundle#tap('vim-javascript')
    let g:javascript_enable_domhtmlcss = 1
    let g:javascript_conceal = 1

    call neobundle#untap()
endif


" NERDTree
"==============================================================================
if neobundle#tap('nerdtree')
    silent! nmap <silent> <leader>p :NERDTreeToggle<CR>
    nmap <silent> <C-f> :NERDTreeFind<CR>
    let NERDTreeIgnore = ['\.pyc$']

    call neobundle#untap()
endif


" NERDCommenter
"==============================================================================
if neobundle#tap('nerdcommenter')
    map <Space>/ <Plug>NERDCommenterToggle

    call neobundle#untap()
endif


" vim-niceblock
"==============================================================================
if neobundle#tap('vim-niceblock')
    xmap I <Plug>(niceblock-I)
    xmap A <Plug>(niceblock-A)

    call neobundle#untap()
endif


" tagbar
"==============================================================================
if neobundle#tap('tagbar')
    let g:tagbar_autoclose = 1

    nmap <silent> <F9> :TagbarToggle<CR>

    call neobundle#untap()
endif


" airline
"==============================================================================
if neobundle#tap('vim-airline')
    let g:airline_theme = 'base16'
    let g:airline_detect_paste = 1
    let g:airline#extensions#branch#enabled = 1
    let g:airline#extensions#syntastic#enabled = 1

    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    if !(IsWindows() || IsPutty())
        "let g:airline_left_sep = '▶'
        "let g:airline_right_sep = '◀'
        let g:airline_symbols.linenr = '␤'
        let g:airline_symbols.branch = '⎇'
        let g:airline_symbols.paste = 'Þ'
    endif

    call neobundle#untap()
endif


" syntastic
"==============================================================================
if neobundle#tap('syntastic')
    let g:syntastic_enable_signs = 1
    let g:syntastic_check_on_open = 1
    if !IsWindows()
        let g:syntastic_error_symbol = '✗'
        let g:syntastic_style_error_symbol = '✗'
        let g:syntastic_warning_symbol = '⚠'
        let g:syntastic_style_warning_symbol = '⚠'
    endif
    let g:syntastic_javascript_checkers = ['eslint']
    let g:syntastic_python_checkers = ['flake8']

    call neobundle#untap()
endif


" fugitive
"==============================================================================
if neobundle#tap('vim-fugitive')
    " auto-clean fugitive buffer
    autocmd MyAutoCmd BufReadPost fugitive://* set bufhidden=delete
    command! -bang -nargs=+ Sgrep execute 'silent Ggrep<bang> <args>' | copen


    call neobundle#untap()
endif


" delimitMate
"==============================================================================
if neobundle#tap('delimitMate')
    "<CR> remaped for neocomplete, don't forget add delimitMateCr
    let g:delimitMate_expand_cr = 1
    let g:delimitMate_expand_space = 1

    call neobundle#untap()
endif


" vim-quickrun
"==============================================================================
if neobundle#tap('vim-quickrun')
    let g:quickrun_no_default_key_mappings = 1

    map <F5> <Plug>(quickrun)

    call neobundle#untap()
endif


" vim-quickhl
"==============================================================================
if neobundle#tap('vim-quickhl')
    nmap <Leader>1 <Plug>(quickhl-manual-this)
    xmap <Leader>1 <Plug>(quickhl-manual-this)
    nmap <Leader>0 <Plug>(quickhl-manual-reset)
    xmap <Leader>0 <Plug>(quickhl-manual-reset)
    nmap <Leader>2 <Plug>(quickhl-cword-toggle)

    call neobundle#untap()
endif


" echodoc
"==============================================================================
if neobundle#tap('echodoc')

    let g:echodoc_enable_at_startup = 1

    call neobundle#untap()
endif


" neosnippet
"==============================================================================
if neobundle#tap('neosnippet')

    function! neobundle#tapped.hooks.on_source(bundle)
        let g:neosnippet#enable_snipmate_compatibility = 1
        let g:neosnippet#snippets_directory = $VIMHOME.'/snippets'
        xmap <Leader>s     <Plug>(neosnippet_expand_target)

        imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                    \ "\<Plug>(neosnippet_expand_or_jump)"
                    \: pumvisible() ? "\<C-n>" : "\<TAB>"
        smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                    \ "\<Plug>(neosnippet_expand_or_jump)"
                    \: "\<TAB>""
    endfunction
    call neobundle#untap()
endif


" neocomplete
"==============================================================================
if neobundle#tap('neocomplete')

    let g:neocomplete#enable_at_startup = 1
    " use smartcase
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#enable_camel_case = 1
    " minimum syntax keyword length
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    " Set auto completion length.
    let g:neocomplete#auto_completion_start_length = 2
    " Set minimum keyword length.
    let g:neocomplete#min_keyword_length = 3

    "imap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    imap <expr> <CR> pumvisible() ? neocomplete#close_popup() . "\<CR>"
                \: '<Plug>delimitMateCR'

    call neobundle#untap()
endif


" ctrlp
"==============================================================================
if neobundle#tap('ctrlp.vim')
    let g:ctrlp_custom_ignore = {
    \    'dir': '\v[\/](\.git|\.hg|\.svn|target|node_modules|bower_components)$',
    \    'file': '\v\.(exe|so|dll|class|aux|log|jar)$',
    \ }

    call neobundle#untap()
endif


" unite
"==============================================================================
if neobundle#tap('unite.vim')
    if executable('ag')
        let g:unite_source_grep_command='ag'
        let g:unite_source_grep_default_opts =
            \ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
            \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
        let g:unite_source_grep_recursive_opt=''
    elseif executable('ack')
        let g:unite_source_grep_command='ack'
        let g:unite_source_grep_default_opts='--no-heading --no-color -a'
        let g:unite_source_grep_recursive_opt=''
    endif

    let g:unite_source_history_yank_enable = 1
    let g:unite_source_menu_menus = {}
    let g:unite_source_menu_menus.shortcut = {
    \   'description': 'Shortcuts'
    \ }

    let g:unite_source_menu_menus.shortcut.candidates = {
    \   'mru'             : 'Unite file_mru',
    \   'file_rec/async'  : 'Unite file_rec/async',
    \   'find'            : 'Unite find',
    \   'grep'            : 'Unite grep',
    \   'register'        : 'Unite register',
    \   'bookmark'        : 'Unite bookmark',
    \   'output'          : 'Unite output',
    \   'mapping'         : 'Unite mapping',
    \   'help'            : 'Unite help',
    \   'history/command' : 'Unite history/command',
    \   'history/yank'    : 'Unite history/yank',
    \   'tag'             : 'Unite tag'
    \ }

    function g:unite_source_menu_menus.shortcut.map(key, value)
        return {
        \   'word' : a:key, 'kind' : 'command',
        \   'action__command' : a:value,
        \ }
    endfunction

    function! neobundle#tapped.hooks.on_source(bundle)
        call unite#custom#source(
            \ 'buffer,file_rec,file_rec/async,file_rec/git', 'matchers',
            \ ['converter_relative_word', 'matcher_fuzzy'])
        call unite#custom#source(
            \ 'file_mru', 'matchers',
            \ ['matcher_project_files', 'matcher_fuzzy',
            \  'matcher_hide_hidden_files', 'matcher_hide_current_file'])
        call unite#custom#source(
            \ 'file_rec,file_rec/async,file_rec/git,file_mru', 'converters',
            \ ['converter_file_directory'])
        call unite#filters#sorter_default#use(['sorter_rank'])
        call unite#custom#profile('default', 'context', {
        \   'marked_icon': '»',
        \   'candidate_icon': '›'
        \ })
    endfunction

    nmap <Leader>b :Unite buffer<cr>
    nmap <Leader>h :Unite history/yank<cr>
    nmap <Leader>a :UniteWithCursorWord -auto-preview -vertical-preview grep<cr><cr>
    nmap <Leader>s :Unite menu:shortcut -start-insert<cr>
    nmap <Leader>l :Unite file_mru<CR>

    call neobundle#untap()
endif


" sneak
" =============================================================================
if neobundle#tap('vim-sneak')
    let g:sneak#s_next = 1
    let g:sneak#streak = 1

    call neobundle#untap()
endif


" indentline
"==============================================================================
if neobundle#tap('indentLine')
    if IsWindows() || IsPutty()
        let g:indentLine_char = '|'
    else
        let g:indentLine_char = '┊'
    endif
    let g:indentLine_color_term = 8
    let g:indentLine_noConcealCursor=""
    let g:indentLine_faster = 1

    call neobundle#untap()
endif


" localvimrc
"==============================================================================
if neobundle#tap('vim-localvimrc')
    let g:localvimrc_sandbox = 0

    call neobundle#untap()
endif

"* * * * * * * * * * * * * * * * * EXTRA * * * * * * * * * * * * * * * * * * *
" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

" filetype specific settings
" (don't use after/ftplugin because localvimrc won't override it)
autocmd MyAutoCmd FileType html setlocal ts=2 sw=2 sta et sts=2 ai
autocmd MyAutoCmd FileType javascript setlocal ts=2 sw=2 sta et sts=2 ai colorcolumn=110

" cuda
autocmd MyAutoCmd BufRead,BufNewFile *.cuh set ft=cuda

" freemarker
autocmd MyAutoCmd BufRead,BufNewFile *.ftl set ft=html

if has('gui_running')
    autocmd MyAutoCmd BufNewFile,BufRead * call Highlight_remove_attr('bold')
endif

" save on focus lost (gui only)
autocmd MyAutoCmd FocusLost * :silent! wall

" don't show trailing spaces in insert mode
autocmd MyAutoCmd InsertEnter * :set listchars-=trail:·
autocmd MyAutoCmd InsertLeave * :set listchars+=trail:·


" Reload .vimrc automatically.
autocmd MyAutoCmd BufWritePost .vimrc,vimrc
    \ NeoBundleClearCache | source $MYVIMRC | redraw | call GuiNoBold()


" jump to last cursor position when opening a file
" don't do it when writing a commit log entry
autocmd MyAutoCmd BufReadPost * call SetCursorPosition()

function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

function! BreakpointToggle(lnum, cmd)
    let line = getline(a:lnum)
    let plnum = prevnonblank(a:lnum)
    call append(line('.')-1, repeat(' ', indent(plnum)).a:cmd)
    normal k
    if &modifiable && &modified | write | endif
endfunction

function! GuiNoBold()
    if has('gui_running')
        call Highlight_remove_attr('bold')
    endif
endfunction

function! Highlight_remove_attr(attr)
    " save selection registers
    new
    silent! put

    " get current highlight configuration
    redir @x
    silent! highlight
    redir END
    " open temp buffer
    new
    " paste in
    silent! put x

    " convert to vim syntax (from Mkcolorscheme.vim,
    "   http://vim.sourceforge.net/scripts/script.php?script_id=85)
    " delete empty,"links" and "cleared" lines
    silent! g/^$\| links \| cleared/d
    " join any lines wrapped by the highlight command output
    silent! %s/\n \+/ /
    " remove the xxx's
    silent! %s/ xxx / /
    " add highlight commands
    silent! %s/^/highlight /
    " protect spaces in some font names
    silent! %s/font=\(.*\)/font='\1'/

    " substitute bold with "NONE"
    execute 'silent! %s/' . a:attr . '\([\w,]*\)/NONE\1/geI'
    " yank entire buffer
    normal ggVG
    " copy
    silent! normal "xy
    " run
    execute @x

    " remove temp buffer
    bwipeout!

    " restore selection registers
    silent! normal ggVGy
    bwipeout!
endfunction


if !has('vim_starting')
  " Call on_source hook when reloading .vimrc.
  call neobundle#call_hook('on_source')
endif
