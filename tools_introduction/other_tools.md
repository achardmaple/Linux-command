# Other Tools

## Content

- [lftp](#lftp)
- [zoxide](#zoxide)
- [croc](#croc)

## lftp

支持多种文件传输协议（ftp/sftp等）的命令行文件传输工具。

安装: `sudo apt install lftp`

连接文件服务器（以sftp协议为例）: `lftp sftp://username@hostname[:port]`

可用命令:

- `put/get`: 上传/下载文件
- `mput/mget`: 上传/下载多个文件
- `ls/cd/pwd/rm/mkdir`: 远程文件系统的命令
- `lcd/lpwd`: 对本地系统的命令
- `!` + 命令: 执行本地shell命令
- `exit`: 退出lftp

## zoxide

快速切换目录工具，可视为 `cd` 的增强版。

安装: `sudo apt install zoxide` or `curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh`

配置: 在 `~/.zshrc` 中添加 `eval "$(zoxide init --cmd cd zsh)"` 来初始化 `zoxide` 并替换默认的 `cd` 命令.

`zoxide` 可以记录历史跳转记录，下次跳转时可以只输入目标目录的部分字符，`zoxide` 会自动匹配最近访问频繁的目录。

## croc

跨平台的快捷文件传输工具。

发送文件: `croc send filename`

发送后会生成一条短链，其他设备可以通过该短链接收文件。
