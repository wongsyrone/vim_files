# Vim资源

## 基本存储所有和Vim有关的咚咚，包括自己的和他人的。一般在Linux进行自行编译

### 编译过程及配置


#### 安装编译工具
    sudo apt-get install build-essential
#### 安装编译vim－gtk的依赖包
    sudo apt-get build-dep vim-gtk
    sudo apt-get build-dep vim     // 一般来说用这个就行

编译安装gvim  系统版本ubuntu10.04 vim版本7.3
编译前需要安装的东西，如果你的系统是全新的话   // 基本安装带有 dev字样的包即可
sudo apt-get install build-essential ncureses-dev xorg-dev libgtk2.0-gtk libncureses5-dev

 为了GUI，这些包是必须的:
  sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
  libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
  libcairo2-dev libx11-dev libxpm-dev libxt-dev
  如果包没安装完整，可能出现GUI没编译出来，但是vim可用的状况。


VIM编译配置选项：

    ./configure --enable-gnome-check --enable-gui=gnome2 --with-x --enable-xim --with-features=huge --enable-pythoninterp --enable-python3interp --enable-cscope --enable-fontset --enable-rubyinterp --enable-perlinterp --enable-tclinterp --enable-multibyte --with-vim-name=vim74


./configure   --prefix=/home/wong/vim74

make && make install


参数说明：

--enable-gui=gtk2 #gtk2支持,也可以使用gnome

--enable-cscope ＃cscope支持
--enable-pythoninterp ＃python支持
--enable-multibyte ＃双字符支持
--enable-xim ＃输入法支持
--enable-fontset ＃双字符支持
--with-features=huge ＃最大特性支持


补充说明：

在CentOS上编译时不支持“--enable-multibyte”

在debian上编译时不支持“--enable-fontset”


在debian上编译GVIM所依赖的包：xorg-dev libx11-dev libgtk2.0-dev libncurses5-dev

在CentOS上编译GVIM所依赖的包：libgtk2.0-dev libncurses5-dev libgnome-devel libgnomeui-devel libX11-devel libbonoboui-devel libXpm-devel libXt-devel




another person's configure

安装gvim所需要的包。

    sudo aptitude install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev



进入vim7.3源码目录，我的是/home/paddy/tools/vim73/src。(进入src的上层目录也可以)

    ./configure --prefix=/home/paddy/tools/vim73 --with-features=huge --enable-pythoninterp --enable-gui=gnome2 --enable-cscope --enable-fontset --enable-perlinterp --enable-python3interp --enable-tclinterp --enable-multibyte

    make

    make install

##########################################################################################################################################

## Bash shell中的位置参数$#,$*,$@,$0,$1,$2...及特殊参数$?,$-等的含义

在Bash shell中经常会见到一些比较特殊的符号，本人现收集与此，以供查阅：

位置参数：
详见ABS(Advanced Bash Shell)中文翻译版103页第9章第一节内部变量，当然英文版ABS都一样啦

$1, $2, $3等等...
位置参数,从命令行传递给脚本,或者是传递给函数.或者赋职给一个变量.
此数目可以任意多，但只有前9个可以被访问，使用shift命令可以改变这个限制。
(具体见Example 4-5 和Example 11-15)
$0
$0表示当前执行的进程名,script 本身的名字,或者在正则表达式中表示整行输出

$#
命令行或者是位置参数的个数.(见Example 33-2)
$*
所有的位置参数,被作为一个单词.
注意:"$*"必须被""引用.
$@
与$*同义,但是每个参数都是一个独立的""引用字串,这就意味着参数被完整地传递,
并没有被解释和扩展.这也意味着,每个参数列表中的每个参数都被当成一个独立的单词.
注意:"$@"必须被""引用.

其他的特殊参数
$-
传递给脚本的falg(使用set 命令).参考Example 11-15.
显示shell使用的当前选项，与set命令功能相同
注意:这起初是ksh 的特征,后来被引进到Bash 中,但不幸的是,在Bash 中它看上去也不
能可靠的工作.使用它的一个可能的方法就是让这个脚本进行自我测试(查看是否是交
互的).
$!
在后台运行的最后的工作的PID(进程ID).
$_
保存之前执行的命令的最后一个参数.
$?
命令,函数或者脚本本身的退出状态(见Example 23-7)
用于检查上一个命令,函数或者脚本执行是否正确。（在Linux中，命令退出状态为0表示该命令正确执行，任何非0值表示命令出错。）
$$
脚本自身的进程ID.这个变量经常用来构造一个"unique"的临时文件名.
(参考Example A-13,Example 29-6,Example 12-28 和Example 11-25).
这通常比调用mktemp 来得简单.
注意事项:
[1] 当前运行的脚本的PID 为$$.
[2] "argument"和"parameter"这两个单词经常不加区分的使用.在这整本书中,这两个
单词的意思完全相同.(在翻译的时候就未加区分,统统翻译成参数)

退出和返回
退出状态(exit status)
函数返回一个被称为退出状态的值. 退出状态可以由return 来指定statement, 否则函数的
退出状态是函数最后一个执行命令的退出状态(0 表示成功,非0 表示出错代码). 退出状态
(exit status)可以在脚本中由$? 引用. 这个机制使脚本函数也可以像C 函数一样有一个"
返回值".
return
终止一个函数.return 命令[1]可选地带一个整数参数,这个整数作为函数的"返回值"返回
给调用此函数的脚本,并且这个值也被赋给变量$?.

while true可以写为while :



Example 23-7 两个数中的最大者
    ###################Start Script#################
    !/bin/bash
     max.sh: 两个整数中的最大者.

    _PARAM_ERR=-198 # 如果传给函数的参数少于2 个时的返回值.
    QUAL=-199 # 如果两个整数值相等的返回值.
     任一个传给函数的参数值溢出


    ax2 () # 返回两个整数的较大值.
    { # 注意: 参与比较的数必须小于257.
    if [ -z "$2" ]
    then
    return $E_PARAM_ERR
    fi

    if [ "$1" -eq "$2" ]
    then
    return $EQUAL
    else
    if [ "$1" -gt "$2" ]
    then
    return $1
    else
    return $2
    fi
    fi
    }

    max2 33 34
    return_val=$?

    if [ "$return_val" -eq $E_PARAM_ERR ]
    then
    echo "Need to pass two parameters to the function."
    elif [ "$return_val" -eq $EQUAL ]
    then
    echo "The two numbers are equal."
    else
    echo "The larger of the two numbers is $return_val."
    fi


    exit 0

    # 练习 (容易):
    # ---------------
    # 把这个脚本转化成交互式的脚本,
    #+ 也就是说,让脚本可以要求调用者输入两个整数.
    #####################End Script##################

