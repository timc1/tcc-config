set nocompatible
set encoding=utf-8 nobomb
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle manages Vundle 😀
Plugin 'VundleVim/Vundle.vim'

" solarized color theme
Plugin 'altercation/vim-colors-solarized'

" improved folder structure
Plugin 'tpope/vim-vinegar'

" syntax highlighting
Plugin 'sheerun/vim-polyglot'

" .mdx syntax highlighting
Plugin 'findango/vim-mdx'

" prettier code formatting
Plugin 'prettier/vim-prettier', {
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue']
  \ }

" asynchronous linting
Plugin 'w0rp/ale'

" ~lean & mean status/tabline~ 😼
Plugin 'vim-airline/vim-airline'

" all plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" show line numbers
set number
" set relative line numbers
set rnu

" solarized theme 
syntax enable
set background=dark
colorscheme solarized

" tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" status bar/airline plugin
set noshowmode   " don't show insert mode
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_skip_empty_sections=1

" wrap text
set tw=100
set formatoptions+=t

" better searches
set ignorecase   " ignores case in searches
set incsearch    " begins searching after typing
set hlsearch     " highlight all matching searches

" show commands that have been typed
set showcmd

" don’t reset cursor to start of line when moving around
set nostartofline

" keep the cursor line near the middle of the screen
set scrolloff=3

" disable cursorline in insert mode
set cul
autocmd InsertEnter,InsertLeave * set nocul!

" remap ctrl-c to esc
inoremap <C-c> <Esc><Esc>

" split window vertically, right.
set splitright

" show filename in the window titlebar
set title

" turn off bell sound 🔕
set belloff=all

" remove all scrollbars
set guioptions=

" remap capital w and q to lowercase
command! W :w
command! Q :q

" Open files in browser
nnoremap <F12>f :exe ':silent !open -a /Applications/Firefox.app %'<CR>
nnoremap <F12>c :exe ':silent !open -a /Applications/Google\ Chrome.app %'<CR>
nnoremap <F12>g :exe ':silent !open -a /Applications/Google\ Chrome.app %'<CR>
nnoremap <F12>s :exe ':silent !open /Applications/Safari.app %'<CR>

" Run prettier on save
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.mdx,*.vue,*.yaml,*.html PrettierAsync 

" Allow .jsx syntax to be used on .js files
let g:jsx_ext_required = 0

" Disable automatic comment insertion 
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Enable yanking to the clipboard
set clipboard=unnamed

" Disable 'safe write' feature that can potentially interfere with recompilation.
" Reference: https://webpack.js.org/guides/development/#adjusting-your-text-editor
set backupcopy=yes

" Open new tab shortcuts
ca tn tabnew
ca th tabprevious
ca tl tabnext

" insert HTML template in new HTML files
:autocmd BufNewFile *.html 0r ~/.vim/templates/html.tpl
