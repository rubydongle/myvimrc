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
Plug 'Yggdroot/LeaderF'
Plug 'majutsushi/tagbar'
Plug 'lfv89/vim-interestingwords'
Plug 'itchyny/vim-cursorword'
Plug 'ycm-core/YouCompleteMe'
" invoke it from within Vim using the :YcmGenerateConfig or :CCGenerateConfig commands to generate a config file for the current directory
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
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

" @NerdTree
" -------------------------------------------------------------------------------
"                                      |
map <F3> :NERDTreeToggle<CR>
nnoremap <silent> <leader>nt :NERDTreeToggle<CR>
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
" let Tlist_Use_Right_Window=1
" let Tlist_Auto_Open=1
" map <F2> :TlistToggle<CR>
"                                      |
" -------------------------------------------------------------------------------

" @TagBar
" Toggle here if use tagbar
map <F2> :TagbarToggle<CR>
nnoremap <silent> <leader>tt :TagbarToggle<CR>
let g:tagbar_autofocus = 1
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
" let g:ycm_confirm_extra_conf = 0
let g:ycm_key_invoke_completion = '<c-z>'
" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" 在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" only detect these files
" let g:ycm_filetype_whitelist = {
" 			\ "c":1,
" 			\ "cpp":1,
" 			\ "objc":1,
" 			\ "sh":1,
" 			\ "zsh":1,
" 			\ "zimbu":1,
" 			\ }
"                                      |
" -------------------------------------------------------------------------------

filetype plugin on
set number
