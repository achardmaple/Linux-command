# Linux 使用笔记

## 描述

本文旨在介绍 Linux 基本知识，梳理 Linux 系统结构，列举部分 Linux 常用命令，将会随本人使用而更新。

## 目录

* [Linux 基本知识](#linux-基本知识)
  * [目录表示](#目录表示)
  * [指令的常见参数](#指令的常见参数)
* [Linux 系统结构](#linux-系统结构)
* [Linux 常用指令和工具](#linux-常用指令和工具)
  * [1. 目录操作](#1-目录操作)
  * [2. 文件操作](#2-文件操作)
  * [3. 文件权限](#3-文件权限)
  * [4. 打包与解压](#4-打包与解压)
  * [5. 资源管理常用命令](#5-资源管理常用命令)
  * [6. 终端复用工具](#6-终端复用工具)
  * [7. 文件查找指令](#7-文件查找指令)
  * [8. 其他常用命令](#8-其他常用命令)
* [conda指令相关](#conda指令相关)
  * [1. 启用conda环境](#1-启用conda环境)
  * [2. 显示conda下的虚拟环境](#2-显示conda下的虚拟环境)
  * [3. conda虚拟环境相关](#3-conda虚拟环境相关)
* [huggingface相关](#huggingface相关)

## Linux 基本知识

### 目录表示

* / &emsp;&emsp;&emsp; #根目录：Linux 系统的根目录，所有的文件都存放在这里。
* . &emsp;&emsp;&emsp; #当前目录：当前用户所在工作目录。
* .. &emsp;&emsp;&emsp; #父目录：上一级目录。
* ~ &emsp;&emsp;&emsp; #用户目录：用户主目录，在 Linux 中，每个用户都有一个主目录，一般位于 /home/username 目录下。
* 多级目录的表示方式，形如：/home/username/Documents/file.txt，又如：~/Documents/file.txt，又如：./Documents/file.txt，前者表示绝对路径，后两者表示相对路径。
* 正则表达式：使用正则表达式可以对文件名进行匹配，常用的正则表达式有：
  * `*` 匹配任意字符
  * `[abc]` 匹配字符集中的任意一个字符
  * [更多](https://worktile.com/kb/ask/485532.html)

### 指令的常见参数

* -a  &emsp;&emsp;&emsp; #所有文件，包括隐藏文件。
* -r  &emsp;&emsp;&emsp; #递归所有子目录。
* -f  &emsp;&emsp;&emsp; #强制执行，不询问。

## Linux 系统结构

* / &emsp;&emsp;&emsp; #根目录：Linux 系统的根目录，是所有目录的起始点，也是最高层级的目录。
* /bin &emsp;&emsp;&emsp; #二进制目录：存放着最常用的命令，如 ls、cp、mv、mkdir、rm 等。
* /boot &emsp;&emsp;&emsp; #启动目录：存放着开机时所需的各种文件。
* /dev &emsp;&emsp;&emsp; #设备目录：存放着 Linux 系统中使用的设备文件。
* /etc &emsp;&emsp;&emsp; #系统配置文件目录：存放着各种系统配置文件。
* /home &emsp;&emsp;&emsp; #用户目录：存放着用户的主目录。
* /lib &emsp;&emsp;&emsp; #库目录：存放着系统最基本的动态链接库文件。
* /mnt &emsp;&emsp;&emsp; #挂载目录：临时挂载其他文件系统的目录。
* /proc &emsp;&emsp;&emsp; #进程目录：存放系统的内存、进程信息及内核信息。
* /root &emsp;&emsp;&emsp; #超级用户目录：root 用户的主目录。
* /run &emsp;&emsp;&emsp; #运行目录：存放系统启动时产生的运行时文件。

## Linux 常用指令和工具

### 1. 目录操作

#### 切换目录（cd）

* cd / &emsp;&emsp;&emsp; #切换到根目录
* cd /bin  &emsp;&emsp;&emsp;            #切换到根目录下的bin目录
* cd ../ &emsp;&emsp;&emsp;              #切换到上一级目录 或者使用命令：cd ..
* cd ~   &emsp;&emsp;&emsp;              #切换到home目录
* cd -    &emsp;&emsp;&emsp;             #切换到上次访问的目录
* cd xx(文件夹名) &emsp;&emsp;&emsp;      #切换到本目录下的名为xx的文件目录，如果目录不存在报错
* cd /xxx/xx/x     &emsp;&emsp;&emsp;    #可以输入完整的路径，直接切换到目标目录，输入过程中可以使用tab键快速补全

#### 查看目录（ls）

* ls   &emsp;&emsp;&emsp;                #查看当前目录下的所有目录和文件
* ls -a   &emsp;&emsp;&emsp;             #查看当前目录下的所有目录和文件（包括隐藏的文件）
* ls -l    &emsp;&emsp;&emsp;            #列表查看当前目录下的所有目录和文件（列表查看，显示更多信息），与命令"ll"效果一样
* ls /bin    &emsp;&emsp;&emsp;          #查看指定目录下的所有目录和文件
* 支持正则表达式匹配，如：ls /bin/python*  &emsp;&emsp;&emsp;  #查看bin目录下以python开头的文件

#### 创建目录（mkdir）

* mkdir tools     &emsp;&emsp;&emsp;       #在当前目录下创建一个名为tools的目录
* mkdir /bin/tools   &emsp;&emsp;&emsp;    #在指定目录下创建一个名为tools的目录
* mkdir -p /bin/tools   &emsp;&emsp;&emsp; #创建多级目录，如不存在则创建，存在则不创建

#### 删除目录与文件（rm）

* rm 文件名        &emsp;&emsp;&emsp;      #删除当前目录下的文件
* rm -f 文件名     &emsp;&emsp; &emsp;     #删除当前目录的的文件（不询问）
* rm -r 文件夹名    &emsp;&emsp; &emsp;    #递归删除当前目录下此名的目录
* rm -rf 文件夹名    &emsp;&emsp; &emsp;   #递归删除当前目录下此名的目录（不询问）
* rm -rf *           &emsp;&emsp; &emsp;  #将当前目录下的所有目录和文件全部删除

#### 修改目录（mv）

* mv 当前目录名 新目录名   &emsp;&emsp;&emsp;     #修改目录名，同样适用与文件操作
* mv /usr/tmp/tool/opt     &emsp;&emsp;&emsp;  #将 /usr/tmp 目录下的 tool 目录剪切到 /opt 目录下面
* mv -r /usr/tmp/tool/opt   &emsp;&emsp;&emsp; #递归剪切目录中所有文件和文件夹

#### 拷贝目录（cp）

* cp /usr/tmp/tool/opt     &emsp;&emsp;&emsp;  #将 /usr/tmp 目录下的 tool 目录复制到 /opt 目录下面
* cp -r /usr/tmp/tool/opt  &emsp;&emsp;&emsp;  #递归剪复制目录中所有文件和文件夹

#### 搜索目录（find）

* find /bin -name 'a*'     &emsp;&emsp; &emsp;  #查找/bin目录下的所有以a开头的文件或者目录

#### 查看当前目录（pwd）

* pwd                &emsp;&emsp;&emsp;         #显示当前位置路径

#### ranger文件管理器

[Ranger 介绍](./tools_introduction/ranger.md)

### 2. 文件操作

#### 新增文件（touch）

* touch  a.txt   &emsp;&emsp;&emsp;      #在当前目录下创建名为a的txt文件（文件不存在），如果文件存在，将文件时间属性修改为当前系统时间

#### 删除文件（rm）

* rm 文件名     &emsp;&emsp;&emsp;         #删除当前目录下的文件
* rm -f 文件名    &emsp;&emsp;&emsp;       #删除当前目录的的文件（不询问）

#### 查看文件内容（cat / bat）

* cat filename.txt     &emsp;&emsp;&emsp;     #将 filename.txt 文件的内容打印到终端上
* cat filename1.txt > filename2.txt    &emsp;&emsp;&emsp;  #将 filename1.txt 文件的内容追加到 filename2.txt 文件中

#### 编辑文件（vi / vim / nvim）

[Neovim 介绍](./tools_introduction/neovim.md)

* vi / vim / nvim filename.txt     &emsp;&emsp;&emsp;         #打开需要编辑的文件
* 进入后，操作界面有三种模式：命令模式（command mode）、插入模式（Insert mode）和底行模式（last line mode）
  * 命令模式
  -刚进入文件就是命令模式，通过方向键控制光标位置，
  -使用命令"dd"删除当前整行
  -使用命令"/字段"进行查找
  -按"i"在光标所在字符前开始插入
  -按"a"在光标所在字符后开始插入
  -按"o"在光标所在行的下面另起一新行插入
  -按"："进入底行模式
  * 插入模式
  -此时可以对文件内容进行编辑，左下角会显示 "-- 插入 --""
  -按"ESC"进入底行模式
  * 底行模式
  -退出编辑：      :q
  -强制退出：      :q!
  -保存并退出：    :wq
* 操作步骤示例
  1. 保存文件：按"ESC" -> 输入":" -> 输入"wq",回车   &emsp;&emsp;&emsp;  #保存并退出编辑
  2. 取消操作：按"ESC" -> 输入":" -> 输入"q!",回车   &emsp;&emsp;&emsp;  #撤销本次修改并退出编辑
* 补充
  * vim +10 filename.txt       &emsp;&emsp;&emsp;            #打开文件并跳到第10行
  * vim -R /etc/passwd         &emsp;&emsp;&emsp;            #以只读模式打开文件

### 3. 文件权限

#### 权限说明

* 文件权限简介：'r' 代表可读（4），'w' 代表可写（2），'x' 代表执行权限（1），括号内代表"8421法"
* 文件权限信息示例：-rwxrw-r--
  * 第一位：'-'就代表是文件，'d'代表是文件夹
  * 第一组三位：拥有者的权限
  * 第二组三位：拥有者所在的组，组员的权限
  * 第三组三位：代表的是其他用户的权限

#### 文件权限(chmod)

* 普通授权    chmod +x a.txt
* 8421法     chmod 777 a.txt   &emsp;&emsp;&emsp;   #1+2+4=7，"7"说明授予所有权限
* 递归授权    chmod -R 777 folder   &emsp;&emsp;&emsp;   #递归授权目录 folder 下的所有文件和目录

#### 文件所有权(chown / chgrp)

* chown [-R] 账号名称 文件或目录名称   &emsp;&emsp;&emsp;   #修改文件或目录的拥有者
* chown [-R] 账号名称:用户组名称 文件或目录名称   &emsp;&emsp;&emsp;   #修改文件或目录的拥有者和用户组
* chgrp [-R] 用户组名称 文件或目录名称   &emsp;&emsp;&emsp;   #修改文件或目录的用户组

### 4. 打包与解压

#### 说明

* .zip、.rar    &emsp;&emsp;&emsp;     #windows系统中压缩文件的扩展名
* .tar          &emsp;&emsp;&emsp;     #Linux中打包文件的扩展名
* .gz           &emsp;&emsp;&emsp;     #Linux中压缩文件的扩展名
* .tar.gz       &emsp;&emsp;&emsp;     #Linux中打包并压缩文件的扩展名

#### 打包文件

* tar -zcvf &emsp;&emsp;&emsp;  #打包压缩后的文件名 要打包的文件
  参数说明：z：调用gzip压缩命令进行压缩; c：打包文件; v：显示运行过程; f：指定文件名;
  示例：
  tar -zcvf a.tar file1 file2,...      #多个文件压缩打包

#### 解压文件

* tar -zxvf a.tar          &emsp;&emsp;&emsp;             #解包至当前目录
* tar -zxvf a.tar -C /usr------   &emsp;&emsp;&emsp;      #指定解压的位置
* zip [-r] ./files.zip ./files   &emsp;&emsp;&emsp;      #压缩文件或文件夹，-r参数表示递归压缩文件夹
* unzip test.zip       &emsp;&emsp;&emsp;       #解压*.zip文件
* unzip -l test.zip     &emsp;&emsp;&emsp;      #查看*.zip文件的内容
* unzip test.zip -d /usr------ &emsp;&emsp;&emsp;      #指定解压的位置

### 5. 资源管理常用命令

#### nvidia-smi命令

* 查看 GPU 使用信息

#### Memory-Usage &emsp;&emsp;&emsp;# 内存使用情况

* 3MiB/25464MiB &emsp;&emsp;&emsp; # 前者表示已使用的显存，后者代表总的显存

#### GPU-Util &emsp;&emsp;&emsp;# GPU使用率

* 0% &emsp;&emsp;&emsp;# 表示GPU使用率百分比

#### Pwr:Usage/Cap

* 23W/450W&emsp;&emsp;&emsp; #前者表示GPU使用功率，后者表示GPU最大功耗

#### ps 命令

* 查看进程命令 输入命令：ps -ef  

#### kill 命令

* 杀死进程命令:
  * kill -9 <进程号> #强制删除进程
  * kill <进程号> #删除进程
例：删除python test.py进程，输入命令：kill -9 14482

#### top / htop 命令

* top 命令用来监控 linux 的系统状况，是常用的性能分析工具，能够实时显示系统中各个进程的资源占用情况。默认进入 top 时，各进程是按照 CPU 的占用量来排序的。
* htop 命令是 top 命令的加强版，能够提供更友好的图形化界面，支持鼠标操作，比 top 功能更为强大，条件允许的情况下推荐使用 htop 替代 top。

### 6. 终端复用工具

#### screen

* screen     &emsp;&emsp;&emsp;    # 创建新的 screen 会话
* screen -S session_name     &emsp;    # 创建新的 screen 会话并指定名称
* screen -r  &emsp;&emsp;&emsp;    # 恢复 screen 会话
* screen -ls &emsp;&emsp;&emsp;    # 列出当前所有的 screen 会话
* screen -x  &emsp;&emsp;&emsp;    # 重新进入以挂起的 screen 会话
* screen -d  &emsp;&emsp;&emsp;    # 挂起 screen 会话

在 screen 会话中：

    * Ctrl-a d   &emsp;&emsp;&emsp;    # 挂起当前 screen 会话

screen 会话挂起（detach）后，会话中正在运行的程序不会被关闭，而是继续运行。

#### tmux

### 7. 文件查找指令

1. which

    查找系统PATH下的可执行文件。查找时必须输入完整文件名。

    ```bash
    >>> which python3
    /usr/bin/python3
    >>> which pip
    /usr/bin/pip
    >>> which pip*
    zsh: no matches found: pip*
    ```

2. whereis

    通过文件索引数据库查找二进制文件、源代码文件、帮助文件。查找时必须输入完整文件名。

    ```bash
    >>> whereis python3
    python3: /usr/bin/python3 /usr/lib/python3 /etc/python3 /usr/share/python3 /usr/share/man/man1/python3.1.gz
    >>> whereis pip
    pip: /usr/bin/pip /usr/share/man/man1/pip.1.gz
    >>> whereis pip*
    zsh: no matches found: pip*
    ```

3. locate

    通过数据库查找任意文件，数据库通常在 /var/lib/slocate/slocate.db，可通过 updatedb 命令更新数据库。查找时可以输入部分文件名，可通过 -r 选项使用正则表达式。

    ```bash
    >>> locate python3
    /var/cache/apt/archives/libpython3.10-dev_3.10.12-1~22.04.6_amd64.deb
    /var/cache/apt/archives/libpython3.10-minimal_3.10.12-1~22.04.6_amd64.deb
    /var/cache/apt/archives/libpython3.10-stdlib_3.10.12-1~22.04.6_amd64.deb
    /var/cache/apt/archives/libpython3.10_3.10.12-1~22.04.6_amd64.deb
    /var/cache/apt/archives/python3-pkg-resources_59.6.0-1.2ubuntu0.22.04.2_all.deb
    /var/cache/apt/archives/python3-setuptools-whl_59.6.0-1.2ubuntu0.22.04.2_all.deb
    /var/cache/apt/archives/python3-setuptools_59.6.0-1.2ubuntu0.22.04.2_all.deb
    ...
    ```

    更新指定目录到索引数据库：

    ```bash
    >>> sudo updatedb --locatepaths=/文件目录
    ```

4. find

    通过直接搜索硬盘的方式查找文件，速度较慢，查找信息绝对可靠。

    * find . -name "*.c"   &emsp;&emsp;&emsp;  #将目前目录及其子目录下所有延伸档名是 c 的文件列出来
    * find . -type f       &emsp;&emsp;&emsp;  #将目前目录其其下子目录中所有一般文件列出
    * find . -ctime -20    &emsp;&emsp;&emsp;  #将目前目录及其子目录下所有最近 20 天内更新过的文件列出
    * find /var/log -type f -mtime +7 -ok rm {} \;  &emsp;&emsp;&emsp;   #查找/var/log目录中更改时间在7日以前的普通文件，并在删除之前询问它们
    * find . -type f -perm 644 -exec ls -l {} \;   &emsp;&emsp;&emsp;    #查找前目录中文件属主具有读、写权限，并且文件所属组的用户和其他用户具有读权限的文件
    * find / -type f -size 0 -exec ls -l {} \;     &emsp;&emsp;&emsp;    #为了查找系统中所有文件长度为0的普通文件，并列出它们的完整路径

### 8. 其他常用命令

#### sudo 命令

* -E       &emsp;&emsp;&emsp;     # 保留环境变量，即在执行sudo命令时，环境变量也会被保留。

#### grep 命令

* grep -i "the" demo_file           &emsp;&emsp;&emsp;   #在文件中查找字符串(不区分大小写)
* grep -A 3 -i "example" demo_text  &emsp;&emsp;&emsp;   #输出成功匹配的行，以及该行之后的三行
* grep -r "ramesh" *                &emsp;&emsp;&emsp;   #在一个文件夹中递归查询包含指定字符串的文件

#### free 命令

* 说明：这个命令用于显示系统当前内存的使用情况，包括已用内存、可用内存和交换内存的情况
* free -g        &emsp;&emsp;&emsp;    #以G为单位输出内存的使用量，-g为GB，-m为MB，-k为KB，-b为字节
* free -t        &emsp;&emsp;&emsp;    #查看所有内存的汇总

#### df 命令

* 说明：显示文件系统的磁盘使用情况
* -h       &emsp;&emsp;&emsp;     # human readable，以可读的方式显示（以K，M，G等为单位显示）

#### du 命令

* 说明：显示指定目录或文件所占用的磁盘空间
* -h       &emsp;&emsp;&emsp;     # human readable，以可读的方式显示（以K，M，G等为单位显示）
* -s       &emsp;&emsp;&emsp;     # 显示文件或目录的总大小（只显示一层目录）
* --depth=n  &emsp;&emsp;&emsp;   # 显示目录的深度，n为目录的层数

#### scp 命令

* 这里ssh -p 22 <user@123456.com>为例
* 从本地复制到远程：
  * scp -P 22 <文件> <user@123456.com>:/home/user/  ##（这里用户默认目录为/home/user/）
  * scp -rP 22 <文件夹> <user@123456.com>:/home/user/  
* 从远程复制到本地：
  * scp -rP 22 <user@123456.com>:/home/user/<文件夹名> C:\Users\Administrator\Desktop\<文件夹名>
  * scp -P 22 <user@123456.com>:/home/user/ <文件名>  C:\Users\Administrator\Desktop\<文件名>

#### wget命令

* 说明：使用wget从网上下载软件、音乐、视频
* 示例：wget <下载网址>
  * #下载文件并以指定的文件名保存文件
  * wget -O <文件名> <下载网址>

## conda指令相关

### 1. 启用conda环境

* source ./.bashrc

### 2. 显示conda下的虚拟环境

* conda info -e
* conda env list

### 3. conda虚拟环境相关

#### 新建虚拟环境

* conda create -n [name] python=[python_version]

#### 激活虚拟环境

* conda activate [name]

#### 退出虚拟环境

* conda deactivate

#### 删除虚拟环境

* conda remove -n [name] --all

#### 复制虚拟环境

* conda create -n [new_name] --clone [old_name]

## huggingface相关

* 安装依赖：pip install -U huggingface_hub
* 设置环境变量：
  * Linux：`export HF_ENDPOINT=https://hf-mirror.com`（可以写入bash）
  * Windows：`$env:HF_ENDPOINT = "https://hf-mirror.com"`
* 下载：
  * 下载模型：huggingface-cli download --resume-download naver-clova-ix/donut-base-finetuned-docvqa --local-dir naver-clova-ix/donut-base-finetuned-docvqa
  * 下载数据集：huggingface-cli download --repo-type dataset --resume-download wikitext --local-dir wikitext
