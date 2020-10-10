call plug#begin('~/.vim/plugged')

" Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
" diw 删除光标所在单词，ciw 改写单词，vip 选中段落等，ci"/ci( 改写引号/括号中的内容。
" i, 和 a, ：参数对象，写代码一半在修改，现在可以用 di, 或 ci, 一次性删除/改写当前参数
" ii 和 ai ：缩进对象，同一个缩进层次的代码，可以用 vii 选中，dii / cii 删除或改写
" if 和 af ：函数对象，可以用 vif / dif / cif 来选中/删除/改写函数的内容
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'py', 'go'] }
Plug 'sgur/vim-textobj-parameter'
Plug 'morhetz/gruvbox'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'mhinz/vim-startify'
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'preservim/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'honza/vim-snippets'

"------------------------------------韦一笑------------------------------
Plug 'skywind3000/quickmenu.vim'
Plug 'skywind3000/asyncrun.vim'
"------------------------------------韦一笑------------------------------
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'rhysd/vim-clang-format'
" Plug 'puremourning/vimspector'
" Initialize plugin system
call plug#end()

"------------------------------------韦一笑------------------------------
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6
" 任务结束时候响铃提醒
let g:asyncrun_bell = 1
" F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
" F9 为编译单文件:
nnoremap <silent> <F9> :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT).out" <cr>
" F5 运行：
nnoremap <silent> <S-F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT).out" <cr>
" 用 “<root>” 或者 “$(VIM_ROOT)”来表示项目所在路径，放一个空的 .root
" 文件到你的项目目录下就行了.
" F7 编译整个项目：
nnoremap <silent> <F7> :AsyncRun -cwd=<root> make <cr>
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml']
" F8 运行当前项目：
nnoremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr>
" F6 执行测试(你的 makefile 中需要定义怎么 run)：
nnoremap <silent> <F6> :AsyncRun -cwd=<root> -raw make test <cr>
" 如果你使用了 cmake 的话，还可以照葫芦画瓢
" F4 为更新 Makefile 文件：
nnoremap <silent> <F4> :AsyncRun -cwd=<root> cmake . <cr>
" -mode=4 选项可以跟 Visual Studio 执行命令行工具一样，弹出一个新的 cmd.exe窗口来运行程序或者项目
" Windows 下使用 GVim 的话，可以弹出新的 cmd.exe 窗口来运行刚才的程序：
nnoremap <silent> <F5> :AsyncRun -cwd=$(VIM_FILEDIR) -mode=4 "$(VIM_FILEDIR)/$(VIM_FILENOEXT).out" <cr>
" nnoremap <silent> <F8> :AsyncRun -cwd=<root> -mode=4 make run <cr>
" F4：使用 cmake 生成 Makefile
" F5：单文件：运行
" F6：项目：测试
" F7：项目：编译
" F8：项目：运行
" F9：单文件：编译
" F10：打开/关闭底部的 quickfix 窗口
"------------------------------------韦一笑------------------------------


" let g:go_list_type = "quickfix"
"
let g:go_version_warning = 1
" let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_function_calls = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_generate_tags = 1
"
" let g:godef_split=2

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_def_mapping_enabled = 0
" let g:go_code_completion_enabled = 1
let g:go_debug_log_output = 'debuglineerr'
" 直接通过 go run 执行当前文件
autocmd FileType go nmap <leader>gb  <Plug>(go-build)
autocmd FileType go nmap <leader>gr  <Plug>(go-run)
autocmd FileType go nmap <leader>gt  <Plug>(go-test)
autocmd FileType go nmap <leader>gf :GoFmt<CR>
autocmd FileType go nmap <leader>gi :GoImports<CR>
autocmd FileType go nmap <leader>dd :GoDebugStart<CR>
autocmd FileType go nmap <leader>d0 :GoDebugStop<CR>
autocmd FileType go nmap <leader>d6 :GoDebugRestart<CR>
autocmd FileType go nmap <leader>db :GoDebugBreakpoint<CR>
autocmd FileType go nmap <leader>cc :GoDebugContinue<CR>
autocmd FileType go nmap <leader>nn :GoDebugNext<CR>
autocmd FileType go nmap <leader>ss :GoDebugStep<CR>
autocmd FileType go nmap <leader>oo :GoDebugStepOut<CR>

let g:go_debug_windows = {
            \ 'vars':       'leftabove 30vnew',
            \ 'stack':      'leftabove 20new',
            \ 'goroutines': 'botright 10vnew',
            \ 'out':        'botright 5new',
  \ }
let g:go_debug_breakpoint_sign_text = '◦>'

