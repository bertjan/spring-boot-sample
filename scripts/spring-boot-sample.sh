#!/bin/sh
date
ls -l target/spring-boot-sample.jar
echo "running spring-boot-sample....."
java -jar target/spring-boot-sample.jar > /tmp/spring-boot-sample.log 2>&1 &