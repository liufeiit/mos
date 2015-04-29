#!/bin/sh

mvn clean && mvn install  -Dmaven.test.skip=true
echo "build success"
scp -r api/target/scape-api.war root@aliyun:~/jetty/apps/
echo "deploy success"
