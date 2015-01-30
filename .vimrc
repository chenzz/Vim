func! MySys()
	return "unix"
endfunc

if MySys() == "unix" || MySys() == "mac"

	"set hilight matching bracket mathod
	hi MatchParen cterm=bold ctermbg=none ctermfg=magenta

	"VIM内部编码
    set encoding=utf-8
    "当前编辑文件编码
    set fileencoding=utf-8
    "VIM打开文件支持的编码
    set fileencodings=ucs-bom,utf-8,gbk,cp936,gb2312,big5,euc-jp,euc-kr,latin1
    "设置终端编码为VIM内部编码encoding
    let &termencoding=&encoding

	"去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
	set nocompatible

	"当输入到/b时，会自动找到第一个b开头的单词，依次类推
	set incsearch
	
	"显示行号
	set nu

	"检测文件的类型——为兼容vundle进行了更改
	filetype off

	"记录历史的行数
	set history=1000

	"语法高亮度显示
	syntax on

	"Don't indent when input public/private.
	set cinoptions=g-1

	"第一行设置tab键为4个空格，第二行设置当行之间交错时使用4个空格
	set tabstop=4
	set shiftwidth=4

	"设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
	set showmatch

	"当vim进行编辑时，如果命令错误，会发出一个响声，该设置去掉响声
	set vb t_vb=

	"在编辑过程中，在右下角显示光标位置的状态行
	set ruler

	"禁止备份
	set nobackup

	"allow backspacing over everything in insert mode
	set backspace=2
	set backspace=indent,eol,start

	"split相关
	set splitbelow
	set splitright

	"shield F1
	map <F1> <Esc>
	imap <F1> <Esc>


	"快捷键
	map <F5> :call Compile() <CR>
	func! Compile()
		exec "w"
		if &filetype == 'c'
			exec "!gcc % -std=c99 -g && ./a.out"
		elseif &filetype == 'cpp'
			exec "!g++ % -std=c++11 -g && ./a.out"
		elseif &filetype == 'java'
			exec "!javac % && !java %<"
		elseif &filetype == 'sh'
			exec "!bash %"
		elseif &filetype == 'python'
			exec "!python %"
		elseif &filetype == 'html'
			exec "!google-chrome %"
		endif
	endfunc

	map <F6> :call Make() <CR>
	func! Make()
		exec "w"
		exec "!make && %<"
	endfunc

	map <F7> :call Servlet() <CR>
	func! Servlet()
		exec "w"
		exec "!javac -d WEB-INF/classes %"
	endfunc


	" 修改leader键
	let mapleader = ','
	let g:mapleader = ','

	"Vundle相关设置
	" set the runtime path to include Vundle and initialize
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()

	Plugin 'gmarik/Vundle.vim'
	Plugin 'scrooloose/syntastic'
	Plugin 'Raimondi/delimitMate'		"括号配对
	"Plugin 'scrooloose/nerdtree'		"目录树
	"Plugin 'docunext/closetag.vim'		"html/xml标签配对
	"Plugin 'scrooloose/nerdcommenter'	"快速注释
	"Plugin 'junegunn/vim-easy-align'	"语句对齐
	"Plugin 'Lokaltog/vim-easymotion'	"语句跳转
	"Plugin 'Valloric/YouCompleteMe'

	call vundle#end()   

	filetype indent plugin on    " required
	set autoindent

	"EasyMotion相关设置
	"map <Leader> <Plug>(easymotion-prefix)
	"nmap s <Plug>(easymotion-s)

	"html indent
	let g:html_indent_inctags = "html, body, head, tbody"
endif
