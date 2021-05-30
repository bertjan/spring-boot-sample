FROM alpine

RUN apk update && \
    apk upgrade 
RUN apk add openjdk8
ADD ./target/spring-boot-sample.jar /spring-boot-sample.jar
ENTRYPOINT ["java", "-jar", "spring-boot-sample.jar"]