# docker-java-oracle
-----

Oracle Java docker image with locale settings

Features:

- remote debug
- jmc
- /opt/ejstatd/ejstatd-1.0.0.jar
- jmxremote
- jprofiler agent
- JAVA_OPTS -Duser.language=en -Duser.region=US -Dfile.encoding=UTF-8 -Duser.timezone=Etc/UTC

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

## Java8
Oracle Java 8 docker image

cirepo/java-oracle:8u181-en_US.UTF-8_Etc.UTC-alpine


## Java9
Oracle Java 9 docker image

cirepo/java-oracle:9.0.4-en_US.UTF-8_Etc.UTC-alpine

see: https://blog.dekstroza.io/building-minimal-docker-containers-with-java-9/
