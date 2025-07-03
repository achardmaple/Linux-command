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
  * [4. 文件查找](#4-文件查找)
  * [5. 打包与解压](#5-打包与解压)
  * [6. 资源管理](#6-资源管理)
  * [7. 终端复用工具](#7-终端复用工具)
  * [8. 远程连接/文件传输](#8-远程连接文件传输)
  * [9. 标准输入输出操作](#9-标准输入输出操作)
  * [10. 其他常用命令](#10-其他常用命令)
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

#### 新建文件（touch）

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

### 4. 文件查找

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

5. ag

    ag 可以搜索当前目录下的文件内容和文件名，支持正则表达式。

    语法格式：`ag [OPTIONS] PATTERN`

    * -i：大小写不敏感
    * -s：大小写敏感
    * -S：智能大小写判断（默认）
    * -g [PATTERN]：输出文件名匹配的文件名
    * -G [PATTERN]：仅搜索文件名，但不显示
    * -l：输出内容匹配的文件的文件名，不显示匹配内容
    * -L：输出内容不匹配的文件的文件名，不显示匹配内容
    * -A \<n>：显示匹配内容的后n行
    * -B \<n>：显示匹配内容的前n行
    * -C \<n>：显示匹配内容的前后n行
    * --hidden：搜索隐藏文件
    * --ignore PATTERN：忽略指定文件或目录

6. [fzf](https://github.com/junegunn/fzf)

    fzf 是一款命令行模糊查找工具，能够快速定位文件、命令、书签等，支持模糊搜索，并提供交互式选择。

    fzf 本身不具备搜索功能，需要从其他命令或程序提供的输入中进行模糊匹配，默认使用命令是 find。可通过在 shell 配置文件中设置环境变量 `$FZF_DEFAULT_COMMAND` / `$FZF_CTRL_T_COMMAND` 等来指定搜索命令，比如通过设置 `export FZF_DEFAULT_COMMAND="ag --hidden --ignore .git -g ''"` 来使用 ag 命令进行文件名的模糊搜索。此外，还可通过设置环境变量 `$FZF_DEFAULT_OPTS` 等来设置 fzf 的显示样式。

    * Ctrl-t：搜索文件路径和文件夹目录，通过形如 `vim ./test**<TAB>` 的命令同样可以打开搜索界面，进行文件路径和文件夹目录快捷补全
    * Alt-c：搜索文件夹目录，通过形如 `cd ./test**<TAB>` 的命令同样可以打开搜索界面，进行文件夹目录的快捷补全
    * Ctrl-r：搜索历史命令
    * Ctrl-j / Ctrl-n：光标向下移动
    * Ctrl-k / Ctrl-p：光标向上移动
    * Enter：选中当前项，并退出搜索界面
    * TAB / Shift-TAB：多选
    * ESC：退出搜索界面

### 5. 打包与解压

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

### 6. 资源管理

#### 查看资源使用情况

1. nvidia-smi命令
   * 查看 GPU 使用信息

2. Memory-Usage
   * 查看显存使用情况
   * 3MiB/25464MiB &emsp;&emsp;&emsp; # 前者表示已使用的显存，后者代表总的显存

3. GPU-Util
   * 查看 GPU 使用率
   * 0% &emsp;&emsp;&emsp;# 表示GPU使用率百分比

4. Pwr:Usage/Cap
   * 查看 GPU 电源使用情况
   * 23W/450W&emsp;&emsp;&emsp; #前者表示GPU使用功率，后者表示GPU最大功耗

5. free
   * 这个命令用于显示系统当前内存的使用情况，包括已用内存、可用内存和交换内存的情况
   * free -g        &emsp;&emsp;&emsp;    #以G为单位输出内存的使用量，-g为GB，-m为MB，-k为KB，-b为字节
   * free -t        &emsp;&emsp;&emsp;    #查看所有内存的汇总

6. [top / htop](#top--htop-命令)

#### 进程管理

1. ps 命令
   * 查看进程命令 输入命令：ps -ef  

2. kill 命令
   * 杀死进程命令:
     * kill -9 <进程号> #强制删除进程
     * kill <进程号> #删除进程
     * 例：删除python test.py进程，输入命令：kill -9 14482

3. [top / htop](#top--htop-命令)

#### 查看磁盘信息

1. df 命令
   * 说明：显示文件系统的磁盘使用情况
   * -h       &emsp;&emsp;&emsp;     # human readable，以可读的方式显示（以K，M，G等为单位显示）

2. du 命令
   * 说明：显示指定目录或文件所占用的磁盘空间
   * -h       &emsp;&emsp;&emsp;     # human readable，以可读的方式显示（以K，M，G等为单位显示）
   * -s       &emsp;&emsp;&emsp;     # 显示文件或目录的总大小（只显示一层目录）
   * --depth=n  &emsp;&emsp;&emsp;   # 显示目录的深度，n为目录的层数
   * 如：du -h --max-depth=1 | sort -hr，对本级目录的所有文件按可读占用空间的顺序显示

#### top / htop 命令

* top 命令用来监控 linux 的系统状况，是常用的性能分析工具，能够实时显示系统中各个进程的资源占用情况。进入 top 时，默认各进程是按照 CPU 的占用量来排序的。
* htop 命令是 top 命令的加强版，能够提供更友好的图形化界面，支持鼠标操作，比 top 功能更为强大，条件允许的情况下推荐使用 htop 替代 top。

### 7. 终端复用工具

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

[Tmux 介绍](./tools_introduction/tmux.md)

#### 任务进程（jobs, fg, bg, ctrl-z, &）

1. ctrl-z    &emsp;&emsp;&emsp;    # 将当前任务进程置于后台，暂停运行
2. jobs      &emsp;&emsp;&emsp;    # 显示当前任务进程
3. fg / fg %job_number     &emsp;    # 将后台任务进程放到前台并恢复运行
4. bg / bg %job_number     &emsp;    # 继续运行后台任务进程，但进程仍处于后台
5. 在命令后加 &    &emsp;&emsp;&emsp;    # 在后台运行命令，不影响当前会话
6. nohup + 命令    &emsp;&emsp;&emsp;    # 重定向命令的输入输出，默认重定向输出到 nohup.out 文件中，配合 & 使用可实现后台运行，例：`nohup python test.py &`

### 8. 远程连接/文件传输

#### ssh

* ssh username@ip_address     &emsp;&emsp;&emsp;    # 远程登录，默认端口为22
* ssh -P 22 username@ip_address     &emsp;&emsp;&emsp;    # 指定端口登录

ssh 公钥配置位置：`~/.ssh/authorized_keys`

#### scp

通过 ssh 协议远程拷贝文件，属于 ssh 的一个子功能。

* scp username@ip_address:/path/to/remote_file /path/to/local_dir     &emsp;&emsp;&emsp;    # 复制远程文件到本地
* scp /path/to/local_file username@ip_address:/path/to/remote_dir     &emsp;&emsp;&emsp;    # 复制本地文件到远程
* -P 22     &emsp;&emsp;&emsp;    # 指定端口
* -r        &emsp;&emsp;&emsp;    # 递归复制整个目录

#### ftp / sftp

ftp 是通过 FTP 协议进行文件传输的命令，sftp 是 ssh 的一个子功能，是通过 ssh 封装过后的 ftp，数据传输更加安全。

* sftp username@ip_address     &emsp;&emsp;&emsp;    # 登录远程服务器
* -P 22     &emsp;&emsp;&emsp;    # 指定端口

登录后可通过指令进行文件操作，下面是一些常用指令：

* ls          &emsp;&emsp;&emsp;    # 列出当前远程目录下的文件
* cd          &emsp;&emsp;&emsp;    # 切换远程目录
* mkdir       &emsp;&emsp;&emsp;    # 创建远程目录
* pwd         &emsp;&emsp;&emsp;    # 显示当前远程目录
* lls         &emsp;&emsp;&emsp;    # 列出当前本地目录下的文件
* lcd         &emsp;&emsp;&emsp;    # 切换本地目录
* lmkdir      &emsp;&emsp;&emsp;    # 创建本地目录
* lpwd        &emsp;&emsp;&emsp;    # 显示当前本地目录
* put [-r]    &emsp;&emsp;&emsp;    # 上传本地文件/目录到远程目录
* get [-r]    &emsp;&emsp;&emsp;    # 下载远程文件/目录到本地目录
* exit        &emsp;&emsp;&emsp;    # 退出远程服务器

#### wget命令

* 说明：使用wget从网上下载软件、音乐、视频
* 示例：wget <下载网址>
  * #下载文件并以指定的文件名保存文件
  * wget -O <文件名> <下载网址>

### 9. 标准输入输出操作

#### 标准输入输出概念

标准输入输出可以理解为输入程序的数据和程序输出的结果，具体而言有：

* 标准输入：stdin，通常指键盘输入，即程序从键盘读取输入数据。
* 标准输出：stdout，通常指显示器输出，即程序向显示器输出数据。
* 标准错误输出：stderr，通常指显示器输出，即程序向显示器输出错误信息。

#### 重定向

在 linux 系统中，一切设备都是文件，一切的操作都是对文件的操作。标准输入、标准输出、标准错误输出对应标准输入文件、标准输出文件、标准错误输出文件。

既然标准输入输出的本质都是文件，那么我们可以在执行命令时通过更改或指定其他的文件作为标准输入输出，使得程序从我们希望的文件中读取输入数据，或者向我们希望的文件中输出结果，而不是使用系统“默认”的标准输入输出文件。这样的操作被称为标准输入输出的重定向。

标准输入输出的文件描述符：

| 设备文件名 | 设备描述符 |
| --- | --- |
| /dev/stdin | 0 |
| /dev/stdout | 1 |
| /dev/stderr | 2 |

1. `<` 输入重定向
   * 等同 `0<`
   * 格式：`command < file`
   * 作用：将 file 作为 command 的输入文件，command 读取 file 中的数据作为输入。

2. `>` 输出重定向（覆盖方式）
   * 等同 `1>`
   * 格式：`command > file`
   * 作用：将 command 的输出结果写入 file 文件中，覆盖原有文件内容。

3. `>>` 输出重定向（追加方式）
   * 等同 `1>>`
   * 格式：`command >> file`
   * 作用：将 command 的输出结果追加到 file 文件末尾。

4. 错误输出重定向 `2>` `2>>`

5. 在某些命令中通常使用 `-` 代替文件名，表示使用标准输入输出，如 `cat -` 或 `grep -`。

#### 管道命令（pipe）

管道是 linux 系统中非常重要的概念，它的作用是将一个命令的输出作为另一个命令的输入，其符号为 `|`。

管道命令的语法格式：`command1 | command2`，意为将 command1 的输出作为 command2 的输入传递给 command2。

一个非常有用的例子，用于将本地文件的文本内容发送到远程服务器的文件中：

```bash
cat local_file | ssh remote_user@remote_host "cat - > remote_file"
```

#### 文本查找/处理命令

文本查找/处理命令通常与 [管道命令](#管道命令pipe) 一起使用，常用于对其他程序的输出内容进行过滤，方便用户在大量数据中快速定位需要的信息，这也是本文将 grep 命令归类于“标准输入输出操作”下的原因。

1. grep 命令

    grep 命令用于查找文件/文本中匹配指定字符串的行，并输出匹配的行。

    grep 的语法格式：`grep [options] pattern [file]`，其中 options 可选，pattern 为要查找的字符串，file 为要查找的文件，file 为空或为 `-` 时表示从标准输入读取数据

    常用选项：

    * -i：忽略大小写
    * -n：显示行号
    * -v：显示不匹配的行
    * -A \<n>：显示匹配的行及其后n行
    * -B \<n>：显示匹配的行及其前n行
    * -C \<n>：显示匹配的行及其前后n行
    * -r：递归查找匹配的文件
    * -c：只显示匹配行的计数

2. awk 命令

    awk 命令是一个强大的文本分析工具，提供编程语言的功能，如变量赋值、条件判断、循环等，使得对文本内容的复杂分析成为可能，且易于使用。

    awk 的语法格式：`awk [options] 'pattern {action}' file(s)`，其中 options 可选，pattern 为匹配内容，{action} 为对匹配内容的操作，默认为打印匹配行，file(s) 为要处理的文件，file(s) 可以是多个，也可以是 `-`，表示从标准输入读取数据。

    常用选项：

    * -F：指定分隔符

    常用运算符：

    * $：字段符（一行可能会被 -F 分割为多个字段）
    * 算术运算符、关系运算符、赋值运算符，与 python 类似
    * ||、&&、!：逻辑或与非
    * in：数组成员

    常用函数：

    * length(string)：返回字符串长度
    * substr(string, start, length)：返回子字符串

    常用内建变量:

    * NR：当前记录数（行号，从1开始）
    * NF：当前字段数（列号，从1开始）
    * $0：当前行

    示例：ping 局域网内 ip，并过滤出成功收到数据包的 ip，`-F '-- | ping'` 的 `|` 是分隔符，分隔 `-- ` 与 ` ping`

    ```bash
    for num in {1..254}
    do
        ping -c 1 192.168.1.$num -W 1 | awk '/1 received/ {print prev} {prev=$0}' | awk -F '-- | ping' '{print $2}'
    done
    ```

### 10. 其他常用命令

#### sudo 命令

* -E       &emsp;&emsp;&emsp;     # 保留环境变量，即在执行sudo命令时，环境变量也会被保留。

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
