#!/bin/sh

mvn clean && mvn install  -Dmaven.test.skip=true
echo "build success"
scp -r api/target/scape-api.war root@wjz:~/jetty/apps/
echo "deploy success"
