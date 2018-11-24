#!/usr/bin/env bash

set -e

if [[ -z ${LOG_PATH+x} ]]; then export LOG_PATH="${HOME}/data/logs"; fi

# Use CMS by default
#JAVA_OPTS="${JAVA_OPTS} -XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyFraction=75"
# Use G1 by default
#JAVA_OPTS="${JAVA_OPTS} -XX:+UseG1GC"
JAVA_OPTS="${JAVA_OPTS} -XX:-OmitStackTraceInFastThrow -XX:+PrintFlagsFinal";
# http://stackoverflow.com/questions/137212/how-to-solve-performance-problem-with-java-securerandom
JAVA_OPTS="${JAVA_OPTS} -Djava.security.egd=file:/dev/urandom";
# Crash dump & Heap dump
if [[ "${JVM_DUMP_DISABLED}" != "true" ]]; then JAVA_OPTS="${JAVA_OPTS} -XX:ErrorFile=${LOG_PATH}/hs_err_%p.log -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=${LOG_PATH}/"; fi
# GC log
if [[ "${JVM_GCLOG_DISABLED}" != "true" ]]; then JAVA_OPTS="${JAVA_OPTS} -Xloggc:${LOG_PATH}/gc_%p.log -XX:+PrintGCDateStamps -XX:+PrintGCDetails -XX:+PrintGCApplicationConcurrentTime -XX:+PrintGCApplicationStoppedTime -XX:+PrintGC"; fi
if [[ -n "${SPRING_PROFILES_ACTIVE}" ]]; then JAVA_OPTS="${JAVA_OPTS} -Dspring.profiles.active=${SPRING_PROFILES_ACTIVE}"; fi
export JAVA_TOOL_OPTIONS="${JAVA_OPTS}"

. /opt/java_debug_monitor_profiler.sh

# if command starts with an option, prepend java
if [[ "${1:0:1}" == '-' ]]; then
    set -- java "$@" -jar *-exec.jar
elif [[ "${1:0:1}" != '/' ]]; then
    set -- java ${JAVA_OPTS} -jar *-exec.jar "$@"
fi

exec "$@"
