"
" 插件安装
"
call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/vim-plug'
Plug 'jacoborus/tender.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree' 
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'https://github.com/vim-scripts/fcitx.vim.git'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-markdown'
Plug 'mhartington/oceanic-next'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/yanil'
Plug 'glepnir/dashboard-nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'hzchirs/vim-material'
Plug 'tomasr/molokai'
call plug#end()

"
" 基本设置
"
set autoindent
set encoding=utf-8
set noswapfile
set laststatus=2
set number
let g:material_style='palenight'
set background=dark
colorscheme vim-material
" colorscheme tender
colorscheme OceanicNext
" colorscheme molokai
syntax enable
" set t_Co=256
set cursorline
set tabstop=4
filetype plugin on

"
" 插件设置
"
" coc.vim
set nobackup
set nowritebackup
" nerdtree
let g:NERDTreeWinSize=20
" autocmd VimEnter * NERDTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
\ quit | endif
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
nnoremap <C-f> :NERDTreeToggle<CR>
nnoremap <C-a> :NERDTreeFocus<CR>
" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" nerdcommenter
let g:NERDAltDelims_java = 1
" indent
let g:indentLine_color_term = 239
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" vim-markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'java']
let g:markdown_syntax_conceal = 0
let g:markdown_minlines = 100
" oceanicnext
" if (has("termguicolors"))
"		set termguicolors
" endif
" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
" vim-devicons
set guifont=Fira\ Code\ Nerd\ Font\
" dashboard
let g:dashboard_default_executive = 'fzf'
let g:mapleader="<Space>"
nmap <Leader>sl :<C-u>SessionLoad<CR>
" molokai
" let g:molokai_original = 1
" let g:rehash256 = 1
"一键运行
"
nmap <Space> :call RunQuck()<CR>
function RunQuck()
		exec "w"
		if &filetype == 'java'
				exec "!javac %"
				exec "!java %<"
		elseif &filetype == 'python'
				exec "!python %"
		endif
endfunction
