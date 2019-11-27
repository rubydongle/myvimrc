" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
set hlsearch

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" @vim-plug
" https://github.com/junegunn/vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" 美化NERDTree
" 要安装字体Droid Sans Mono Nerd Font
" https://github.com/ryanoasis/nerd-fonts#patched-fonts
" https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/DroidSansMono
" 然后Terminal或guifont设置字体
Plug 'ryanoasis/vim-devicons'
" Plug 'jistr/vim-nerdtree-tabs'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" 美化NERDTree结束
"
Plug 'Yggdroot/LeaderF'
Plug 'lfv89/vim-interestingwords'
Plug 'itchyny/vim-cursorword'

" Plug 'ycm-core/YouCompleteMe'
" invoke it from within Vim using the :YcmGenerateConfig or :CCGenerateConfig commands to generate a config file for the current directory
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

Plug 'liuchengxu/vista.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'majutsushi/tagbar'

" 状态 status line
" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'junegunn/gv.vim'
" Plug 'airblade/vim-gitgutter'
call plug#end()

cscope add cscope.out
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" @airline
" -------------------------------------------------------------------------------
"                                      |
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '|'
let g:airline#extensions#tabline#left_alt_sep = '>|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved' " default jsformatter unique_tail unique_tail_improved

let g:airline_theme='wombat'
"                                      |
" -------------------------------------------------------------------------------

" @gv.vim
" -------------------------------------------------------------------------------
"                                      |
nnoremap <silent> <leader>gv :GV<CR>
"                                      |
" -------------------------------------------------------------------------------

" @vim-signify
" -------------------------------------------------------------------------------
"                                      |
set updatetime=100
"                                      |
" -------------------------------------------------------------------------------

" @indentLine
" -------------------------------------------------------------------------------
"                                      |
nnoremap <silent> <leader>it :IndentLinesToggle<CR>
" let g:indentLine_char='┆'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" Vim
" let g:indentLine_color_term = 239
"
" let g:indentLine_concealcursor = 'inc'
" let g:indentLine_conceallevel = 1

" GVim
" let g:indentLine_color_gui = '#A4E57E'

" none X terminal
" let g:indentLine_color_tty_light = 7 " (default: 4)
" let g:indentLine_color_dark = 1 " (default: 2)

" Background (Vim, GVim)
let g:indentLine_bgcolor_term = 202
let g:indentLine_bgcolor_gui = '#FF5F00'
let g:indentLine_enabled = 0 "可关闭indentLine插件
"映射到ctrl+i键 
map <C-i> :IndentLinesToggle<CR>

"                                      |
" -------------------------------------------------------------------------------

" @NerdTree
" -------------------------------------------------------------------------------
"                                      |
"https://segmentfault.com/a/1190000015143474
map <F3> :NERDTreeToggle<CR>
nnoremap <silent> <leader>nt :NERDTreeToggle<CR>

" autocmd vimenter * NERDTree  "自动开启Nerdtree
"let g:NERDTreeWinSize = 25 "设定 NERDTree 视窗大小
"let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
"打开vim时如果没有文件自动打开NERDTree
" autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"设置树的显示图标
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" let NERDTreeIgnore = ['\.pyc$', '\.swp']  " 过滤所有.pyc文件不显示
" let g:NERDTreeShowLineNumbers=1  " 是否显示行号
" let g:NERDTreeHidden=0     "不显示隐藏文件
"Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" 按r按键刷新内容
"                                      |
" -------------------------------------------------------------------------------

" @LeaderF
" -------------------------------------------------------------------------------
"                                      |
nnoremap <silent> <leader>fu :LeaderfFunction<CR>
nnoremap <silent> <leader>fi :LeaderfFile<CR>
"                                      |
" -------------------------------------------------------------------------------

" @Tlist
" -------------------------------------------------------------------------------
"                                      |
" Toggle here if use tlist
let Tlist_Use_Right_Window=1
" let Tlist_Auto_Open=1
nnoremap <silent> <leader>tl :TlistToggle<CR>
map <F2> :TlistToggle<CR>
"                                      |
" -------------------------------------------------------------------------------

" @TagBar
" Toggle here if use tagbar
" 在tagbar一栏内输入F1可以查看快捷方式：
"
" -------- general ----------
" <CR>: 回车跳到定义位置
" p: 跳到定义位置，但光标仍然在tagbar原位置
" P: 打开一个预览窗口显示标签内容，如果在标签处回车跳到vim编辑页面内定义处，则预览窗口关闭
" <C-N>: 跳到下一个标签页的顶端
" <C-P>: 跳到上一个（或当前）标签页的顶端
" <Space>: 底行显示标签原型
"
" ---------- Folds ----------
" + 展开标签内容
" -  折叠标签内容

