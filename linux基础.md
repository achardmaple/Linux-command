# Linux基础
## 1. 目录操作
### 切换目录（cd）
* cd / &emsp;&emsp;&emsp; #切换到根目录
* cd /bin  &emsp;&emsp;&emsp;            #切换到根目录下的bin目录
* cd ../ &emsp;&emsp;&emsp;              #切换到上一级目录 或者使用命令：cd ..
* cd ~   &emsp;&emsp;&emsp;              #切换到home目录
* cd -    &emsp;&emsp;&emsp;             #切换到上次访问的目录
* cd xx(文件夹名) &emsp;&emsp;&emsp;      #切换到本目录下的名为xx的文件目录，如果目录不存在报错
* cd /xxx/xx/x     &emsp;&emsp;&emsp;    #可以输入完整的路径，直接切换到目标目录，输入过程中可以使用tab键快速补全
### 查看目录（ls）
* ls   &emsp;&emsp;                #查看当前目录下的所有目录和文件
* ls -a   &emsp;&emsp;             #查看当前目录下的所有目录和文件（包括隐藏的文件）
* ls -l    &emsp;&emsp;            #列表查看当前目录下的所有目录和文件（列表查看，显示更多信息），与命令"ll"效果一样
* ls /bin    &emsp;&emsp;          #查看指定目录下的所有目录和文件 
### 创建目录（mkdir）
* mkdir tools     &emsp;&emsp;&emsp;     #在当前目录下创建一个名为tools的目录
* mkdir /bin/tools   &emsp;&emsp; &emsp; #在指定目录下创建一个名为tools的目录
### 删除目录与文件（rm）
* rm 文件名        &emsp;&emsp;&emsp;      #删除当前目录下的文件
* rm -f 文件名     &emsp;&emsp; &emsp;     #删除当前目录的的文件（不询问）
* rm -r 文件夹名    &emsp;&emsp; &emsp;    #递归删除当前目录下此名的目录
* rm -rf 文件夹名    &emsp;&emsp; &emsp;   #递归删除当前目录下此名的目录（不询问）
* rm -rf *           &emsp;&emsp; &emsp;  #将当前目录下的所有目录和文件全部删除
### 修改目录（mv）
* mv 当前目录名 新目录名   &emsp;&emsp;&emsp;     #修改目录名，同样适用与文件操作
* mv /usr/tmp/tool /opt     &emsp;&emsp;&emsp;  #将/usr/tmp目录下的tool目录剪切到 /opt目录下面
* mv -r /usr/tmp/tool /opt   &emsp;&emsp;&emsp; #递归剪切目录中所有文件和文件夹
### 拷贝目录（cp）
* cp /usr/tmp/tool /opt     &emsp;&emsp;&emsp;  #将/usr/tmp目录下的tool目录复制到 /opt目录下面
* cp -r /usr/tmp/tool /opt  &emsp;&emsp;&emsp;  #递归剪复制目录中所有文件和文件夹
### 搜索目录（find）
* find /bin -name 'a*'     &emsp;&emsp; &emsp;  #查找/bin目录下的所有以a开头的文件或者目录
### 查看当前目录（pwd）
*  pwd                &emsp;&emsp;&emsp;         #显示当前位置路径
## 2.文件操作
### 新增文件（touch）
*  touch  a.txt   &emsp;&emsp;&emsp;      #在当前目录下创建名为a的txt文件（文件不存在），如果文件存在，将文件时间属性修改为当前系统时间
### 删除文件（rm）
* rm 文件名     &emsp;&emsp;&emsp;         #删除当前目录下的文件
* rm -f 文件名    &emsp;&emsp;&emsp;       #删除当前目录的的文件（不询问）
### 编辑文件（vim）
* vi 文件名     &emsp;&emsp;&emsp;         #打开需要编辑的文件
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

## 3.文件权限
### 权限说明
* 文件权限简介：'r' 代表可读（4），'w' 代表可写（2），'x' 代表执行权限（1），括号内代表"8421法"
* 文件权限信息示例：-rwxrw-r--
  * 第一位：'-'就代表是文件，'d'代表是文件夹
  * 第一组三位：拥有者的权限
  * 第二组三位：拥有者所在的组，组员的权限
  * 第三组三位：代表的是其他用户的权限
### 文件权限(chmod)
* 普通授权    chmod +x a.txt    
* 8421法     chmod 777 a.txt   &emsp;&emsp;&emsp;   #1+2+4=7，"7"说明授予所有权限
## 4.打包与解压
### 说明
* .zip、.rar    &emsp;&emsp;&emsp;     #windows系统中压缩文件的扩展名
* .tar          &emsp;&emsp;&emsp;     #Linux中打包文件的扩展名
* .gz           &emsp;&emsp;&emsp;     #Linux中压缩文件的扩展名
* .tar.gz       &emsp;&emsp;&emsp;     #Linux中打包并压缩文件的扩展名
### 打包文件
* tar -zcvf &emsp;&emsp;&emsp;  #打包压缩后的文件名 要打包的文件
  参数说明：z：调用gzip压缩命令进行压缩; c：打包文件; v：显示运行过程; f：指定文件名;
  示例：
  tar -zcvf a.tar file1 file2,...      #多个文件压缩打包

