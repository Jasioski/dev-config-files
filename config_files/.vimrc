" Jasio's VIMRC!

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab "Make tab button insert 4 spaces
set number "Make line numbers appear

" Enable syntax highlighting
if !exists("g:syntax_on") " Safeguard to prevent multiple calls (prevents the breaks that sometimes occur if both syntax on and enable are used)
    syntax enable
endif

"" Searching enhancements
set hlsearch "Enable search highlighting
set ignorecase "Ignore case when searching
set incsearch "Incremental search that shows partial matches.
set clipboard=unnamed

"" Difftool use :DiffSaved to show changes made to file since last save
"" Use :diffoff and then :q to go back to original file that you were editing
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

"""Remaping Keys
" (Insert Mode) Use ctrl+k to insert line above where the line currently being edited
inoremap <C-k> <Esc>O<Esc>jA

" (Normal Mode) Press Esc twice to clear search highlights
nnoremap <esc><esc> :noh

"" Delete remaps
" (Insert Mode) Use ctrl+d then let go, then press left arrow to delete word to left of cursor
inoremap <C-d><Left> <Esc><C-v><C-Left><Del>i

" (Insert Mode) Use ctrl+d then let go, then press right arrow to delete word to right of cursor
inoremap <C-d><Right> <Esc><C-v><C-Right><Del>i

" for C-like programming, have automatic indentation:
autocmd FileType c,cpp,slang set cindent

" for actual C (not C++) programming where comments have explicit end
" characters, if starting a new line in the middle of a comment automatically
" insert the comment leader characters:
autocmd FileType c set formatoptions+=ro

" for Perl programming, have things in braces indenting themselves:
autocmd FileType perl set smartindent

" for CSS, also have things in braces indented:
autocmd FileType css set smartindent

" for HTML, generally format text, but if a long line has been created leave it
" alone when editing:
autocmd FileType html set formatoptions+=tl

" for both CSS and HTML, use genuine tab characters for indentation, to make
" files a few bytes smaller:
autocmd FileType html,css set noexpandtab tabstop=2

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings earlier):
autocmd FileType make set noexpandtab shiftwidth=8

" bind ctag to ctrl + ]
" open ctag in new window
nnoremap <C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" I usually do my development in a directory called git located in HOME/Documents
" This is specific to me, you may need to change this to your main development directory
set tags+=$HOME/Documents/git/
