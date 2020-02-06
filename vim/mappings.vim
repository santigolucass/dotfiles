" Disabling arrow keys
noremap <Left> :echoe "Use h"<CR>
noremap <Right> :echoe "Use l"<CR>
noremap <Up> :echoe "Use k"<CR>
noremap <Down> :echoe "Use j"<CR>

" Auto format any pasted text
nnoremap P P=`]
nnoremap p p=`]

" NerdTree keymaps
nmap <silent> <Leader>p :NERDTreeToggle<CR>
nmap <silent> <Leader>l :NERDTreeFind<CR>

" Copy filepath
nmap <Leader>cs :let @+=expand("%")<CR>

" Easymotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Replace all :
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

" Map spacebar to :
nno <Space> :
vno <Space> :

nmap <silent> <Leader>f :Files<CR>

:imap jk <Esc>

"tabs
nnoremap <tab> :tabnext<CR>
nnoremap <C-T> :tabnew<CR>
inoremap <tab> <Esc>:tabnext<CR>i
inoremap <C-T> <Esc>:tabnew<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Grepping made easy
" ==================
command! -nargs=1 SearchInRepo :silent! Ggrep! "\b<args>\b" | :copen
nnoremap <leader>g :Ag <C-R><C-W>
" nnoremap <leader>g :SearchInRepo <C-R><C-W>

set nohlsearch
nnoremap <leader>h :set hlsearch!<CR>

" Make 0 go to the first character rather than the beginning
" of the line. When we're programming, we're almost always
" interested in working with text rather than empty space. If
" you want the traditional beginning of line, use ^
nnoremap 0 ^
nnoremap ^ 0

" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" ============================
" SplitJoin plugin
" ============================
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

" git gutter hunk movements
nmap <leader>j <Plug>GitGutterNextHunk
nmap <leader>k <Plug>GitGutterPrevHunk

" ,# Surround a word with #{ruby interpolation}
map ,# ysiw#
vmap ,# c#{<C-R>"}<ESC>

" ," Surround a word with "quotes"
map ," ysiw"
vmap ," c"<C-R>""<ESC>

" ,' Surround a word with 'single quotes'
map ,' ysiw'
vmap ,' c'<C-R>"'<ESC>

" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map ,( ysiw(
map ,) ysiw)
vmap ,( c(<C-R>")<ESC>
vmap ,) c(<C-R>")<ESC>

" ,[ Surround a word with [brackets]
map ,] ysiw]
map ,[ ysiw[
vmap ,[ c[<C-R>"]<ESC>
vmap ,] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
map ,} ysiw}
map ,{ ysiw{
vmap ,} c{<C-R>"}<ESC>
vmap ,{ c{<C-R>"}<ESC>

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<Tab>"
  else
    return "\<C-p>"
  endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>

" Ack
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>--ruby<Space>--js<Space>

" Conflicted
let g:diffget_local_map = 'gl'
let g:diffget_upstream_map = 'gu'
set stl+=%{ConflictedVersion()}

" vim-test
nmap <leader>t :TestFile<CR>

" Insert Mode
iabbr bp binding.pry

"" ALEFix
nmap <Leader>af <Plug>(ale_fix):e!<Enter>

" Blame line
nmap <expr> <leader>b ToggleBlameLine()

iabbr dbg debugger;
iabbr clog console.log('');

" Terminal integrated with F4
let g:term_buf = 0
function! Term_toggle()
  1wincmd w
  if g:term_buf == bufnr("")
    setlocal bufhidden=hide
    close
  else
    topleft vnew
    try
      exec "buffer ".g:term_buf
    catch
      call termopen("zsh", {"detach": 1 })
      let g:term_buf = bufnr("")
    endtry
    startinsert!
  endif
endfunction
nnoremap <f4> :call Term_toggle()<cr>

" Exit from terminal
:tnoremap <F5> <C-\><C-n>

" Vim-Fugitive
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gb :Gbrowse<CR>
nmap <leader>ga :Git add .<CR>:bd!<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gl :Glog
nmap <leader>ge :Gedit<CR>
nmap <leader>gh :Git checkout
nmap <leader>gg :Git pull<CR>
nmap <leader>gm :Git checkout master
nmap <leader>gwd :Git diff HEAD .<CR>

" Rails Stuff
nmap <leader>rt :A<CR>
nmap <leader>rm :Emodel<CR>
nmap <leader>rc :Econtroller<CR>
nmap <leader>rv :Eview<CR>
nmap <leader>rwt :AV<CR>
nmap <leader>rwm :Vmodel<CR>
nmap <leader>rwc :Vcontroller<CR>
nmap <leader>rwv :Vview<CR>
nmap <leader>rwu :RuboCop -a<CR>

" test
map <Leader>tn :TestNearest<CR>
map <Leader>tf :TestFile<CR>
map <Leader>ta :TestSuite<CR>
map <Leader>tl :TestLast<CR>

" Remap keys for gotos
nmap <silent> gdd :ALEGoToDefinition<cr>
nmap <silent> gdt :ALEGoToDefinitionInTab<cr>
nmap <silent> gdv :ALEGoToDefinitionInVSplit<cr>
nmap <silent> gds :ALEGoToDefinitionInSplit<cr>
" Bind F8 to fixing problems with ALE
nmap <F8> <Plug>(ale_fix)
