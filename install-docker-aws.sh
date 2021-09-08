#!/bin/bash
# https://docs.aws.amazon.com/AmazonECS/latest/developerguide/docker-basics.html
sudo yum update -y
sudo amazon-linux-extras install docker
sudo yum install docker
sudo service docker start
sudo systemctl enable docker
sudo usermod -a -G docker ec2-user
echo Please relogin to gain access to docker 
