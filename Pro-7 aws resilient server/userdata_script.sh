#!/bin/bash
yum install -y httpd
sleep 5
aws s3 sync://yr_bucket /var/www/html/ --region us-east-1
sleep 5
echo $(hostname) >>/var/www/html/index.html
service httpd restart