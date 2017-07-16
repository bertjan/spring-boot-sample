#!/bin/sh
date
ls -l target/spring-boot-sample.jar
echo "running spring-boot-sample....."
/root/software/java_1.8.131/jdk1.8.0_131/bin/java -jar target/spring-boot-sample.jar > /tmp/spring-boot-sample.log 2>&1 &
