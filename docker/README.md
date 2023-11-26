# Docker提交文档

<br/>
<br/>

## 期末项目docker提交说明


请所有的队伍最终使用docker进行代码的提交，docker运行目录下需要有一个`run.sh`文件接收两个参数：输入文件路径，输出文件路径

测试运行命令举例, 假设是队伍1提交的镜像（镜像名称为 sub1）
```bash
docker run --ipc=host --gpus all  --rm -v `pwd`:/mount sub1 bash run.sh /mount/query.fasta /mount/output.out
```

<br/>
<br/>
<br/>
<br/>



## Docker镜像打包简易指南

本指南旨在为初学者提供关于Docker镜像构建的基础知识。如果您已经熟悉Docker的构建流程，可以跳过本教程。对于教程中的任何问题或建议，欢迎提出以便我们进行更新和改进。

### 确定适合的容器版本

1. 访问[NVIDIA提供的PyTorch Container页面](https://docs.nvidia.com/deeplearning/frameworks/pytorch-release-notes/rel-23-06.html#rel-23-06)。
2. 根据您的CUDA版本和PyTorch版本，选择合适的容器。例如，如果您使用的是`PyTorch 2.0.0`，并且在NVIDIA页面上看到与之对应的Docker容器版本为23.05，那么您应该将Dockerfile中的第一行从`FROM nvcr.io/nvidia/pytorch:21.02-py3`更改为`FROM nvcr.io/nvidia/pytorch:23.05-py3`。
3. 如需帮助确定CUDA版本，您可以在终端运行`nvidia-smi`。

### 安装Python依赖导出库

运行以下命令安装`pipreqs`：

```bash
pip install pipreqs
```

`pipreqs`用于自动生成项目依赖文件`requirements.txt`，确保在不同环境中一致性。

### 准备构建文件

将`Dockerfile`和`build.sh`复制到您的项目根目录。这两个文件分别用于定义Docker镜像的构建指令和自动化构建流程。

### 构建Docker镜像

在项目目录下运行以下命令以构建镜像：

```bash
bash build.sh
```

在执行过程中，会要求您输入队伍的编号，以便为镜像命名。

此操作将创建一个名为`sub$number`的Docker镜像，其中`$number`是队伍编号。构建完成后，您可以根据第一部分的运行指令测试是否能够正常的运行。

#### 常见错误与解决方案

- 如果在构建过程中遇到权限问题，请联系助教确认是否已经授予docker权限
    > permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get "http://%2Fvar%2Frun%2Fdocker.sock/v1.24/containers/json": dial unix /var/run/docker.sock: connect: permission denied


### 附加资源

为了更深入地了解Docker及其应用，您可以参考以下资源：

- [Docker官方文档](https://docs.docker.com/)
- [Docker入门教程 - 阮一峰](https://www.ruanyifeng.com/blog/2018/02/docker-tutorial.html)
