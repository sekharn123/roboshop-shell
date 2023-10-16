echo -e "\e[32m downloding mongodb repo \e[0m"
cp /root/roboshop-shell/mongodb.repo /etc/yum.repos.d/mongodb.repo
echo -e "\e[32m installing mongodb server\e[0m"
yum install mongodb-org -y
echo -e "\e[32m changing the listen address\e[0m"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
echo -e "\e[32m Enabling and starting the mongodb server\e[0m"
systemctl enable mongod
systemctl restart mongod
