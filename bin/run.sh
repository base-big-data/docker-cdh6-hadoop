#!/bin/bash

namedir="/var/lib/hadoop-hdfs/cache/hdfs/dfs/name/current"
if [ ! -d $namedir ]; then
  echo "Namenode name directory not found: $namedir"
  exit 2
fi

if [ ! -e ${namedir} ]; then
  echo "Formatting namenode name directory: $namedir"
  /usr/bin/hdfs --config /etc/hadoop/conf namenode -format
fi

/usr/bin/hdfs --config /etc/hadoop/conf namenode