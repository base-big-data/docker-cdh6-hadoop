# docker-cdh6-hadoop
base on cdh6 hadoop


docker build -t ccinn/cdh6-hadoop .

docker network create docker-cdh6

docker run --net docker-cdh6 -it -d --rm -p 9870:9870 ccinn/cdh6-hadoop