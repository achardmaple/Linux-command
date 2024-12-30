set encoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese
set fileencoding=utf-8
set termencoding=utf-8
set nu

imap jj <Esc>

" --------------------缩进--------------------
nnoremap <C-p> <C-i>  " ctrl+p 代替 ctrl+i 的功能（光标位置前进）
nmap <TAB> V>
nmap <S-TAB> V<
vmap <TAB> >gv
vmap <S-TAB> <gv

" -------------------切窗口-------------------
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" ---------------移动到行首行尾---------------
noremap H ^
noremap L $

" -----------------快速跳转行-----------------
noremap J 5j
noremap K 5k

" ----------------Linux复制粘贴---------------
vnoremap <C-c> y
inoremap <C-v> <Esc>pa

" --------------------保存--------------------
inoremap <C-s> <Esc>:w<CR>a
nnoremap <C-s> :w<CR>

" -------------Windows下共用剪贴板------------
if has('win32') || has('win64')
	nnoremap yy yy:let @* = @"<CR>
	nnoremap yw yw:let @* = @"<CR>
	vnoremap y y:let @* = @"<CR>

	nnoremap <Leader>p "*p
	nnoremap <Leader>P "*P
	vnoremap <Leader>p "*p
	vnoremap <Leader>P "*P

	" 复制粘贴
	vnoremap <C-c> "*y
	inoremap <C-v> <Esc>"*pa
endif

" -----------------打开新标签-----------------
nnoremap gn :tabnew
nnoremap gc :tabclose<CR>
nnoremap gC :tabonly<CR>

" --------------------插件--------------------
call plug#begin()

Plug 'preservim/nerdtree'  " 目录树
Plug 'ryanoasis/vim-devicons'  " 目录树图标
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " 自动补全
Plug 'jiangmiao/auto-pairs'  " 自动括号
Plug 'sheerun/vim-polyglot'  " 高亮
Plug 'frazrepo/vim-rainbow'  " 括号颜色
Plug 'preservim/nerdcommenter'  " 批量注释
Plug 'airblade/vim-gitgutter'  " git更改高亮
Plug 'vim-autoformat/vim-autoformat'  " 格式化
Plug 'voldikss/vim-translator'  " 翻译
Plug 'tmhedberg/SimpylFold'  " 代码折叠
Plug 'lervag/vimtex'  " Latex
Plug 'luozhiya/fittencode.nvim'  " AI补全
Plug 'projekt0n/github-nvim-theme'  " GitHub主题
Plug 'itchyny/lightline.vim'  " 状态栏
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " 模糊查询
Plug 'junegunn/fzf.vim'  " 模糊查询
Plug 'petertriho/nvim-scrollbar'  " 滚动条
Plug 'gen740/SmoothCursor.nvim'  " 左侧光标
Plug 'voldikss/vim-browser-search'  " 浏览器搜索

" 中文输入
Plug 'ZSaberLv0/ZFVimIM'
Plug 'ZSaberLv0/ZFVimJob' " 提升词库加载性能
Plug 'ZSaberLv0/ZFVimGitUtil' " 定期自动清理词库 push 历史
Plug 'https://gitee.com/Jacken_Wu/ZFVimIM_pinyin_base' " 我的词库
Plug 'ZSaberLv0/ZFVimIM_openapi' " 百度云输入法

call plug#end()

" ----------------NERDTree的配置---------------
" autocmd vimenter * NERDTree  "自动开启Nerdtree
" let g:NERDTreeWinSize = 25 "设定 NERDTree 视窗大小
" 开启/关闭nerdtree快捷键
map <silent> <C-f> :NERDTreeToggle<CR>
" let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
" 打开vim时如果没有文件自动打开NERDTree
autocmd vimenter * if !argc()|NERDTree|endif
" 当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 设置树的显示图标
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeIgnore = ['\.pyc$']  " 过滤所有.pyc文件不显示
let g:NERDTreeShowLineNumbers=1  " 是否显示行号
let g:NERDTreeHidden=0     " 不显示隐藏文件
" Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" -------------------批量注释-------------------
let g:NERDCreateDefaultMappings = 0
noremap <Leader>c :call nerdcommenter#Comment('', 'Toggle')<CR>
inoremap <Leader>c <Esc>:call nerdcommenter#Comment('', 'Toggle')<CR>a

