#!/bin/bash
# 타임존 세팅
rm /etc/localtime
ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# nginx 설치
amazon-linux-extras install nginx1 -y
systemctl enable nginx
systemctl start nginx
chmod 755 /var/log/nginx

# nginx config file 위치 이동
mv /home/ec2-user/nginx/*.conf /etc/nginx/conf.d/
rm -rf /home/ec2-user/nginx

systemctl restart nginx

# open jdk 11 설치
amazon-linux-extras install java-openjdk11 -y

# deploy.sh 권한 변경
chmod +x /home/ec2-user/deploy.sh