" Disable GUI Tabline
if exists(':GuiTabline')
    GuiTabline 0
endif

" Disable GUI Popupmenu
if exists(':GuiPopupmenu')
    GuiPopupmenu 0
endif

" Enable GUI ScrollBar
if exists(':GuiScrollBar')
    GuiScrollBar 0
endif

if exists(':GuiFont')
    GuiFont! UbuntuMono Nerd Font:h20

else
	set guifont=UbuntuMono\ Nerd\ Font:h20
endif

if exists('*GuiClipboard')
	call GuiClipboard()
end

if exists(':TableModeEnable')
	autocmd FileType markdown TableModeEnable
endif

" Right Click Context Menu (Copy-Cut-Paste): terminal模式中粘贴内容有用
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv

" terminal <c-r>访问registers
tnoremap <expr> <C-\><C-\> '<C-\><C-N>"'.nr2char(getchar()).'pi'
