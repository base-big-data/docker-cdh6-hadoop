#!/bin/bash

namedir="/var/lib/hadoop-hdfs/cache/hdfs/dfs/name/"
if [ ! -d $namedir ]; then
  echo "Namenode name directory not found: $namedir"
  exit 2
fi

if [ ! -e "${namedir}/current" ]; then
  echo "Formatting namenode name directory: $namedir"
  /usr/bin/hdfs --config /etc/hadoop/conf namenode -format
fi

# 后台进程模式启动namenode
/usr/bin/hdfs --config /etc/hadoop/conf --daemon start namenode

# 前台模式启动datanode
/usr/bin/hdfs --config /etc/hadoop/conf datanode