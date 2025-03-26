set encoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese
set fileencoding=utf-8
set termencoding=utf-8
set nu
set noshowmode

imap jj <Esc>
tnoremap jj <C-\><C-n>

" --------------------缩进--------------------
nnoremap <C-p> <C-i>  " ctrl+p 代替 ctrl+i 的功能（光标位置前进）
nmap <TAB> V>
nmap <S-TAB> V<
vmap <TAB> >gv
vmap <S-TAB> <gv

" ------------------分割窗口------------------
nnoremap <Leader>% :vsp<CR><C-w>l
nnoremap <Leader>" :sp<CR><C-w>j

" -------------------切窗口-------------------
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" --------------按显示行移动光标--------------
nnoremap j gj
nnoremap k gk

" ---------------移动到行首行尾---------------
noremap H g^
noremap L g$

" -----------------快速跳转行-----------------
noremap J 5gj
noremap K 5gk

" --------------------保存--------------------
inoremap <C-s> <Esc>:w<CR>a
nnoremap <C-s> :w<CR>

" -----Windows系统/Linux tmux 共用剪贴板------
nnoremap yy yy:let @* = @"<CR>
nnoremap yw yw:let @* = @"<CR>
vnoremap y y:let @* = @"<CR>
nnoremap <Leader>y :let @* = @"<CR>
nnoremap <Leader>p "*p
nnoremap <Leader>P "*P
vnoremap <Leader>p "*p
vnoremap <Leader>P "*P
inoremap <C-v> <Esc>"*pa

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
Plug 'xiyaowong/transparent.nvim'  " 透明背景
Plug 'itchyny/lightline.vim'  " 状态栏
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " 模糊查询
Plug 'junegunn/fzf.vim'  " 模糊查询
Plug 'rking/ag.vim'  " 关键词搜索
Plug 'petertriho/nvim-scrollbar'  " 滚动条
Plug 'gen740/SmoothCursor.nvim'  " 左侧光标
Plug 'voldikss/vim-browser-search'  " 浏览器搜索
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }  " Markdown预览
Plug 'kamykn/spelunker.vim'  " 单词拼写检查
Plug 'jpalardy/vim-slime'  " 发送代码到REPL

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
" 配置对应环境变量
let g:ZFVimIM_pinyin_gitUserEmail=getenv('GITEE_USER_EMAIL')
let g:ZFVimIM_pinyin_gitUserName=getenv('GITEE_USER_NAME')
let g:ZFVimIM_pinyin_gitUserToken=getenv('GITEE_TOKEN')
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

" ------------------Visual 颜色-----------------
:highlight Visual guibg=#a8d1d1 guifg=#c71f5c

" ----------------------Ag----------------------
nnoremap <Leader>/ :Ag<Space>

" -------------------模糊查询-------------------
nnoremap <C-m> :Marks<CR>
nnoremap <C-n> :Jumps<CR>
nnoremap <C-t> :Files<CR>

" ------------------浏览器搜索------------------
nmap <silent> <Leader>s <Plug>SearchNormal
vmap <silent> <Leader>s <Plug>SearchVisual

" -----------------Markdown预览-----------------
nmap <Leader>m <Plug>MarkdownPreviewToggle

" -----------------单词拼写检查-----------------
set nospell  " 关闭自带的拼写检查
let g:spelunker_check_type = 2  " 实时动态检查
let g:spelunker_disable_uri_checking = 1  " 禁用网址检查
let g:spelunker_disable_email_checking = 1  " 禁用邮件检查
let g:spelunker_disable_account_name_checking = 1  " 禁用用户名检查
let g:spelunker_disable_acronym_checking = 1  " 禁用缩写检查
let g:spelunker_disable_backquoted_checking = 1  " 禁用反引号检查
nmap zl Zl  " 更改光标下单词
nmap zg Zg  " 标记为正确拼写
nmap zug Zug  " 取消标记为正确拼写
nmap zw Zw  " 标记为错误拼写
nmap zuw ZuW  " 取消标记为错误拼写

" ----------------发送代码到REPL----------------
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ".2"}
let g:slime_bracketed_paste = 1
if has('win32') || has('win64')
	let g:slime_target = "neovim"
endif

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

" --------------------neovide-------------------
if exists("g:neovide")
	set guifont=MesloLGM\ Nerd\ Font:h12
	let g:neovide_transparency = 0.85
	let g:neovide_title_background_color = "#333333"
	let g:neovide_title_text_color = "#FFFFFF"

	function! ToggleFullScreen()
		if g:neovide_fullscreen == 0
			let g:neovide_fullscreen=1
		else
			let g:neovide_fullscreen=0
		endif
	endfunction
	nnoremap <A-Enter> :call ToggleFullScreen()<CR>

	autocmd VimLeave * let g:neovide_fullscreen=0
endif
