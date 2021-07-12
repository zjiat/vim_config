" ===================================================
" VIM 自定义 markdown 操作快捷键
"
" *** 字体变蓝
" visual 模式选中字体，111
"
" *** 字体下划线
" visual 模式选中字体，222
"
" *** 大空格
" normal 模式，888
"
" *** 小空格
" normal 模式，999
"
"
" *** 行内代码
" normal 模式，,+q
"
"" *** 代码块
" normal 模式，,+c
" 
"" *** 图片
" normal 模式，,+p
" 
" *** 插入剪切板中图片
" normal 模式，,+i
"
" *** 链接
" normal 模式，,+l
"
" *** 表格自动配置
" normal 模式，,+tm
"
" ===================================================




" ===================================================
" Vundle Settings 
" ===================================================

set nocompatible              " 这是必需的，去除VI一致性
filetype off                  " 这是必需的 
 
 
" 在此设置运行时路径。即设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
" vundle初始化 
call vundle#begin()  
 
" 另一种选择, 指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')
 
 
" 让vundle管理插件版本,必须。" 这应该始终是第一个
Plugin 'VundleVim/Vundle.vim'
 
 
" ============================================================
" 插件安装说明 
" ============================================================

" 以下范例用来支持不同格式的插件安装.
" 请将安装插件的命令放在vundle#begin和vundle#end之间.

" Github上的插件
" 格式为 Plugin '用户名/插件仓库名'
" Plugin 'tpope/vim-fugitive'
 
" 来自 http://vim-scripts.org/vim/scripts.html 的插件
" Plugin '插件名称' 实际上是 Plugin 'vim-scripts/插件仓库名' 只是此处的用户名可以省略
" Plugin 'L9'
 
" 由Git支持但不再github上的插件仓库 Plugin 'git clone 后面的地址'
" Plugin 'git://git.wincent.com/command-t.git'
" 本地的Git仓库(例如自己的插件) Plugin 'file:///+本地插件仓库绝对路径'
" Plugin 'file:///home/gmarik/path/to/plugin'
 
" 插件在仓库的子目录中.
" 正确指定路径用以设置runtimepath. 以下范例插件在sparkup/vim目录下
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
 
" 安装L9，如果已经安装过这个插件，可利用以下格式避免命名冲突
" Plugin 'ascenator/L9', {'name': 'newL9'}

" =====  插件安装应用 =========================================

" === color theme support ===================

Plugin 'tomasr/molokai'
" solarized theme
Plugin 'altercation/vim-colors-solarized'   
Plugin 'morhetz/gruvbox'


" === markdown support ======================

" highlight markdown syntax
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" instant display in browser
Plugin 'suan/vim-instant-markdown'

" Markdown Preview for (Neo)vim
Plugin 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }


" table formatting, especially for markdown
Plugin 'dhruvasagar/vim-table-mode'

" Distraction-free writing
Plugin 'junegunn/goyo.vim'
Plugin 'amix/vim-zenroom2'

" image paste
Plugin 'ferrine/md-img-paste.vim'

" status bar embellishment
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" =============================================================

" 你的所有插件需要在下面这行之前
call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
 
" 忽视插件改变缩进,可以使用以下替代:
"filetype plugin on
"
" 常用的命令
" :PluginList       - 列出所有已配置的插件
" :PluginInstall     - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
"
" 查阅 :h vundle 获取更多细节和wiki以及FAQ
 







 
" 将自己的非插件片段放在这行之后（也就是上面的所有全部放在文件所有内容之前。）


" ==================================================
" ==================================================
"
" Global Settings
"
" ==================================================
" ==================================================

" =========================================
" Good habit -- disable-arrowkeys
" =========================================

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>


" =========================================
" Basic Settings 
" =========================================

" Enable syntax hightlighting.
syntax on

" set number
" Automatically indent when adding a curly bracket, etc.
set smartindent

" set tab
set tabstop=4
set shiftwidth=4

set nofoldenable

set hls
" set inc


" diable modifyOtherKeys mode 
" for strange character [>4;2m and [>4;m
let &t_TI = ""
let &t_TE = ""



" =========================================
" Extension Settings for Markdown
" =========================================

