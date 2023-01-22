"Auto trim trailing whitespace
fun! TrimWhitespace()
    let l:save=winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make it so * doesn't jump to the next occurance
nnoremap * :keepjumps normal! mi*`i<CR>

" Vimwiki stuff
let g:vimwiki_list = [{'path': '~/git/vimwiki'}]
nmap <Leader>\ <Plug>VimwikiTabIndex

" Undo dir
set undodir=~/.config/nvim/undodir
set undofile

au BufNewFile,BufRead *COMMIT_EDITMSG
        \  set colorcolumn=72

""
" fun! StartUp()
"     if argc() == 0
"         :Dashboard
"     elseif argc() == 1 && argv(0) == "."
"         :Dashboard
"     end
" endfun

" autocmd VimEnter * call StartUp()
