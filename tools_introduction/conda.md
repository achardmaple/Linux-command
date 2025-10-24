# conda指令相关

* [启用conda环境](#启用conda环境)
* [显示conda下的虚拟环境](#显示conda下的虚拟环境)
* [conda虚拟环境相关](#conda虚拟环境相关)

## 启用conda环境

* source ./.bashrc

## 显示conda下的虚拟环境

* conda info -e
* conda env list

## conda虚拟环境相关

### 新建虚拟环境

* conda create -n [name] python=[python_version]

### 激活虚拟环境

* conda activate [name]

### 退出虚拟环境

* conda deactivate

### 删除虚拟环境

* conda remove -n [name] --all

### 复制虚拟环境

* conda create -n [new_name] --clone [old_name]