" Personal settings
" Colorscheme
syntax enable
set guifont=Fira\ Code:h12
" This is hybrid_material
set background=dark
colorscheme hybrid_material
let g:enable_bold_font = 1
let g:enable_italic_font = 1
let g:hybrid_transparent_background = 1
if (has("termguicolors"))
  set termguicolors
endif

" if $TERM_PROGRAM =~ "iTerm"
let &t_SI = "\<Esc>]50;CursorShape=1\x7" " 插入模式改为细光标
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " 其他模式还是粗光标
" endif


" 设置空白字符的视觉提示
set list listchars=extends:❯,precedes:❮,tab:▸\ ,trail:˽
set cursorline
set relativenumber
" set number
set wildmenu
" set softtabstop=4 shiftwidth=4 expandtab
set lazyredraw
set autochdir                            " 自动切换当前目录为当前文件所在的目录
" ,<space> to close search hilight
nnoremap ,<space> :nohlsearch<CR>

" LeaderF Settings
let mapleader = "\<Space>"
nnoremap <Leader>a :echo "Hey there space"<CR>

" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'

let g:Lf_PreviewInPopup = 1

let g:Lf_ShortcutF = '<C-P>'

let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font':"Fira Code"  }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
let g:Lf_StlColorscheme = 'hybrid'
nnoremap <leader>k  <C-W><C-K>
nnoremap <leader>j  <C-W><C-J>
nnoremap <leader>h  <C-W><C-h>
nnoremap <leader>l  <C-W><C-l>

let g:airline_enabled = 1
" let g:airline_powerline_fonts = 0
let g:airline_theme = "hybrid"
let g:airline#extensions#tabline#enabled = 1      " 标签页栏美化
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#tabs_label = '🧢'       " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
let g:airline#extensions#tabline#buffers_label = '🎩'    " can put text here like TABS to denote tabs
let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline
" let g:airline#extensions#tabline#tab_min_count = 2     " minimum of 2 tabs needed to display the tabline
" let g:airline#extensions#tabline#show_tab_count = 0    " dont show tab numbers on the right
let g:airline#extensions#tabline#show_buffers = 0      " dont show buffers in the tabline
let g:airline#extensions#tabline#show_splits = 0       " disables the buffer name that displays on the right of the tabline
let g:airline#extensions#tabline#show_tab_nr = 0       " disable tab numbers
let g:airline#extensions#tabline#show_tab_type = 0     " disables the weird ornage arrow on the tabline
let g:airline#extensions#branch#enabled=1         " 显示 git 分支
let g:airline#extensions#tabline#show_buffers = 0 " 不显示已关tab的遗骸
let g:airline#extensions#hunks#enabled=0          " ' +n ~m -k '显示在 git 分支左侧, 表示增/改/删的行数

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

"-----------------------------------------------------------------
"让vim记忆上次编辑的位置
autocmd BufReadPost *
            \ if line("'\"")>0&&line("'\"")<=line("$") |
            \   exe "normal g'\"" |
            \ endif
