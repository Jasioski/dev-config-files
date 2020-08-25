" Jasio's VIMRC!

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab "Make tab button insert 4 spaces
set number "Make line numbers appear

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
