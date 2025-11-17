#!/bin/bash
yum install -y httpd
echo "Bem vindo ao meu site via Auto Scaling!" > /var/www/html/index.html
systemctl start httpd
systemctl enable httpd
