lua require('core.init')
lua require('configs.vim')


set title
set completeopt=menu,menuone,noinsert,noselect


" 自定义 autocmd 
autocmd FileType markdown  set nowrap


" 中文标点替换为英文标点
function! FormatChar()
    let map ={
        \ ",":'\%u3001',
        \ "'":'\%uFF07\|\%u2018\|\%u2019',
        \ '"':'\%u201D\|\%uFF02\|\%u3003\|\%u201C',
        \ '? ':'\%uFF1F',
        \ '! ':'\%uFF01',
        \ ': ':'\%uFF1A',
        \ '; ':'\%uFF1B',
        \ ', ':'\%uFF0C',
        \ '. ':'\%u3002\|\%uFF0E',
        \ '(':'\%uFF08',
        \ ')':'\%uFF09',
        \ '<':'\%u3008\|\%uFF1C',
        \ '>':'\%u3009\|\%uFF1D',
        \ '|':'\%u3021\|\%uFF5C',
        \ '#':'\%uFF03',
        \ '$':'\%uFF04',
        \ '&':'\%uFF06',
        \ '+':'\%uFF0B',
        \ '*':'\%uFF0A',
        \ '%':'\%uFF05',
        \ '=':'\%uFF1D',
        \ '/':'\%uFF0F',
        \ '@':'\%uFF20',
        \ '^':'\%uFF3E',
        \ '`':'\%uFF40',
        \ '{':'\%uFF5B',
        \ '}':'\%uFF5D',
        \ '~':'\%uFF5E',
        \ '-':'\%uFF0D\|\%u2010\|\%u2011\|\%u2012\|\%u2013\|\%u2014\|\%u2015',
        \ '[':'\%u3010\|\%uFF3B',
        \ ']':'\%u3011\|\%uFF3D'
    \}
    " 光标定位到选择的内容的头部
    normal `< 
    normal gv
    normal d
    let lines = @"
    let key=''
    let value=''
	for [key, value] in items(map)
       let lines = substitute(lines,value,key,'g')
	endfor
    let @1=lines
    normal "1P
endfunction

" =======================
" markdown格式化  abc
" =======================
" 中文标点转英文标点
autocmd FileType markdown  vmap <leader>c, <esc>:call FormatChar()<cr>
" table 格式化，单元格之间用四个空格或tab隔开
autocmd FileType markdown  vmap <leader>ft  :s/\(----\)\@<=\s\+\(----\)\@=\<bar>\(\s*\t\s*\)\+\<bar>\s\{4,}\<bar>^\(\s*<bar>\)\@!\<bar>\(<bar>\s*\)\@<!$/<bar>/g<cr>:nohl<cr>:Tablelize<cr>
" 用`包围含有_ 的word
autocmd FileType markdown  vmap <leader>fw  :s/[a-zA-Z$->:;'"()]\+\(_[a-zA-Z$->:;'"()]\+\)\+/`\0`/g<cr>:nohl<cr>
" 无序列表
autocmd FileType markdown  vmap <leader>fu  :s/^\(\s*\)\(\S\+\)/\1* \2/g<cr>:nohl<cr>
" 有序列表
autocmd FileType markdown  vmap <leader>fo  :s/^\(\s*\)\(\S\+\)/\11. \2/g<cr>:nohl<cr>
" blockquote
autocmd FileType markdown  vmap <leader>fb  :s/^.*$/> \0/g<cr>:nohl<cr>
" 包围块代码
autocmd FileType markdown  vmap <leader>fc  :s/^\(\%V\_.*\)\%V$/```\r\0\r```/<cr>:nohl<cr>

" shiftwidth设置
autocmd FileType go setlocal shiftwidth=4
autocmd FileType lua setlocal shiftwidth=2

" terminal
autocmd TermOpen * setlocal wrap
autocmd TermOpen * setlocal linebreak
autocmd TermOpen * setlocal list
autocmd TermOpen * setlocal textwidth=0

" 在插入模式禁止auto indent,否则粘贴文本时候, 会逐行缩进
set noautoindent
" trigger `autoread` when files changes on disk
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" notification after file change
autocmd FileChangedShellPost *  echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" copilot  mac
if has('mac')
    imap <silent><script><expr> <m-j> copilot#Accept("\<CR>")
else
    imap <silent><script><expr> <d-j> copilot#Accept("\<CR>")
endif
imap <silent><script><expr> <m-j> copilot#Accept("\<CR>")
imap <silent><script><expr> <a-j> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
let g:copilot_enabled = 1
