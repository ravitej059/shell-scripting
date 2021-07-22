HEAD() {
  echo -n -e "\e[1m $1 \e[0m \t\t ... "
}

STAT() {
  if [ $1 -eq 0 ]; then
    echo -e "\e[1;32m done\e[0m"
  else
    echo -e "\e[1;31m fail\e[0m"
    echo -e "\e[1;33m Check the log for more detail ... Log-File : /tmp/roboshop.log\e[0m"
    exit 1
  fi
  }
APP_USER_ADD() {
  HEAD "Add roboshop APP User"
id roboshop &>>/tmp/roboshop.log

if [ $? -eq 0 ]; then
echo user is Already is there, so skipping  the user creation &>>/tmp/roboshop.log
 STAT $?
else
 useradd roboshop &>>/tmp/roboshop.log
 STAT $?

 fi
}
  NODEJS (){
    HEAD "Install Nodejs"
yum install nodejs make gcc-c++ -y &>>/tmp/roboshop.log
STAT $?
APP_USER_ADD

HEAD " Download  App From Github"
curl -s -L -o /tmp/$1.zip "https://github.com/roboshop-devops-project/$1/archive/main.zip"
STAT $?

HEAD "Extract  the Downloaded Archive"
cd /home/roboshop && rm -rf $1 && unzip -o /tmp/$1.zip &>>/tmp/roboshop.log && mv $1-main-$1
STAT $?

HEAD "Install NodeJS Dependencies"
cd /home/roboshop/$1 && npm install --unsafe-perm &>>/tmp/roboshop.log
STAT $?

HEAD "Fix Permission to the App Contenet"
chown roboshop:roboshop /home/roboshop  -R
STAT $?

HEAD "Setup Systemd Service"
sed -i -e 's/MONGO_DNSNAME/mongodb.roboshop.internal/' /home/roboshop/$1/systemd.service  && mv /home/roboshop/$1/systemd.service /etc/systemd/system/$1.service
STAT $?

HEAD "Start $1 Service"
systemctl daemon-reload && systemctl enable $1 &>>/tmp/roboshop.log && systemctl restart $1 &>>/tmp/roboshop.log
STAT $?


  }
