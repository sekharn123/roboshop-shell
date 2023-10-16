echo -e "\e[33m Installing nginx Server \e[0m"
yum install nginx -y &>>/tmp/roboshop.log
echo -e "\e[33m Removing default nginx content\e[0m"
cd /usr/share/nginx/html
rm -rf * &>>/tmp/roboshop.log
echo -e "\e[33m Download New Content to nginx \e[0m"
curl -O https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>/tmp/roboshop.log
unzip frontend.zip &>>/tmp/roboshop.log
rm -rf frontend.zip
echo -e "\e[33m Configuring reverse proxy server\e[0m"
cp /root/roboshop-shell/roboshop.conf /etc/nginx/default.d/roboshop.conf
echo -e "\e[33m Enabling and starting the nginx server\e[0m"
systemctl enable nginx &>>/tmp/roboshop.log
systemctl restart nginx