" Extension for useful html tags
" define key mapping
"
" for visual mode key mapping
" 111 for blue color font in visual mode
autocmd Filetype markdown vnoremap 111 c<font color="#0000dd"><c-r>"</font><esc>
" 222 for font underline in visual mode
autocmd Filetype markdown vnoremap 222 c<u><c-r>"</u><esc>
" 333 for html link in visual mode
autocmd Filetype markdown vnoremap 333 c[<c-r>"]<esc>a[<c-r>"]<esc>o<esc>o[<c-r>"]:<esc>
"
" for normal mode key mapping
" 999 for bigspace in normal mode
autocmd Filetype markdown nnoremap 999 i&emsp;<esc>l
" 888 for smallspace in normal mode
autocmd Filetype markdown nnoremap 888 i&nbsp;<esc>l

" set anchor, use anchor to move
let maplocalleader=","
" 设置人工锚点 <++>
autocmd Filetype markdown inoremap <buffer> <silent> <localleader>,, <++>
" 寻找下一个锚点
autocmd Filetype markdown nnoremap <buffer> <silent> <localleader>f <Esc>/<++><CR>:nohlsearch<CR>c4l
" 行内代码
autocmd Filetype markdown nnoremap <buffer> <silent> <localleader>q i`` <++><Esc>F`i
" 代码块
autocmd Filetype markdown nnoremap <buffer> <silent> <localleader>c i```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
" 图片
autocmd Filetype markdown nnoremap <buffer> <silent> <localleader>p i![](<++>) <++><Esc>F[a
" 链接
autocmd Filetype markdown nnoremap <buffer> <silent> <localleader>l i[](<++>) <++><Esc>F[a


" image paste
autocmd FileType markdown nnoremap <buffer><silent> <localleader>i :call mdip#MarkdownClipboardImage()<CR>



" Extension for Table of Content
" define <span> tag automatical generation for pandoc TOC 
function TOC()
	execute "normal! /\\v##*\ \\zs.+\<cr>"
	execute "normal! \"ay$"
	execute "normal! /\\V[\<c-r>a](#\\zs\\.\\*)\<cr>"
	execute "normal! \"byt)"
	execute "normal! \<c-o>"
	execute "normal! i<span id=\"\<c-r>b\">\<esc>"
	execute "normal! A</span>\<esc>"
endfunction

"function  A()
	"execute "normal! /\\v##*\ \\zs.+\<cr>"
	"execute "normal! \"ay$"
"endfunction

"function  B()
	"execute "normal! /\\V[\<c-r>a](#\\zs\\.\\*)\<cr>"
	"execute "normal! \"byt)"
"endfunction
"function  C()
	"execute "normal! \<c-o>"
"endfunction
"function  D()
	""execute "normal! i<span id=\"\<c-r>b\">\<esc>"
	"execute "normal! A</span>\<esc>"
"endfunction
"function  D1()
	"execute "normal! C"
	"execute "normal! <span id=\"\<c-r>b\">\<c-r>a</span>\<esc>"
"endfunction
"function  E()
	"execute "normal! \<c-o>"
"endfunction





" =====================================================
"
" Plugin Settings
"
" =====================================================

" ==================================================
" Plugin Settings -- vim-airline 
" scope: for global
" ==================================================

let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif

" 关闭状态显示空白符号计数
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'


" ==================================================
" Plugin Setting -- Goyo 
" scope: for global
" ==================================================

" set view size
let g:goyo_width=100 	
" (default: 80)
let g:goyo_height=100	
" (default: 85%)

" set shortcut key
nnoremap <silent> <leader>z :Goyo<cr>


" ==================================================
" Plugin Setting -- vim-instant-markdown
" scope: for global
" ==================================================

" update the display in realtime or not
let g:instant_markdown_slow = 1
" automatically launch the preview window when open a markdown file
" command is `InstantMarkdownPreview`
let g:instant_markdown_autostart = 0
" autocmd Filetype markdown nnoremap <buffer>  <localleader>imp   :InstantMarkdownPreview<CR>
autocmd Filetype markdown nnoremap <buffer>  <F8>   :InstantMarkdownPreview<CR>

" browser is detected by instant-markdown-d depending on the OS. 
" let g:instant_markdown_browser = "opera --new-window" 


" ==================================================
" Plugin Setting -- Markdown Preview for (Neo)vim
" scope: for global
" ==================================================

" autocmd Filetype markdown nnoremap <buffer>  <localleader>nmp   :MarkdownPreview<CR>
autocmd Filetype markdown nnoremap <buffer>  <F6>   :MarkdownPreview<CR>

" specify browser to open preview page
" default: ''
let g:mkdp_browser = 'firefox'


" ==================================================
" Plugin Setting -- vim-table-mode
" scope: for global
" ==================================================

" 设置vim-table-mode表格模式开启shortcut
autocmd Filetype markdown nnoremap <buffer>  <localleader>tm  :TableModeToggle<CR>





" ==================================================
" Dealing messy code when encountering chinese characters
" ==================================================

set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030




" ==================================================
"
" Only for GVim Settings
"
" ==================================================

if has("gui_running")

" ===================================
" gvim appearence settings
" remove the toolbar of gvim
" m -- menubar
" T -- Toolbar
" B -- bookmark bar(where?)
" r -- scroll bar at right
" ===================================
	set go-=T

" ===================================
" Gvim window size
" ===================================
	set lines=48 columns=99

" ===================================
" Gvim color scheme settings
" ===================================
    set background=light
"      set t_Co=256  
"      colorscheme solarized
"	colorscheme molokai
	colorscheme gruvbox
" ===================================
" vim-airline color scheme settings
" ===================================
	let g:airline_theme="sol" 


" ===================================
" fonts settings
" 在Gvim设置英文用guifont， 中文使用guifontwide 
" 字体设置格式：
" linux : Ubuntu\ Mono\ derivative\ Powerline\ 11
" win   : Courier:14
" ===================================
	set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 11
"	set guifont=hack\ 10
"	set guifont=Anonymous\ Pro\ for\ Powerline\ 11
"	set guifontwide=Ubuntu_Mono:h11


" =========================================
" gvim中加入windows操作习惯
" Ctrl+S/Ctrl+Z/Ctrl+C/Ctrl+V
" https://www.lulinux.com/archives/581
" remove Ctrl+F in mswin.vim
" =========================================
	source $VIMRUNTIME/mswin.vim

else

endif