" -----------------coc.nvim配置-----------------
" 使用 ctrl + j 向下选择自动补全的候选词
inoremap <silent><expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
" 使用 ctrl + k 向上选择自动补全的候选词
inoremap <silent><expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
" 按 ctrl + l 确认所选择的候选词
inoremap <silent><expr> <C-l> coc#pum#visible() ? coc#pum#confirm() : "\<C-l>"
" 定义跳转
nnoremap gd <Plug>(coc-definition)
nnoremap gD <Plug>(coc-declaration)
nnoremap gy <Plug>(coc-type-definition)
nnoremap gi <Plug>(coc-implementation)
nnoremap gr <Plug>(coc-references)

" ------------------autoformat------------------
nnoremap <Leader>f :Autoformat<CR>
let g:formatters_xml = ['xml']
if has('win32') || has('win64')
	let g:formatdef_xml = '"xmllint"'
elseif has('Unix')
	let g:formatdef_xml = '"xmllint --format -"'
endif
let g:formatdef_python = '"autopep8 -"'
let g:formatters_python = ['python']
let g:formatdef_json = '"jq ."'
let g:formatters_json = ['json']

" -----------------中文输入配置-----------------
let g:ZFVimIM_pinyin_gitUserEmail='user@example.com'
let g:ZFVimIM_pinyin_gitUserName='user_name'
let g:ZFVimIM_pinyin_gitUserToken='xxxxxxxxxx'
" 中文标点
let g:ZFVimIM_symbolMap = {
            \   ' ' : [''],
            \   '`' : ['·'],
            \   '!' : ['！'],
            \   '$' : ['￥'],
            \   '^' : ['……'],
            \   '-' : [''],
            \   '_' : ['——'],
            \   '(' : ['（'],
            \   ')' : ['）'],
            \   '[' : ['【'],
            \   ']' : ['】'],
            \   '<' : ['《'],
            \   '>' : ['》'],
            \   '\' : ['、'],
            \   '/' : ['、'],
            \   ';' : ['；'],
            \   ':' : ['：'],
            \   ',' : ['，'],
            \   '.' : ['。'],
            \   '?' : ['？'],
            \   "'" : ['‘', '’'],
            \   '"' : ['“', '”'],
            \   }

" ---------------------翻译---------------------
let g:translator_default_engines=['youdao', 'bing']
nmap <silent> <Leader>t <Plug>TranslateW
vmap <silent> <Leader>t <Plug>TranslateWV

" ------------------FittenCode------------------
nnoremap <Leader>a :Fitten start_chat<CR>
vnoremap <Leader>a :Fitten explain_code<CR>
nnoremap <Leader>q :Fitten toggle_chat<CR>

" --------------------theme---------------------
:colorscheme github_dark_high_contrast

" -------------------模糊查询-------------------
nnoremap <C-m> :Marks<CR>
nnoremap <C-n> :Jumps<CR>
nnoremap <C-t> :Files<CR>

" ------------------浏览器搜索------------------

nmap <silent> <Leader>s <Plug>SearchNormal
vmap <silent> <Leader>s <Plug>SearchVisual

" -------------------lua脚本--------------------
lua <<EOF
require('fittencode').setup()  -- AI补全
require('scrollbar').setup()  -- 滚动条
require('smoothcursor').setup({
	fancy = {
		enable = true,
		head = { cursor = "▷", texthl = "SmoothCursor", linehl = nil },
		body = {
			{ cursor = "󰝥", texthl = "SmoothCursorAqua" },
			{ cursor = "󰝥", texthl = "SmoothCursorAqua" },
			{ cursor = "●", texthl = "SmoothCursorAqua" },
			{ cursor = "●", texthl = "SmoothCursorAqua" },
			{ cursor = "•", texthl = "SmoothCursorAqua" },
			{ cursor = "•", texthl = "SmoothCursorAqua" },
			{ cursor = ".", texthl = "SmoothCursorAqua" },
		},
		tail = { cursor = ".", texthl = "SmoothCursorAqua" }
	}
})  -- 左侧光标
EOF
