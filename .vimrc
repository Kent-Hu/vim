set wildmenu
"增强模式中的命令行自动完成操作
set foldmethod=manual
"设定折叠方式为手动
set cin    
"实现C程序的缩进
set sta    
"插入<tab>时使用’shiftwidth’
set backspace=2
"指明在插入模式下可以使用<BS>删除光标前面的字符
syntax enable
"设置高亮关键字显示
set nocompatible
"去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set number
"显示行号
filetype on
"检测文件的类型
set history=1000
"记录历史的行数
set background=dark
"背景使用黑色
set autoindent
set smartindent
"上面两行在进行编写代码时，在格式对起上很有用；
"第一行，vim使用自动对起，也就是把当前行的对起格式应用到下一行；
"第二行，依据上面的对起格式，智能的选择对起方式，对于类似C语言编写上很有用
"第一行设置tab键为4个空格，第二行设置当行之间交错时使用4个空格
set tabstop=4
set shiftwidth=4
set showmatch
"设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
set ruler
"在编辑过程中，在右下角显示光标位置的状态行
set incsearch
"查询时非常方便，如要查找book单词，当输入到/b时，会自动找到第一
"个b开头的单词，当输入到/bo时，会自动找到第一个bo开头的单词，依
"次类推，进行查找时，使用此设置会快速找到答案，当你找要匹配的单词
"时，别忘记回车。
set enc=utf-8
"设置编码为中文
set winaltkeys=no
"Alt组合键不映射到菜单上
set laststatus=2
"总是出现状态栏
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P>
"设置状态栏
set hidden
"设置隐藏已修改buffer
autocmd FileType python setlocal et sta sw=4 sts=4
set ic
"查找时忽略大小nc_Winwidth=0

"把方法列表放在屏幕的右侧
let Tlist_Use_Right_Window=1
"让当前不被编辑的文件的方法列表自动折叠起来， 这样可以节约一些屏幕空间
let Tlist_File_Fold_Auto_Close=1

"映射F3为功能键调出winmanager的文件浏览器
"映射双击F3调出Taglist的符号浏览器
"let g:winManagerWindowLayout=’FileExplorer|TagList’ “你要是喜欢这种布局可以注释掉这一行
map <F3> :WMToggle<cr>
map <F3><F3> :TlistToggle<cr>
"将系统已经生成的tags导入
set tags+=~/.vim/systags

"映射F10为添加cscope和ctags
map <F10> :call Do_CsTag()<CR>
map <F10><F10> :call Add_CsTag()<CR>
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>   
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>   
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>   
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>   
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>   
nmap <C-\>f :cs find f <C-R>=expand("<cfile>:)<CR><CR>   
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

function Do_CsTag()
    silent! execute "!ctags -R '.'"
    if(executable('cscope') && has("cscope") )
        silent! execute "!find -L `pwd` -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' -o     -name '*.cxx' -o -name '*.hxx'> cscope.files -o -name '*.hpp' -o -name '*.py'"
    endif
    silent! execute "!cscope -bq"
    silent! execute "call Add_CsTag()"
endf

function Add_CsTag()
    if filereadable("cscope.out")
        execute "cs add cscope.out"
        execute "set tags+=./tags"
    endif
endf

silent! execute "call Add_CsTag()"


"设置当文件被修改时自动载入
set autoread

"代码补全 
set completeopt=preview,menu 

"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu

"光标所在行显示一条横线
set cursorline         

" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse-=a

"vim开启颜色配置，这样函数就有颜色了
colorscheme wombat256mod   
