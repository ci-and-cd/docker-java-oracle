# docker-java
-----

With:

- remote debug
- jmc
- /opt/ejstatd/ejstatd-1.0.0.jar
- jmxremote
- jprofiler agent
- JAVA_OPTS -Duser.language=zh -Duser.region=CN -Dfile.encoding=UTF-8 -Duser.timezone=Asia/Shanghai

Env variables:

- EUREKA_INSTANCE_HOSTNAME
- JAVA_DEBUG_PORT
- JAVA_JMC_ENABLED
- JAVA_JSTATD_RMI_PORT
- JAVA_JSTATD_RH_PORT
- JAVA_JSTATD_RV_PORT
- JAVA_JMX_PORT
- SECURITY_USER_NAME
- SECURITY_USER_PASSWORD

```
docker-compose -f docker-compose.yml build
```

## java8
A java 8 docker image

```
docker build -t cirepo/java:oracle-8u171-jdk-alpine ./java8 -f Dockerfile
docker save cirepo/java:oracle-8u171-jdk-alpine > ${HOME}/Desktop/oss-java-oracle-8u171-jdk-alpine.tar
```


## java9
A java 9 docker image

```
docker build -t cirepo/java:oracle-9.0.4-jdk-alpine ./java9 -f Dockerfile
docker save cirepo/java:oracle-9.0.4-jdk-alpine > ${HOME}/Desktop/oss-java-oracle-9.0.4-jdk-alpine.tar
```

see: https://blog.dekstroza.io/building-minimal-docker-containers-with-java-9/
