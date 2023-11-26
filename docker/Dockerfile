# 使用NVIDIA PyTorch镜像作为基础镜像
FROM nvcr.io/nvidia/pytorch:21.02-py3

# 将工作目录设置为/app
WORKDIR /app

# 将当前目录下的所有文件（除了.dockerignore排除的路径）复制到容器的/app下
ADD . /app

# 安装需要的包
RUN pip install --no-cache-dir -r requirements.txt