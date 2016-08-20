execute pathogen#infect()

" Use OS clipboard
set clipboard=unnamed

" Whitespace is racist, end space segregation: spaces instead of tab chars
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set backspace=indent,eol,start

" Things to help me know where I am in the file (also keeping good form)
set number
set ruler
set colorcolumn=80

" Better tabcompletion
set wildmenu

" Highlight things and live the high(light)life
syntax enable
set background=dark
colorscheme candy 
set hlsearch
nnoremap <C-L> :nohl<CR><C-L>
hi Visual term=reverse cterm=reverse guibg=Grey

" Convenient keybindings
let mapleader = ","
let maplocalleader = "\\"
" Edit .vimrc
nnoremap <leader><C-E> :vsplit ~/.vimrc<CR>
" Reload .vimrc
nnoremap <leader><C-W> :source ~/.vimrc<CR>
" toggle NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>
" toggle :set paste
nnoremap <leader>i :set paste!<CR>
" list buffers
nnoremap <leader>1 :buffers<CR>
" toggle Syntastic
nnoremap <leader>s :SyntasticToggleMode<CR>
" toggle gundo
nnoremap <leader>g :GundoToggle<CR>
" do stuff ...

" Convenient commands

" Mouse movement mapping, I have no idea if vim is using these mappings or
" if it is just doing this by default
set mouse=a
map <M-Esc>[62~ <ScrollWheelUp>
map! <M-Esc>[62~ <ScrollWheelUp>
map <M-Esc>[63~ <ScrollWheelDown>
map! <M-Esc>[63~ <ScrollWheelDown>        
map <M-Esc>[64~ <S-ScrollWheelUp>
map! <M-Esc>[64~ <S-ScrollWheelUp>
map <M-Esc>[65~ <S-ScrollWheelDown>
map! <M-Esc>[65~ <S-ScrollWheelDown>

nnoremap gc :call Comment()<CR>
nnoremap gC :call Uncomment()<CR>

" Commenting and Uncommenting 
" TODO Add html commenting through gc (find regex)
function! Comment()
  let ft = &filetype
  if ft == 'php' || ft == 'ruby' || ft == 'sh' || ft == 'make' || ft == 'python' || ft == 'perl'
    silent s/^/\#/
  elseif ft == 'javascript' || ft == 'scss' || ft == 'c' || ft == 'cpp' || ft == 'java' || ft == 'objc' || ft == 'scala' || ft == 'go'
    silent s:^:\/\/:g
  elseif ft == 'tex'
    silent s:^:%:g
  elseif ft == 'vim'
    silent s:^:\":g
  endif
endfunction

function! Uncomment()
  let ft = &filetype
  if ft == 'php' || ft == 'ruby' || ft == 'sh' || ft == 'make' || ft == 'python' || ft == 'perl'
    silent s/^\#//
  elseif ft == 'javascript' || ft == 'scss' || ft == 'c' || ft == 'cpp' || ft == 'java' || ft == 'objc' || ft == 'scala' || ft == 'go'
    silent s:^\/\/::g
  elseif ft == 'tex'
    silent s:^%::g
  elseif ft == 'vim'
    silent s:^\"::g
  endif
endfunction

" Syntastic config settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" Status lines
set statusline=
set statusline+=%<\                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\        " flags and buf no
set statusline+=%-40f\                    " path
set statusline+=%=%1*%y%*%*\              " file type
set statusline+=%10((%l,%c)%)\            " line and column
set statusline+=%P   
set statusline+=%F
" jamessan's
" set statusline=   " clear the statusline for when vimrc is reloaded
" set statusline+=%-3.3n\                      " buffer number
" set statusline+=%f\                          " file name
" set statusline+=%h%m%r%w                     " flags
" set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
" set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
" set statusline+=%{&fileformat}]              " file format
" set statusline+=%=                           " right align
" set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
" set statusline+=%b,0x%-8B\                   " current char
" set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

" NERDTree config
map <C-n> :NERDTreeToggle<CR>

" Syntastic config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" jsx linting config
let g:jsx_ext_required = 0
