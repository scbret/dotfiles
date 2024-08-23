set ruler               " Show the line and column numbers of the cursor.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set modeline            " Enable modeline.
"set esckeys             " Cursor keys in insert mode.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.
if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set display+=lastline
set nostartofline       " Do not jump to first character with page commands.
set noerrorbells                " No beeps
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
set noswapfile                  " Don't use swapfile
set nobackup            	" Don't create annoying backup files
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set showmatch                   " Do not show matching brackets by flickering
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set autoindent
set tabstop=4 shiftwidth=4 expandtab
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).
set relativenumber
set number
set cursorline

" vimwiki settings
set nocompatible
filetype plugin on
syntax on

" Plugins, syntax, and colors
" ---------------------------------------------------------------------------
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug
" https://github.com/junegunn/vim-plug
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure to use single quotes
" Install with `:PlugInstall`

" https://github.com/itchyny/lightline.vim
Plug 'itchyny/lightline.vim'

" https://github.com/tpope/vim-commentary
Plug 'tpope/vim-commentary'

" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

" https://github.com/tpope/vim-vinegar
Plug 'tpope/vim-vinegar'

" https://github.com/APZelos/blamer.nvim
Plug 'APZelos/blamer.nvim'

" https://github.com/fenetikm/falcon/wiki/Installation
Plug 'fenetikm/falcon'

" https://github.com/macguirerintoul/night_owl_light.vim
Plug 'macguirerintoul/night_owl_light.vim'

" https://github.com/nanotech/jellybeans.vim
Plug 'nanotech/jellybeans.vim'

" if you don't have node and yarn, use pre build
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': 'markdown' }
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
" do not close the preview tab when switching to other buffers
let g:mkdp_auto_close = 0

" Distraction free writing
" command = :Goyo to start and Goyo! to stop
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' "Fuzzy find plugin
Plug 'preservim/nerdtree' "File browser inside vim
Plug 'ryanoasis/vim-devicons' "Cool icons for nerd tree

" vimwiki plugin
Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{'path':'~/repos/vimwiki/','syntax':'markdown','ext':'.md'}]
au FileType vimwiki setlocal shiftwidth=6 tabstop=6 noexpandtab

" Floaterm plugin
Plug 'voldikss/vim-floaterm'

" Initialize plugin system
call plug#end()

let mapleader=' ' "Maps Leader to space
let NERDTreeShowHidden=1

" Plugin Shortcuts
  map <Leader>f :NERDTreeToggle<CR>
  nnoremap <C-f> :Files!<CR>
  nnoremap <Leader>p :MarkdownPreview<CR>  "space+p to see preview
  nnoremap <Leader>s :MarkdownPreviewStop<CR>  "space+s to stop preview

  " Tabedit keybinds
  nnoremap <Leader>1 1gt<CR>
  nnoremap <Leader>2 2gt<CR>
  nnoremap <Leader>3 3gt<CR>
  nnoremap <Leader>4 4gt<CR>
  nnoremap <Leader>5 5gt<CR>
  nnoremap <Leader>t :tabnew<CR>
  nnoremap <Leader>c :tabclose<CR>

  " Floaterm
  nnoremap <Leader>fn :FloatermNew --location=topleft<CR>
  nnoremap <Leader>ff :FloatermNew --loacation=topleft --width=0.8 --height=0.8 fzf<CR>
  nnoremap   <silent>   <F12>   :FloatermToggle<CR>
  tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>

syntax enable
" Neovim only
set termguicolors 

" Light scheme
" colorscheme night_owl_light

" Dark scheme
" colorscheme falcon
"colorscheme jellybeans
set background=dark

" Show character column
set colorcolumn=100

" lightline config - add file 'absolutepath'
" Delete colorscheme line below if using Dark scheme

" let g:lightline = {
"      \ 'colorscheme': 'PaperColor_light',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'absolutepath', 'modified' ] ]
      \ }
      \ }

let g:blamer_enabled = 1
" %a is the day of week, in case it's needed
let g:blamer_date_format = '%e %b %Y'
highlight Blamer guifg=darkorange
