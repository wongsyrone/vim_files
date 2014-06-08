# Vim资源

## 基本存储所有和Vim有关的咚咚，包括自己的和他人的。一般在Linux进行自行编译

### 编译过程及配置


安装编译工具

    sudo apt-get install build-essential
    
安装编译vim－gtk的依赖包

    sudo apt-get build-dep vim-gtk
    sudo apt-get build-dep vim     // 一般来说用这个就行

编译前需要安装的东西，如果你的系统是全新的话   // 基本安装带有 dev字样的包即可

    sudo apt-get install build-essential ncureses-dev xorg-dev libgtk2.0-gtk libncureses5-dev

为了GUI，这些包是必须的:

    sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev

**如果包没安装完整，可能出现GUI没编译出来，但是vim可用的状况**


VIM编译配置选项：

    $ ./configure --enable-gnome-check --enable-gui=gnome2 --with-x --enable-xim --with-features=huge --enable-pythoninterp --enable-python3interp --enable-cscope --enable-fontset --enable-rubyinterp --enable-perlinterp --enable-tclinterp --enable-multibyte
    $ make -j4
    # make install


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


#### 其他人的安装配置

安装gvim所需要的包

    sudo aptitude install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev

进入vim7.3源码目录，我的是/home/paddy/tools/vim73/src。(进入src的上层目录也可以)

    ./configure --prefix=/home/paddy/tools/vim73 --with-features=huge --enable-pythoninterp --enable-gui=gnome2 --enable-cscope --enable-fontset --enable-perlinterp --enable-python3interp --enable-tclinterp --enable-multibyte
    make
    make install
