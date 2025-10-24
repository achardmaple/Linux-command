# git

## 目录

- [简介](#简介)
- [新建仓库](#新建仓库)
- [忽略文件](#忽略文件)
- [提交](#提交)
- [推送和拉取](#推送和拉取)
- [分支管理](#分支管理)
- [版本查看和回退](#版本查看和回退)
- [大文件管理](#大文件管理)

## 简介

git 是目前最流行的版本控制系统，用于代码项目管理，其最大的特点是可以记录每次代码的变更，并提供版本回退功能。

## 新建仓库

- 新建本地仓库
  - `mkdir 仓库名`
  - `cd 仓库名`
  - `git init`
- 在服务器新建空仓库
  - `mkdir 仓库名`
  - `cd 仓库名`
  - `git init --bare`
- 克隆远程仓库
  - `git clone 远程仓库地址`
  - 如果远程仓库是自己服务器上的仓库，则远程仓库地址为 `用户名@服务器地址:/仓库名.git`，用户名一般设为 `git`

## 忽略文件

在项目中，有些文件或目录不希望被纳入版本控制，如日志、缓存、临时文件、编译产物、个人的配置文件等。  
为此，git 提供了 `.gitignore` 文件，用于配置忽略规则。

- `.gitignore` 作用范围
  - 对 `.gitignore` 文件所在的目录及其子目录递归生效
  - 子目录中 `.gitignore` 文件的规则会优先于父目录中的规则生效
- `.gitignore` 语法
  - 规则以 `#` 开头表示注释
  - 规则以 `/` 结尾表示目录
  - 规则以 `*` 开头表示通配符
  - 规则以 `!` 开头表示排除规则
  - 规则以 `\` 转义特殊字符
- `.gitignore` 示例
  - `*.log`：忽略所有 `.log` 文件
  - `logs/`: 忽略 `logs` 目录及其子目录
  - `!logs/important.log`: 排除 `logs/important.log` 文件
  - `*.tmp`: 忽略所有 `.tmp` 文件
  - `config.ini`: 忽略 `config.ini` 文件
  - `config/*.ini`: 忽略 `config` 目录下所有 `.ini` 文件
  - `config/secret.ini`: 忽略 `config/secret.ini` 文件

## 提交

1. 添加文件
   - `git add 文件名`
   - `git add .` 或 `git add -A`：添加所有文件
2. 提交更改
   - `git commit`：提交更改，会打开编辑器输入提交说明
   - `git commit -m "提交说明"`：提交更改，并添加单句提交说明
   - 提交说明的常用书写格式(前缀)
     - `feat: 添加新功能`：新功能
     - `fix: 修复Bug`：修复Bug
     - `docs: 文档更新`：文档更新
     - `style: 代码格式优化`：代码格式优化
     - `refactor: 代码重构`：代码重构，用于修改了代码但是没有增加新功能或修复Bug时
     - `test: 测试用例更新`：测试用例更新

## 推送和拉取

推送和拉取是 git 与远程仓库进行交互的两种主要操作，分别用于将本地仓库的变更推送到远程仓库，以及从远程仓库拉取别人的变更。  
在代码提交之后使用。

### 推送

- 推送本地仓库到远程仓库：`git push 远程仓库名 本地分支名[:远程分支名]`
- 推送所有分支到远程仓库：`git push 远程仓库名 --all`
- 在推送时加上 `-u` 参数，建立本地分支和远程分支的跟踪关系，之后就可以使用 `git push` 命令来简化推送命令

### 拉取

- 拉取远程仓库到本地仓库：`git pull 远程仓库名 远程分支名[:本地分支名]`
- 拉取所有分支到本地仓库：`git pull 远程仓库名 --all`
- 拉取时，如果本地分支与远程分支存在追踪关系，则可以省略远程分支名，如 `git pull 远程仓库名`

### 冲突处理

在进行 `push/pull` 操作时，如果本地分支和远程分支存在冲突，则需要手动解决冲突。

- push 时冲突
  - 先 `git pull` 或 `git pull --rebase`，再 `git push`
- pull 时冲突
  - `git pull` 时发生冲突，会自动尝试 merge 合并，如果失败，则会提示冲突文件，需要手动解决冲突
  - 冲突文件可以通过 `git status` 命令查看
  - 冲突文件中的冲突内容以 `<<<<<<<`、`=======`、`>>>>>>>` 标记

    ```text
     <<<<<<< HEAD
     本地修改内容
     =======
     远程修改内容
     >>>>>>> 远程commit_id
    ```

  - 删除不需要的行，保留需要的行，并将 `<<<<<<<`、`=======`、`>>>>>>>` 标记删除
  - 解决冲突后，需要再次 `add` 并 `commit` 解决冲突文件
- pull --rebase 时冲突
  - `git pull --rebase` 时发生冲突，会自动尝试 rebase 合并，如果失败，则会提示冲突文件，需要手动解决冲突
  - 冲突文件可以通过 `git status` 命令查看
  - 冲突解决方法和 merge 时相同
  - 解决冲突后，需要 `add` 并 `git rebase --continue`
  - 在 rebase 过程中，可以通过 `git rebase --abort` 终止 rebase 操作并回退到 pull 之前的状态
  - 在 rebase 过程中，可以通过 `git rebase --skip` 跳过当前提交，即放弃本地更改，保留远程的更改
- 冲突解决后，需要再次进行 push 操作

## 分支管理

- 查看分支
  - 查看本地分支：`git branch [-l]`
  - 查看远程分支：`git branch [-r]`
  - 查看所有分支：`git branch [-a]`
- 创建分支
  - 创建但不切换分支：`git branch 新分支名`
  - 创建并切换分支：`git checkout -b 新分支名`
- 切换分支：`git checkout 分支名`
- 删除分支：`git branch -d 分支名`
- 重命名分支：`git branch -m 旧分支名 新分支名`
- 管理本地与远程分支的跟踪关系
  - 查看跟踪关系：`git branch -vv`
  - 建立跟踪关系
    - 通过远程分支创建本地分支
      - `git branch -t 本地分支名 远程分支名`
      - `git checkout -b 本地分支名 远程分支名`
    - 关联已有本地分支和远程分支
      - `git branch -u 远程分支名 [本地分支名]`
      - `git push -u 远程仓库名 本地分支名[:远程分支名]`
    - 解除跟踪关系：`git branch --unset-upstream [分支名]`

## 版本查看和回退

### 查看历史提交

- 查看提交历史：`git log`
- 查看本地仓库引用变更记录：`git reflog`
- 查看详细提交信息：`git show <commit_id>`
- 查看两个提交间的差异：`git diff <commit_id1> <commit_id2>`，其中 commit_id1 为较旧提交，commit_id2 为较新提交，如 `git diff HEAD^ HEAD`

### 回退版本

- 回退到指定版本：`git reset --hard <commit_id>`
- commit_id 可以用 `HEAD` 替代
- `HEAD^` 中的 `^` 表示上一个提交，`n` 个 `^` 表示第 `n` 次前的提交
- 除 `HEAD^` 外，还可以用 `HEAD~n` 表示第 `n` 次前的提交

## 大文件管理

对于项目中的大文件，如图片、视频、二进制文件等，git 难以追踪其变更。  
直接使用 git 对大文件进行管理，会导致仓库占用过多的磁盘空间，文件过大时甚至可能无法提交。  
为此，git 提供了大文件管理工具 git-lfs（Git Large File Storage）。

1. 初始化 git lfs
    - `git lfs install`

2. 追踪文件
    - 建立追踪
      - `git lfs track "*.png"`
      - `git lfs track "assets/*"`
    - 查看追踪
      - `git lfs track`
    - 取消追踪
      - `git lfs untrack "*.png"`

3. 提交更改
    - `git add .gitattributes`
    - `git add -A`
    - `git commit -m "Add files with LFS"`
