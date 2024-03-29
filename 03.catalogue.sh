echo -e "\e[34m downloading nodejs server]"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
echo -e "\e[34m installing nodejs server]"
yum install nodejs -y
echo -e "\e[34m adding user\e[0m"
useradd roboshop
echo -e "\e[34m creating a directory\e[0m"
mkdir /app
cd /app
echo -e "\e[34m Downloading the catalogue\e[0m"
curl -O https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
unzip catalogue.zip
rm -rf catalogue.zip
echo -e "\e[34m downloading the dependencies\e[0m"
npm install
echo -e "\e[34m creating the catalogue service\e[0m"
cp /root/roboshop-shell/catalogue.service /etc/systemd/system/catalogue.service
echo -e "\e[34m downloading and installing mongodb schema\e[0m"
cp /root/roboshop-shell/catalogue.service /etc/systemd/system/catalogue.service
yum install mongodb-org-shell -y
mongo --host mongodb-dev.sekhar.cloud</app/schema/catalogue.js
echo -e "\e[34m Enabling and starting the catalogue service\e[0m"
systemctl daemon-reload
systemctl enable catalogue
systemctl restart catalogue
