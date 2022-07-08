#!/bin/bash

DEMO_HOST="demo"
TARGET_JAR=app/target/*.jar

if [ "$1" = "production" ]; then
    DAIJIN_HOST="demo-production"
fi

echo "Deploy to $DEMO_HOST"

mvn clean package -DskipUTs -DskipITs && \
scp $TARGET_JAR $DEMO_HOST:~ && \
ssh $DEMO_HOST -tt "/opt/restart_demo.sh $(basename $TARGET_JAR)"