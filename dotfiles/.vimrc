set nocompatible
set encoding=utf-8 nobomb
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle manages Vundle 😀
Plugin 'VundleVim/Vundle.vim'

" improved folder structure
Plugin 'tpope/vim-vinegar'

" syntax highlighting
Plugin 'sheerun/vim-polyglot'

" .mdx syntax highlighting
Plugin 'findango/vim-mdx'

" prettier code formatting
Plugin 'prettier/vim-prettier', {
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'html']
  \ }

" code completion
Plugin 'Valloric/YouCompleteMe'

" asynchronous linting
Plugin 'w0rp/ale'

" ~lean & mean status/tabline~ 😼
Plugin 'vim-airline/vim-airline'

" reformats indentation when we move lines up and down
Plugin 'tpope/vim-unimpaired'

" comments
Plugin 'tpope/vim-commentary'

" all plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" show line numbers
set number
" set relative line numbers
set rnu

syntax enable
let g:solarized_termtrans=1
set background=dark
colorscheme solarized 
set guifont=Input:h11

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

" netrw hide mac files
let g:netrw_list_hide='.*\.swp$,\.DS_Store'
let g:netrw_banner=0
let g:netrw_liststyle=3

" YouCompleteMe
" close preview after insertion mode
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
" remove YouCompleteMe's linter because we're using ALE 
let g:ycm_show_diagnostics_ui = 0

" vim-ale change error and warning symbols
let g:ale_sign_error = "◉"
let g:ale_sign_warning = "◉"
highlight ALEErrorSign ctermfg=9 ctermbg=15 guifg=#C30500
highlight ALEWarningSign ctermfg=11 ctermbg=15 guifg=#ED6237

" wrap text
set tw=100
set formatoptions+=t

" ignores case in searches
set ignorecase   

" highlight all matching searches
set incsearch    

" begins searching after typing
set hlsearch     

" ctrl + l to remove current search
noremap <C-l> :noh<CR>

" show commands that have been typed
set showcmd

" don’t reset cursor to start of line when moving around
set nostartofline

" when toggling between (H)igh, (M)id, (L)ow, keep the cursor line 3 lines from the original target 
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

" no .swp files
set noswapfile

" remap capital w and q to lowercase
command! W :w
command! Q :q

" move single lines up and down
nmap <C-k> [e
nmap <C-j> ]e
" move multiple lines up and down
vmap <C-k> [egv
vmap <C-j> ]egv

" open files in browser
nnoremap <F12>f :exe ':silent !open -a /Applications/Firefox.app %'<CR>
nnoremap <F12>c :exe ':silent !open -a /Applications/Google\ Chrome.app %'<CR>
nnoremap <F12>g :exe ':silent !open -a /Applications/Google\ Chrome.app %'<CR>
nnoremap <F12>s :exe ':silent !open /Applications/Safari.app %'<CR>

" run prettier on save
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.mdx,*.vue,*.yaml,*.html PrettierAsync 

" allow .jsx syntax to be used on .js files
let g:jsx_ext_required = 0

" disable automatic comment insertion 
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" enable yanking to the clipboard
set clipboard=unnamed

" disable 'safe write' feature that can potentially interfere with recompilation.
" Reference: https://webpack.js.org/guides/development/#adjusting-your-text-editor
set backupcopy=yes

" open new tab shortcuts
ca tn tabnew
ca th tabprevious
ca tl tabnext
" open new tab in explorer mode and location of current 'head' 
ca te tabe %:h
ca tE Texplore

" copy error message to clipboard
ca err let @+ = v:statusmsg

" insert HTML template in new HTML files
:autocmd BufNewFile *.html 0r ~/.vim/templates/html.tpl

" insert React Typescript template into new .tsx files
:autocmd BufNewFile *.tsx 0r ~/.vim/templates/tsx.tpl

" makes cursor line color white - though this is saved in our custom solarized.vim color palette
"hi CursorLineNr guifg=white
