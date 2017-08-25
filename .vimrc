set nocompatible " all the best stuff
filetype off " Vundle required      

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Plugin 'gmarik/vundle'

" file system
Plugin 'scrooloose/nerdtree'

" git integration
Plugin 'tpope/vim-fugitive'

" javascript syntax
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'scrooloose/syntastic'

" coffeescript syntax
Plugin 'kchmck/vim-coffee-script'

" typescript
Plugin 'leafgarland/typescript-vim'

" markdown stuffs
Plugin 'plasticboy/vim-markdown'

" jshint
Plugin 'walm/jshint.vim'

" powerline
Plugin 'bling/vim-airline'
let g:airline_left_sep=''
let g:airline_right_sep=''
" colors

Plugin 'tomtom/tcomment_vim'
Plugin 'mileszs/ack.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'airblade/vim-rooter'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'SirVer/ultisnips'

filetype plugin indent on

" setup solarized
syntax enable
set background=dark
colorscheme molokai
" set t_Co=256

set mouse=a

let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

" leader as `
let mapleader = '`'

" vim folders
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo

" general settings
set autoread " Auto read file updates when file is open
set autoindent " Copy indent from last line when starting new line.
set smartindent " Indent correctly on newline - complements autoindent
set backspace=indent,eol,start
set diffopt=filler " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)
set encoding=utf-8 nobomb " BOM often causes trouble
set esckeys " Allow cursor keys in insert mode.
set expandtab " Expand tabs to spaces
set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words
set gdefault " By default add g flag to search/replace. Add g to toggle.
set hidden " When a buffer is brought to foreground, remember undo history and marks.
set history=1000 " Increase history from 20 default to 1000
set hlsearch " Highlight searches
set incsearch " Highlight dynamically as pattern is typed.
set laststatus=2 " Always show status line
set magic " Enable extended regexes.
set noerrorbells " Disable error bells.
set nojoinspaces " Only insert single space after a '.', '?' and '!' with a join command.
set nostartofline " Don't reset cursor to start of line when moving around.
set nowrap " Do not wrap lines.
set nu " Enable line numbers.
set ofu=syntaxcomplete#Complete " Set omni-completion method.
set report=0 " Show all changes.
set ruler " Show the cursor position
set scrolloff=8 " Start scrolling three lines before horizontal border of window.
set shiftwidth=2 " The # of spaces for indenting.
set shortmess=atI " Don't show the intro message when starting vim.
set showmode " Show the current mode.
set showtabline=2 " Always show tab bar.
set sidescrolloff=3 " Start scrolling three columns before vertical border of window.
set smartcase " Ignore 'ignorecase' if search patter contains uppercase characters.
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces.
set softtabstop=2 " Tab key results in 2 spaces
set splitbelow " New window goes below
set splitright " New window goes right
set title " Show the filename in the window titlebar.
set ttyfast " Send more characters at a given time.
set ttymouse=xterm " Set mouse type to xterm.
set undofile " Persistent Undo.
set visualbell " Use visual bell instead of audible bell (annnnnoying)
set wildchar=<TAB> " Character for CLI expansion (TAB-completion).
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/smarty/*,*/vendor/*,*/node_modules/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*
set wildmenu " Hitting TAB in command mode will show possible completions above command line.
set wildmode=list:longest " Complete only until point of ambiguity.
set winminheight=0 "Allow splits to be reduced to a single line.
set wrapscan " Searches wrap around end of file
set wrap
set nolist
set linebreak
set list
set listchars=tab:⦊·,trail:·,extends:#,nbsp:·
" set paste " allow us to paste things into vim
set rnu

""" nerdtree stuff

" close vim if nerdtree is only thign open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endifautocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" map `fs` to nerdtree
nmap <Leader>fs :NERDTreeToggle<Cr>

""" git stuff
nmap gs :Gstatus<Cr>
nmap gc :Gcommit<Cr>
nmap gb :Gblame<Cr>
nnoremap gp :!git push<Cr>
" open file in github
" i don't use this tbh
map gh :Gbrowse<Cr>
nnoremap <leader>a :Ack! ""<left>
nnoremap <right> :bn<CR>
nnoremap <left> :bp<CR>

nnoremap j gj
nnoremap k gk
"let g:UltiSnipsListSnippets = "<down>"
"let g:UltiSnipsExpandTrigger = '<tab>'

let g:UltiSnipsListSnippets = "<down>"
let g:UltiSnipsExpandTrigger = "<S-TAB>"

let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']

""" useful shiz
nnoremap ; :


""" buffer management

 function! <SID>StripTrailingWhitespaces()
  " Save last search and cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Remove trailing whitespace
  %s/\s\+$//e
  " Restore last search and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
nnoremap <silent> <F10> :call <SID>StripTrailingWhitespaces()<CR>
