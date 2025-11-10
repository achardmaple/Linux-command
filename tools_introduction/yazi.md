# Yazi

一个现代化的文件管理器。

## 安装

[Yazi官方安装文档](https://yazi-rs.github.io/docs/installation)

## 配置

[Yazi官方配置文档](https://yazi-rs.github.io/docs/configuration/overview)

为 Yazi 设置退出时自动跳转目录，同时设置别名，可在 `~/.bashrc` 或 `~/.zshrc` 中添加：

```bash
# cd to the directory where you view when you quit yazi
yy() {
    local _yy_tmp=; local _yy_cwd=
    _yy_tmp="$(command mktemp -t "yazi-cwd.XXXXXX")"
    command yazi "$@" --cwd-file="$_yy_tmp"

    _yy_cwd="$(cat -- "$_yy_tmp")"
    command rm -f -- "$_yy_tmp"

    if [ -n "$_yy_cwd" ] && [ "$_yy_cwd" != "$PWD" ]; then
        cd -- "$_yy_cwd"
    fi
}
```

如果同时安装了 `zoxide`，并且 cd 命令报错，可将 `cd -- "$_yy_cwd"` 改为 `cd "$_yy_cwd"`。
