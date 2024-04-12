set nocompatible              " be iMproved, required
set autoread                  " detect when a file is changed
filetype off                  " required

set wrap
set linebreak
set nolist  "list disables linebreak

" slow vim in wsl
set timeoutlen=1000 ttimeoutlen=0

" enable syntax highlighting
syntax enable

" show line numbers
set number

" indent when moving to the next line while writing code
set autoindent

" show file name constantly
set laststatus=2
set statusline=%F%m%r%h%w
"set statusline+=[FORMAT=%{&ff}]
"set statusline+=[TYPE=%Y]
set statusline+=[%04l,%04v]
set statusline+=[%p%%]
set statusline+=[%L] 
"set statusline+=%F

" expand tabs into spaces
set expandtab
" set tabs to have 4 spaces
set ts=4
" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line
set nocursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

" access system clipboard 
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif

" faster redrawing
set ttyfast

" color scheme
colorscheme delek
hi SignColumn ctermbg=none 
"guibg=#131313
"hi DiffAdd      gui=none    guifg=NONE          guibg=#bada9f
"hi DiffChange   gui=none    guifg=NONE          guibg=#e5d5ac
"hi DiffDelete   gui=bold    guifg=#ff8080       guibg=#ffb0b0
"hi DiffText     gui=none    guifg=NONE          guibg=#8cbee2

" highlight lines in Sy and vimdiff etc.)
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227

" highlight signs in Sy
" change 237 to none
highlight SignifySignAdd    cterm=bold ctermbg=none  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=none  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=none  ctermfg=227

" line number to grey
highlight LineNr ctermfg=grey

" split
set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

augroup autoquickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost    l* lwindow
augroup END

"faster scrolling YE
nnoremap <C-Y> 4<C-Y>
nnoremap <C-E> 4<C-E>

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=0 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

set encoding=utf-8

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
noremap e 5e

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=0 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

set encoding=utf-8

" yanking to windows clipboard from vim
if system('uname -r') =~ "microsoft"
    augroup Yank
    autocmd!
    autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
    augroup END
endif

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
call plug#begin('~/.vim/plugged')

" let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'
Plug 'kien/ctrlp.vim' " fuzzy find files

"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

Plug 'tpope/vim-fugitive' "ultimate git helper
Plug 'Valloric/YouCompleteMe' 
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'mhinz/vim-signify'
let g:Signify_vcs_list = ['git']
"Plug 'craigemery/vim-autotag'
Plug 'ludovicchabant/vim-gutentags'
"enable gtags module
let g:gutentags_modules = ['ctags']
"let g:gutentags_modules = ['ctags', 'gtags_cscope']
" put tags file into .git
let g:gutentags_ctags_tagfile = '.git/tags'
set statusline+=%{gutentags#statusline()}

" config project root markers.
let g:gutentags_project_root = ['.git']
let g:gutentags_ctags_extra_args = ['--tag-relative=no']

let g:gutentags_add_default_project_roots=0
" generate datebases in my cache directory, prevent gtags files polluting my
" project
let g:gutentags_cache_dir = expand('~/.cache/tags')



" Matlab plugin
"Plug 'MortenStabenau/matlab-vim'


"
"config project rooa markers
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