"-----------------------------------------------------------------
" help
" :h 纵向分整个查看 显示在右侧的分屏
augroup helpfiles
  au!
  au BufRead,BufEnter */doc/* wincmd L
augroup END

nnoremap <c-h> :h<space>
vnoremap <c-h> :<c-u>h<space>
inoremap <c-h> <c-o>:h<space>

"=========================================================================
" 标签页、窗口、buffer操作
"=========================================================================
" 标签页
" alt+t 新开一空标签页
nnoremap  †   :tabnew<CR>
vnoremap  †   <esc>:tabnew<CR>v
inoremap  †   <c-o>:tabnew<CR>
" 开一个文件到新标签页
" <esc> alt+t
nnoremap <esc>†  :tabedit<space>
vnoremap <esc>†  <esc>:tabedit<space>
inoremap <esc>†  <c-o>:tabedit<space>
" shift+left 左一个标签页
nnoremap <S-Left> :tabprev<CR>
vnoremap <S-Left> <esc>:tabprev<CR>v
inoremap <S-Left> <c-o>:tabprev<CR>
" shift+right 右一个标签页
nnoremap <S-Right> :tabnext<CR>
vnoremap <S-Right> <esc>:tabnext<CR>v
inoremap <S-Right> <c-o>:tabnext<CR>
"-----------------------------------------------------------------
" alt  开文件
" alt+n  （需事先手动保存）关闭本buffer，并开一个新buffer
nnoremap  ᜩ  :bd\|enew<cr>
vnoremap  ᜩ  <esc>:bd\|enew<cr>
inoremap  ᜩ  <c-o>:bd\|enew<cr>
" <esc>ctrl+n  （需要事前手动保存）关闭本buffer，开一个文件到新buffer
nnoremap  <esc>ᜩ  :bd\|edit<space>
vnoremap  <esc>ᜩ  <esc>:bd\|edit<space>
inoremap  <esc>ᜩ  <c-o>:bd\|edit<space>
"-----------------------------------------------------------------
" ctrl+alt: buffer操作
"-----------------------------------------------------------------
" nnoremap ᜩ  :update<cr>:bd!|enew<cr>
" vnoremap ᜩ  <esc>:update<cr>:bd!|enew<cr>
" inoremap ᜩ  <c-o>:update<cr><c-o>:bd!|enew<cr>
" alt+ctrl+n  开一空白个新buffer
nnoremap ᜦ  :update<cr>:enew<cr>
vnoremap ᜦ  <esc>:update<cr>:enew<cr>
inoremap ᜦ  <c-o>:update<cr><c-o>:enew<cr>
" <esc>alt+crtl+n  开一个文件为新buffer
nnoremap <esc>ᜦ  :update<cr>:edit<space>
vnoremap <esc>ᜦ  <esc>:update<cr>:edit<space>
inoremap <esc>ᜦ  <c-o>:update<cr><c-o>:edit<space>
" alt+ctrl+b
nnoremap ᜧ  :update<cr>:buffers<cr>
vnoremap ᜧ  <esc>:update<cr>:buffers<cr>
inoremap ᜧ  <c-o>:update<cr><c-o>:buffers<cr>
" alt+ctrl+[
nnoremap ᜥ  :update<cr>:bnext<CR>
vnoremap ᜥ  <esc>:update<cr>:bnext<CR>
inoremap ᜥ  <c-o>:update<cr><c-o>:bnext<CR>
" alt+ctrl+]
nnoremap ᜣ :update<cr>:bprevious<CR>
vnoremap ᜣ <esc>:update<cr>:bprevious<CR>
inoremap ᜣ <c-o>:update<cr><c-o>:bprevious<CR>
" alt+ctrl+w 关闭当前buffer
nnoremap ᜨ :bd<CR>
vnoremap ᜨ <esc>:bd<CR>
inoremap ᜨ <c-o>:bd<CR>
"-----------------------------------------------------------------
" alt、ctrl+alt: 窗口操作
"-----------------------------------------------------------------
" 窗口分割
set splitright    " 默认开在右侧
" alt+\：垂直分割窗口
nnoremap « :vsp<cr>
vnoremap « <esc>:vsp<cr>v
inoremap «  <c-o>:vsp<cr>
" <esc> alt+\：垂直分割窗口 开文件
nnoremap <esc>« :vsp<space>
vnoremap <esc>« <esc>:vsp<space>
inoremap <esc>«  <c-o>:vsp<space>

set splitbelow  " 默认开在下边
" alt+shift+\：水平分割窗口
nnoremap » :sp<cr>
vnoremap » <esc>:sp<cr>v
inoremap » <c-o>:sp<cr>
" <esc> alt+shift+\：水平分割窗口  开文件
nnoremap <esc>» :sp<space>
vnoremap <esc>» <esc>:sp<space>
inoremap <esc>» <c-o>:sp<space>

" 分屏线从虚线改为实线
" hi VertSplit  term=reverse  cterm=reverse  gui=none
" hi VertSplit guibg=#282828 guifg=#181A1F
set fillchars=vert:│,fold:·
"-----------------------------------------------------------------
" alt+Fn+上下左右：去往上下左右一个窗口
" alt+ctrl+left
map   ᜉ  <plug>(LWin)
map!   ᜉ <plug>(LWin)
noremap  <plug>(LWin)  <c-w>h
inoremap <plug>(LWin)  <c-o><c-w>h
    " " 普通终端
" noremap  <esc>[1;9H <c-w>h
" inoremap <esc>[1;9H <c-o><c-w>h
    " " tmux下
" noremap  <esc><esc>[1~ <c-w>h
" inoremap <esc><esc>[1~ <c-o><c-w>h
" alt+ctrl+right
map  ᜊ   <plug>(RWin)
map! ᜊ   <plug>(RWin)
noremap  <plug>(RWin)   <c-w>l
inoremap <plug>(RWin)   <c-o><c-w>l
" 普通终端
" noremap  <esc>[1;9F <c-w>l
" inoremap <esc>[1;9F <c-o><c-w>l
    " " tmux下
" noremap  <esc><esc>[4~ <c-w>l
" inoremap <esc><esc>[4~ <c-o><c-w>l
" alt+ctrl+up
map  ᜋ   <plug>(UWin)
map!  ᜋ  <plug>(UWin)
noremap  <plug>(UWin)  <c-w>k
inoremap <plug>(UWin)  <c-o><c-w>k
" noremap  <esc><esc>[5~ <c-w>k
" inoremap <esc><esc>[5~ <c-o><c-w>k
" alt+shift+doen
map   ᜌ    <plug>(DWin)
map!   ᜌ   <plug>(DWin)
noremap    <plug>(DWin)   <c-w>j
inoremap   <plug>(DWin)   <c-o><c-w>j
" noremap  <esc><esc>[6~ <c-w>j
" inoremap <esc><esc>[6~ <c-o><c-w>j
"-----------------------------------------------------------------
" 窗口尺寸
" 变宽：alt +
nnoremap <silent> ≠ :exe "vertical resize " . (winwidth(0) * 15/14)<CR>
vnoremap <silent> ≠ <esc>:exe "vertical resize " . (winwidth(0) * 15/14)<CR>gv
inoremap <silent> ≠ <c-o>:exe "vertical resize " . (winwidth(0) * 15/14)<CR>
" 变窄  alt -
nnoremap <silent> – :exe "vertical resize " . (winwidth(0) * 14/15)<CR>
vnoremap <silent> – <esc>:exe "vertical resize " . (winwidth(0) * 14/15)<CR>gv
inoremap <silent> – <c-o>:exe "vertical resize " . (winwidth(0) * 14/15)<CR>
" 变高  shift alt +
nnoremap <silent> ± :exe "resize " . (winheight(0) * 10/9)<CR>
vnoremap <silent> ± <esc>:exe "resize " . (winheight(0) * 10/9)<CR>gv
inoremap <silent> ± <c-o>:exe "resize " . (winheight(0) * 10/9)<CR>
" 变矮  shift alt -
nnoremap <silent> ᜭ :exe "resize " . (winheight(0) * 9/10)<CR>
vnoremap <silent> ᜭ <esc>:exe "resize " . (winheight(0) * 9/10)<CR>gv
inoremap <silent> ᜭ <c-o>:exe "resize " . (winheight(0) * 9/10)<CR>


" NERDTree

let NERDTreeMapOpenInTab='<ENTER>'   " 在tree中，回车将文件开新tab
let g:TreeOnOpen=0                   " 开vim、进入新tab 即开nerdtree 且光标移动到文本窗口

" -----------------------------------------------------------------
let NERDSpaceDelims=1              " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1          " 多行注释时样子更好看
let g:NERDCommentEmptyLines = 1    " 允许注释空白行
let g:NERDToggleCheckAllLines = 1  " 当所选非空行皆被注释，toggle才解注，否则toggle加注



let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '//' } }
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<S-tab>"

" function! g:UltiSnips_Complete()
"   call UltiSnips#ExpandSnippet()
"   if g:ulti_expand_res == 0
"     if pumvisible()
"       return "\<C-n>"
"     else
"       call UltiSnips#JumpForwards()
"       if g:ulti_jump_forwards_res == 0
"         return "\<TAB>"
"       endif
"     endif
"   endif
"   return ""
" endfunction
"
" function! g:UltiSnips_Reverse()
"   call UltiSnips#JumpBackwards()
"   if g:ulti_jump_backwards_res == 0
"     return "\<C-P>"
"   endif
"
"   return ""
" endfunction
"
" "
" if !exists("g:UltiSnipsJumpForwardTrigger")
"   let g:UltiSnipsJumpForwardTrigger = "<tab>"
" endif
" if !exists("g:UltiSnipsJumpBackwardTrigger")
"   let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" endif
"
" au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger     . " <C-R>=g:UltiSnips_Complete()<cr>"
" au InsertEnter * exec "inoremap <silent> " .     g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"

" Mapping----------------------------------------
" -----------------------------------------------
" :norenmap <>
" map <c-n> :NERDTreeToggle<CR>
noremap <F3> :NERDTreeToggle<CR>
inoremap <F3> <ESC>:NERDTreeToggle<CR>
autocmd VimEnter * wincmd p


if has('gui_running')
    " macvim 的滚动（scrollbar）条颜色不搭，关闭之
    set guioptions-=L
    set guioptions-=r
endif


let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

set pastetoggle=<F12>

" let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
" packadd! vimspector
syntax enable
" filetype plugin indent on

" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
" set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>n  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>p  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>r  :<C-u>CocListResume<CR>





" :CocInstall coc-snippets install coc.nvim snippet
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
