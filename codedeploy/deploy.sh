#!/bin/bash
nohup java -jar -Dserver.port=8090 /home/ec2-user/application.jar 1> /dev/null 2>&1 &
sleep 30s