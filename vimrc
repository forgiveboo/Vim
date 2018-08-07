" 插件列表
call plug#begin('~/.vim/plugged')
Plug 'SirVer/ultisnips'                                 " 代码片段补全
Plug 'scrooloose/nerdtree'                              " 文件树
Plug 'tomasr/molokai'                                   " 主题
Plug 'w0rp/ale'                                         " 语法检查
Plug 'luochen1990/rainbow'                              " 彩虹括号
Plug 'jiangmiao/auto-pairs'                             " 自动补全括号
Plug 'scrooloose/nerdcommenter'                         " 快速注释
Plug 'Valloric/YouCompleteMe'                           " 代码补全
Plug 'skywind3000/asyncrun.vim'                         " 编译运行
call plug#end()

" 快捷键设置
let mapleader=";"				                        " 定义快捷键的前缀，即<Leader>
nnoremap <Leader>lw <C-W>l		                        " 跳转至右方的窗口
nnoremap <Leader>hw <C-W>h			                    " 跳转至左方的窗口
nnoremap <Leader>kw <C-W>k			                    " 跳转至上方的子窗口
nnoremap <Leader>jw <C-W>j			                    " 跳转至下方的子窗口
nmap <Leader>M %				                        " 定义快捷键在结对符之间跳转

" 界面设置
set laststatus=2				                        " 总是显示状态栏
set ruler					                            " 显示光标当前位置
set number					                            " 开启行号显示
set cursorline					                        " 高亮显示当前行/列
set cursorcolumn
set hlsearch					                        " 高亮显示搜索结果
set nowrap					                            " 禁止折行
let g:rehash256 = 1
colorscheme molokai

" 文件设置
filetype on					                            " 开启文件类型侦测
filetype plugin on				                        " 根据侦测到的不同类型加载对应的插件

" 功能设置
autocmd BufWritePost $MYVIMRC source $MYVIMRC	        " 让配置变更立即生效
set incsearch					                        " 开启实时搜索功能
set nocompatible				                        " 关闭兼容模式
set wildmenu					                        " vim 自身命令行模式智能补全
syntax enable					                        " 开启语法高亮功能
syntax on					                            " 允许用指定语法高亮配色方案替换默认方案

" 代码相关设置
filetype indent on				                        " 自适应不同语言的智能缩进
set expandtab					                        " 将制表符扩展为空格
set tabstop=4					                        " 设置编辑时制表符占用空格数
set shiftwidth=4				                        " 设置格式化时制表符占用空格数
set softtabstop=4				                        " 让 vim 把连续数量的空格视为一个制表符
    " 快速运行Python
nnoremap <F5> :call CompileRunGcc()<cr>

func! CompileRunGcc()
          exec "w"
          if &filetype == 'python'
                  if search("@profile")
                          exec "AsyncRun kernprof -l -v %"
                          exec "copen"
                          exec "wincmd p"
                  elseif search("set_trace()")
                          exec "!python3 %"
                  else
                          exec "AsyncRun -raw python3 %"
                          exec "copen"
                          exec "wincmd p"
                  endif
          endif

endfunc

" 各插件设置
    "UltiSnips"      代码补全
    "NERDtree"       文件浏览
nmap <Leader>fl :NERDTreeToggle<CR>                     " 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
let NERDTreeWinSize=25                                  " 设置NERDTree子窗口宽度
let NERDTreeWinPos="right"                              " 设置NERDTree子窗口位置
let NERDTreeShowHidden=1                                " 显示隐藏文件
let NERDTreeMinimalUI=1                                 " NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeAutoDeleteBuffer=1                          " 删除文件时自动删除文件对应 buffer
    "YCM"           代码补全
let g:ycm_key_invoke_completion = '<c-z>'               " 触发语义补全
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }                                         " 语义补全触发条件
set completeopt=menu,menuone                            " 关闭函数原型预览
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0                       " 关闭诊断信息
    "AsyncRun"      快速编译运行
let g:asyncrun_open = 6                                 " 自动打开 quickfix window ，高度为 6
let g:asyncrun_bell = 1                                 " 任务结束时候响铃提醒
