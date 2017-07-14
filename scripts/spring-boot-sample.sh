#!/bin/sh
date
echo "running spring-boot-sample....."
java -jar target/spring-boot-sample.jar > /tmp/spring-boot-sample.log 2>&1 &