### 解压文件
* tar -zxvf a.tar          &emsp;&emsp;&emsp;             #解包至当前目录
* tar -zxvf a.tar -C /usr------   &emsp;&emsp;&emsp;      #指定解压的位置
* unzip test.zip       &emsp;&emsp;&emsp;       #解压*.zip文件 
* unzip -l test.zip     &emsp;&emsp;&emsp;      #查看*.zip文件的内容 
* unzip test.zip -d /usr------ &emsp;&emsp;&emsp;      #指定解压的位置
## 5.其他常用命令
### find命令
* find . -name "*.c"   &emsp;&emsp;&emsp;  #将目前目录及其子目录下所有延伸档名是 c 的文件列出来
* find . -type f       &emsp;&emsp;&emsp;  #将目前目录其其下子目录中所有一般文件列出
* find . -ctime -20    &emsp;&emsp;&emsp;  #将目前目录及其子目录下所有最近 20 天内更新过的文件列出
* find /var/log -type f -mtime +7 -ok rm {} \;  &emsp;&emsp;&emsp;   #查找/var/log目录中更改时间在7日以前的普通文件，并在删除之前询问它们
* find . -type f -perm 644 -exec ls -l {} \;   &emsp;&emsp;&emsp;    #查找前目录中文件属主具有读、写权限，并且文件所属组的用户和其他用户具有读权限的文件
* find / -type f -size 0 -exec ls -l {} \;     &emsp;&emsp;&emsp;    #为了查找系统中所有文件长度为0的普通文件，并列出它们的完整路径
### grep 命令
* grep -i "the" demo_file           &emsp;&emsp;&emsp;   #在文件中查找字符串(不区分大小写)
* grep -A 3 -i "example" demo_text  &emsp;&emsp;&emsp;   #输出成功匹配的行，以及该行之后的三行
* grep -r "ramesh" *                &emsp;&emsp;&emsp;   #在一个文件夹中递归查询包含指定字符串的文件
### free命令
* 说明：这个命令用于显示系统当前内存的使用情况，包括已用内存、可用内存和交换内存的情况 
* free -g        &emsp;&emsp;&emsp;    #以G为单位输出内存的使用量，-g为GB，-m为MB，-k为KB，-b为字节 
* free -t        &emsp;&emsp;&emsp;    #查看所有内存的汇总
### df命令
* 说明：显示文件系统的磁盘使用情况
* df -h       &emsp;&emsp;&emsp;     #一种易看的显示
### scp 命令
* 这里ssh -p 22 user@123456.com为例
* 从本地复制到远程：
  * scp -P 22 <文件> user@123456.com:/home/user/  ##（这里用户默认目录为/home/user/）
  * scp -rP 22 <文件夹> user@123456.com:/home/user/  
* 从远程复制到本地：
  * scp -rP 22 user@123456.com:/home/user/<文件夹名> C:\Users\Administrator\Desktop\<文件夹名> 
  * scp -P 22 user@123456.com:/home/user/ <文件名>  C:\Users\Administrator\Desktop\<文件名>
### wget命令
* 说明：使用wget从网上下载软件、音乐、视频 
* 示例：wget <下载网址>
  * #下载文件并以指定的文件名保存文件
  * wget -O <文件名> <下载网址>
## 6.GPU常用操作
### nvidia-smi命令
* 查看GPU使用信息
 
### Memory-Usage &emsp;&emsp;&emsp;# 内存使用情况
* 3MiB/25464MiB &emsp;&emsp;&emsp; # 前者表示已使用的显存，后者代表总的显存

### GPU-Util &emsp;&emsp;&emsp;# GPU使用率
* 0% &emsp;&emsp;&emsp;# 表示GPU使用率百分比

### Pwr:Usage/Cap
* 23W/450W&emsp;&emsp;&emsp; #前者表示GPU使用功率，后者表示GPU最大功耗
### ps命令
* 查看进程命令 输入命令：ps -ef  
### kill命令
* 杀死进程命令:
  * kill -9 <进程号> #强制删除进程
  * kill <进程号> #删除进程
例：删除python test.py进程，输入命令：kill -9 14482
### top命令
* top命令用来监控linux的系统状况，是常用的性能分析工具，能够实时显示系统中各个进程的资源占用情况。默认进入top时，各进程是按照CPU的占用量来排序的。
 

