FROM ccinn/cdh6:latest

LABEL maintainer="Caiwenhui <471113744@qq.com>"

USER root

ADD support.sh /support.sh
ADD conf/core-site.xml /etc/hadoop/conf/
ADD conf/hdfs-site.xml /etc/hadoop/conf/
ADD conf/mapred-site.xml /etc/hadoop/conf/
ADD bin/run.sh /bin/

RUN source /support.sh;\
  loop_exec 'yum install -y hadoop-hdfs-namenode hadoop-hdfs-datanode'

RUN mkdir -p var/lib/hadoop-hdfs/cache/hdfs/dfs/name;\
  mkdir -p var/lib/hadoop-hdfs/cache/hdfs/dfs/data;

WORKDIR /

# 9870 namenode's http
# 9864 datanode's http

EXPOSE 9870 9864

CMD ["/bin/run.sh"]