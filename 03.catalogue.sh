echo -e "\e[34m downloading nodejs repo/e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
echo -e "\e[34m installing nodejs server]"
yum install nodejs -y
echo -e "\e[34m adding user and location\e[0m"
useradd roboshop
mkdir /app
cd /app
echo -e "\e[34m Downloading the app content\e[0m"
curl -O https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
unzip catalogue.zip
rm -rf catalogue.zip
npm install
echo -e "\e[34m creating the catalogue service\e[0m"
cp /root/roboshop-shell/catalogue.service /etc/systemd/system/catalogue.service
echo -e "\e[34m downloading and installing mongodb schema\e[0m"
cp /root/roboshop-shell/mongodb.repo  /etc/yum.repos.d/mongo.repo
yum install mongodb-org-shell -y
mongo --host mongodb-dev.sekhar.cloud</app/schema/catalogue.js
echo -e "\e[34m Enabling and starting the catalogue service\e[0m"
systemctl daemon-reload
systemctl enable catalogue
systemctl restart catalogue
