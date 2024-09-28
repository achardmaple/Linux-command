# Neovim 介绍

## 描述

本文介绍 Vim / Neovim 的基本使用方法，vim 脚本语言的常用语法，并推荐一些相关插件。

## 目录

* [Vim 模式介绍和基本操作](#vim-模式介绍和基本操作)
* [Neovim 配置介绍](#neovim-配置介绍)
* [插件推荐](#插件推荐)
* [如何通过示例的 init.vim 配置 Neovim](#如何通过示例的-initvim-配置-neovim)

## Vim 模式介绍和基本操作

通常情况下用户所接触到的 Vim 模式有四种：

1. 普通模式(Normal)

    普通模式用于移动光标、复制、粘贴、删除等操作。按下 Esc 键可进入普通模式。

    * 光标移动：h、j、k、l 或 方向键  
    * 复制：y  
    * 粘贴：p 或 P  
    * 删除：x 或 d  
    * 更改：c  
    * 替换：r 或 R  
    * 搜索：/ 或 ?  
    * 按照单词进行移动：w、e、b 等  
    * w 与 y、d、c 等配合使用，表示对单词进行操作  
    * yy、dd 等命令，表示复制/删除整行或整段内容  

2. 插入模式(Insert)

    插入模式用于输入文本。在普通模式下，按下 i、I、a、A、o、O 键可进入插入模式。

3. 命令模式(Command)

    命令模式用于执行命令，如保存文件、打开文件、查找替换等。在普通模式下，按下 : 键可进入命令模式。常用命令有：

    * :w 保存文件  
    * :q 退出并保存文件  
    * :q! 强制退出并不保存文件  
    * :wq 保存并退出  
    * :e 文件名 打开文件

4. 可视模式(Visual)

    可视模式用于选中文本块，在普通模式下，按下 v、V、Ctrl+v 进入可视模式。

    在可视模式下可通过移动光标选中文本块，并进行复制、粘贴、删除等操作。

Vim 的其他快捷键和功能可参考网络上其他人的博客自行学习。

## Neovim 配置介绍

Neovim 较于 Vim 的优点本文不再赘述。

Neovim 可通过 vim 脚本或 lua 脚本二者之一进行配置，本文介绍通过 vim 脚本进行配置的方法。

Neovim 的配置文件为 init.vim，位于 ~/.config/nvim/init.vim。

接下来将通过示例的 [init.vim](./init.vim) 配置文件介绍配置文件中常使用到的 vim 脚本语句，以下将 Vim / Neovim 均简称为 vim。

1. set 指令

    对 vim / neovim 的选项进行配置，如以下语句可使 vim 显示行号：

    ```vim
    set nu
    ```

2. 按键映射指令

    按键映射指令可将一个按键映射为另一个按键或一个函数，常用的按键映射指令有 map、noremap、nmap、imap等，这些指令看似复杂，但实际上这些指令可以分为 3 个部分记忆。

    * map: 基础按键映射指令  
    * i、n、v: 分别对应插入模式、普通模式、可视模式  
    * nore: 非递归  

    例如示例 init.vim 文件中:

    ```vim
    " 映射 jj 为 Esc 键
    imap jj <Esc>

    " 映射 J 为按下 5 次 j 键，便于快速移动
    " 但为防止 5j 与刚才映射的 jj 冲突，需使用 noremap 防止递归
    noremap J 5j

    " 将 Ctrl+c、Ctrl+v 映射为复制、粘贴
    vnoremap <C-c> y
    inoremap <C-v> <Esc>pa
    ```

3. 插件管理

    插件管理器可用于管理 Neovim 插件。  
    本文以 vim-plug 为例，安装插件后，需在 init.vim 文件中添加以下语句：

    ```vim
    call plug#begin()
    Plug 'github_username/plugin_name'
    call plug#end()
    ```

4. 设置插件的变量/参数

    若插件有可配置的参数，可在 init.vim 文件中通过 let 语句设置插件的参数。  
    例如示例 init.vim 文件中有:

    ```vim
    " 设置树的显示图标
    let g:NERDTreeDirArrowExpandable = '▸'
    let g:NERDTreeDirArrowCollapsible = '▾'
    let NERDTreeIgnore = ['\.pyc$']  " 过滤所有.pyc文件不显示
    let g:NERDTreeShowLineNumbers=1  " 是否显示行号
    let g:NERDTreeHidden=0     " 不显示隐藏文件
    ```

    具体参数可参照相应插件的文档。

5. 在 init.vim 中使用 lua 脚本

    Neovim 也支持 lua 脚本，但配置文件只能使用 vim 脚本或 lua 脚本中的一个，不能同时使用两个配置文件，但可以通过在 init.vim 中调用 lua 脚本来实现二者混用。  
    在 init.vim 中调用 lua 脚本的语法为:

    ```vim
    lua << EOF
    -- lua 脚本内容
    EOF
    ```

    例如示例 init.vim 文件中有:

    ```vim
    lua << EOF
    require('fittencode').setup()
    EOF
    ```

## 插件推荐

插件推荐如 [init.vim](./init.vim) 中所示，请自行查看。

## 如何通过示例的 init.vim 配置 Neovim

1. 安装 vim-plug 插件管理器

    ```bash
    wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    mkdir -p ~/.local/share/nvim/site/autoload/
    mv plug.vim ~/.local/share/nvim/site/autoload/
    ```

2. 将 init.vim 放在 ~/.config/nvim/ 下

3. 安装 Neovim 插件所依赖的工具: autopep8, jq, libxml2, libxml2-utils, node.js

    ```bash
    pip3 install autopep8
    apt install jq libxml2 libxml2-utils nodejs
    ```

4. 若 node.js 版本过低，不足以支持 neovim 插件工作，可通过以下命令安装较高版本的 node.js

    ```bash
    curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
    apt install nodejs
    ```

5. 若 Neovim 版本过低，不足以支持插件工作，可通过以下命令安装较高版本的 Neovim

    ```bash
    sudo add-apt-repository ppa:neovim-ppa/unstable
    apt install neovim
    ```

6. 若目录树的图标无法正常显示，请安装 Nerd Fonts。
