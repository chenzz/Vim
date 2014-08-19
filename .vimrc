"去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible

"显示行号
set nu

"检测文件的类型
filetype on

"记录历史的行数
set history=1000

"语法高亮度显示
syntax on

"File type based indentation.
filetype plugin indent on

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
map <F8> : !gedit % <CR>
map <F9> : !gcc % -std=c99 -g && ./a.out <CR>
map <F10> : !g++ % -std=c++11 -g  && ./a.out <CR>


