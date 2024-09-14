#!/bin/bash

# 输出脚本的用途
echo "查看所有LXC容器的磁盘占用情况"

# 获取所有LXC容器的列表
containers=$(lxc list -c n --format=csv)

# 如果没有找到容器，提示用户
if [ -z "$containers" ]; then
    echo "没有找到LXC容器"
    exit 1
fi

# 遍历每个容器
for container in $containers; do
    # 输出容器名称
    echo "容器: $container"

    # 使用lxc exec命令进入容器并查看磁盘使用情况
    # df -h 显示人类可读格式的磁盘使用
    echo "磁盘使用情况："
    lxc exec "$container" -- df -h /

    echo "---------------------------------"
done
