# Tmux 介绍

## 描述

tmux 是一个 Linux 下的终端复用工具。本文将介绍 tmux 的基本用法（不包含 tmux 的美化）。

## 目录

* [常用指令](#常用指令)
* [常用快捷键](#常用快捷键)
* [配置文件](#配置文件)

## 常用指令

* tmux      &emsp;&emsp;&emsp;     # 创建一个新会话（默认名字为从 0 开始的整数）
* tmux new -s session_name &emsp;  # 创建一个新会话（指定名字）
* tmux ls    &emsp;&emsp;&emsp;    # 列出所有会话
* tmux a     &emsp;&emsp;&emsp;    # 进入上一个会话
* tmux a -t session_name &emsp;    # 进入指定会话

## 常用快捷键

tmux 的快捷键以 `<prefix>` 为前缀开始，默认的 `<prefix>` 是 `Ctrl-b`。

* `<prefix> c`  &emsp;&emsp;&emsp;    # 创建一个新窗口
* `<prefix> 数字`  &emsp;&emsp;&emsp;    # 切换窗口
* `<prefix> "`  &emsp;&emsp;&emsp;    # 上下分割窗口（新建窗格）
* `<prefix> %`  &emsp;&emsp;&emsp;    # 左右分割窗口（新建窗格）
* `<prefix> x`  &emsp;&emsp;&emsp;    # 关闭当前窗格
* `<prefix> d`  &emsp;&emsp;&emsp;    # 挂起当前会话（后台运行）
* `<prefix> 方向键`  &emsp;&emsp;&emsp;    # 切换窗格
* `<prefix> z`  &emsp;&emsp;&emsp;    # 最大/最小化当前窗格

## 配置文件

tmux 的配置文件为 `~/.tmux.conf`，可在其中进行绑定快捷键等操作。

* set   &emsp;&emsp;&emsp;    # 设置 tmux 选项
* unbind   &emsp;&emsp;&emsp;    # 解除绑定快捷键
* bind   &emsp;&emsp;&emsp;    # 绑定快捷键

[.tmux.conf 示例](/tools_config_example/tmux/.tmux.conf)
