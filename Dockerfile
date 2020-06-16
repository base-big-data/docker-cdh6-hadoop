FROM ccinn/cdh6:latest

LABEL maintainer="Caiwenhui <471113744@qq.com>"

USER root

ADD support.sh /support.sh
ADD conf/core-site.xml /etc/hadoop/conf/
ADD conf/hdfs-site.xml /etc/hadoop/conf/
ADD conf/mapred-site.xml /etc/hadoop/conf/
ADD bin/run.sh /bin/

RUN source /support.sh;\
  loop_exec 'yum install -y hadoop-hdfs-namenode'

RUN mkdir -p var/lib/hadoop-hdfs/cache/hdfs/dfs/name

WORKDIR /

EXPOSE 9870

CMD ["/bin/run.sh"]