" *  展开所有标签
" = 折叠所有标签
" o 在折叠与展开间切换，按o键，折叠标签，再按一次o，则展开标签，如此来回切换
"
" ---------- Misc -----------
" s: 切换排序，一次s，则让标签按字典排序，再一次s，则按照文件内出现顺序排序
" x: 是否展开tagbar标签栏，x展开，再一次x，则缩小标签栏
" <F1>: 切换快捷键帮助页面，F1一次出现快捷键帮助页面，在一次F1，快捷键帮助页面隐藏。
map <F8> :TagbarToggle<CR>
nnoremap <silent> <leader>tb :TagbarToggle<CR>
let g:tagbar_autofocus = 1        "这是tagbar一打开，光标即在tagbar页面内，默认在vim打开的文件内
" key s sort result
let g:tagbar_sort = 0  
let g:tagbar_width = 30                                     "设置tagbar的宽度为30列，默认40
" let g:tagbar_left = 1                                          "让tagbar在页面左侧显示，默认右边
"                                      |
" -------------------------------------------------------------------------------

" @vim-interestingwords
" -------------------------------------------------------------------------------
"                                      |
" nnoremap <silent> <leader>k :call InterestingWords('n')<cr>
" nnoremap <silent> <leader>K :call UncolorAllWords()<cr>
" nnoremap <silent> n :call WordNavigation('forward')<cr>
" nnoremap <silent> N :call WordNavigation('backward')<cr>
"                                      |
" -------------------------------------------------------------------------------

" @YouCompleteMe
" -------------------------------------------------------------------------------
"                                      |
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
" https://zhuanlan.zhihu.com/p/33046090
" let g:ycm_add_preview_to_completeopt = 0
" no need to show code issues
let g:ycm_show_diagnostics_ui = 0
" invoke complete key, default is <c-space>, which is conflicts with input method
" switcher, so change it to ctrl-z
" set global ycm extra conf file position.
" let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
" <ctrl-z>
let g:ycm_key_invoke_completion = '<c-z>'
" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" 在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" only detect these files
" let g:ycm_filetype_whitelist = {
" 			\ "c":1,
" 			\ "h":1,
" 			\ "cpp":1,
" 			\ "cc":1,
" 			\ "objc":1,
" 			\ "sh":1,
" 			\ "zsh":1,
" 			\ "java":1,
" 			\ }
"                                      |
" -------------------------------------------------------------------------------

" @vista
" -------------------------------------------------------------------------------
"                                      |
nnoremap <silent> <leader>v :Vista!!	<cr>
" let g:vista_default_executive = 'ctags'
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
"                                      |
" -------------------------------------------------------------------------------

"  @lightline
" -------------------------------------------------------------------------------
"                                      |
" let g:lightline = {
"      \ 'colorscheme': 'wombat',
"      \ }
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'method' ] ]
      \ },
      \ 'component_function': {
      \   'method': 'NearestMethodOrFunction'
      \ },
      \ }
set laststatus=2
"                                      |
" -------------------------------------------------------------------------------

"filetype plugin on
"set number
" :set all命令查看状态
set number

" @indent
" https://blog.csdn.net/ludonghai715/article/details/5657712
" kernel
" :set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
" java
" :set softtabstop=4 shiftwidth=4 expandtab
" set noautoindent
" set nocindent
" set smartindent
"
" 设置缩进宽度
" set shiftwidth=4
" set tabstop=4
" set expandtab
"
" 通过以下设置，每次点击Tab键，将增加宽度为8列的Tab缩进。
" :set tabstop=8
" :set softtabstop=8
" :set shiftwidth=8
" :set noexpandtab
"
"使用以下设置，每次点击Tab键，增加的缩进将被转化为4个空格。
" set smartindent
" set tabstop=4
" set softtabstop=4
" set shiftwidth=4
" set noexpandtab
" expandtab选项，用来控制是否将Tab转换为空格

" @粘贴
" 按<F7>进入PASTE模式
set pastetoggle=<F7>
" 这样减少了一个快捷键的占用，使用起来也更方便一些。
" set paste，然后粘贴，然后再set nopaste
"
" 如果gvim启动用dessert颜色集
"
let g:iswindows = 0
let g:islinux = 0
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:islinux = 1
endif

if has("gui_running")
    colorscheme desert
    " linux
    if (g:islinux)
        " set guifont=Ubuntu\ Mono\ 14
        set guifont=DroidSansMono\ Nerd\ Font\ 14
    endif
    " windows
    " set guifont = Courier:h14
endif

" @tab  操作
" 打开和关闭tab,NerdTree中通过t操作的文件是在tab中打开的
" :tabe[dit] {file}   edit specified file in a new tab
" :tabf[ind] {file}   open a new tab with filename given, searching the 'path' to find it
" :tabc[lose]         close current tab
" :tabc[lose] {i}     close i-th tab
" :tabo[nly]          close all other tabs (show only the current tab)
" 移动标签
" :tabs         list all tabs including their displayed window
" :tabm 0       move current tab to first
" :tabm         move current tab to last
" :tabm {i}     move current tab to position i+1
" 跳转标签
" :tabn         go to next tab
" :tabp         go to previous tab
" :tabfirst     go to first tab
" :tablast      go to last tab
" 在正常模式（normal）下，还可以使用快捷键：
" 快捷键！！！
" gt            go to next tab
" gT            go to previous tab
" {i}gt         go to tab in position i
"
" noremap <C-L> <Esc>:tabnext<CR>
" noremap <C-H> <Esc>:tabprevious<CR>

nnoremap <silent> ct :tabclose<CR>
nnoremap <silent> nt :tabnext<CR>
nnoremap <silent> pt :tabprevious<CR>
