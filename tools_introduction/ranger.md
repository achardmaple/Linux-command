# Ranger 介绍

## 描述

Ranger 是一款基于 Python 的文件管理器，可以自定义快捷键，支持 VI 编辑模式。

## 目录

* [安装与配置](#安装与配置)
* [基本操作](#基本操作)

## 安装与配置

1. 通过 pip 安装 ranger。

    ```bash
    sudo pip3 install ranger-fm
    ```

2. 将 [5 个配置文件](/tools_config_example/ranger/) 放入 ~/.config/ranger/ 中。

3. 在 rc.conf 中设置快捷键。

## 基本操作

1. 移动操作，与 Vim 类似。

    * 使用 h,j,k,l 键移动光标。
    * 使用 J,K 键快速移动（自定义）。
    * 使用 gg 移动到文件列表的顶部。
    * 使用 G 移动到文件列表的底部。
    * 使用 / 键搜索文件。
    * 使用 n 键搜索下一个匹配项。
    * 使用 N 键搜索上一个匹配项。

2. 常用操作

    * 使用 dD 删除文件。
    * 使用 dd 剪切文件。
    * 使用 yy 复制文件。
    * 使用 pp 粘贴文件。
    * 使用 q 退出 ranger。
    * 使用 : 进入命令模式。

3. 常用命令

    * :rename xxx 重命名文件。
