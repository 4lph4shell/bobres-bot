#!/bin/bash

# Written By: Bobres-4lph4

if [ "$(id -u)" -ne 0 ]; then
    echo -e "\033[33mPlease run as root\033[0m"
    exit
fi

wait

echo -e "\e[32m

██████╗  ██████╗ ██████╗ ██████╗ ███████╗███████╗              ██████╗  ██████╗ ████████╗
██╔══██╗██╔═══██╗██╔══██╗██╔══██╗██╔════╝██╔════╝              ██╔══██╗██╔═══██╗╚══██╔══╝
██████╔╝██║   ██║██████╔╝██████╔╝█████╗  ███████╗    █████╗    ██████╔╝██║   ██║   ██║   
██╔══██╗██║   ██║██╔══██╗██╔══██╗██╔══╝  ╚════██║    ╚════╝    ██╔══██╗██║   ██║   ██║   
██████╔╝╚██████╔╝██████╔╝██║  ██║███████╗███████║              ██████╔╝╚██████╔╝   ██║   
╚═════╝  ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝              ╚═════╝  ╚═════╝    ╚═╝   
                                                                                         
 
                                                                                                   

\033[0m"
echo -e "    \e[31mTelegram Channel: \e[34m@Alph4ir\033[0m | \e[31mTelegram Group: \e[34m@ALPH4Co\033[0m\n"

#sleep
echo -e "\e[32mInstalling BOBres-Bot script ... \033[0m\n"
sleep 5

sudo apt update && apt upgrade -y
echo -e "\e[92mThe server was successfully updated ...\033[0m\n"


PKG=(
    lamp-server^
    libapache2-mod-php 
    mysql-server 
    apache2 
    php-mbstring 
    php-zip 
    php-gd 
    php-json 
    php-curl 
)

for i in "${PKG[@]}"
do
    dpkg -s $i &> /dev/null
    if [ $? -eq 0 ]; then
        echo "$i is already installed"
    else
        apt install $i -y
        if [ $? -ne 0 ]; then
            echo "Error installing $i"
            exit 1
        fi
    fi
done

echo -e "\n\e[92mPackages Installed Continuing ...\033[0m\n"

randomdbpasstxt69=$(openssl rand -base64 10 | tr -dc 'a-zA-Z0-9' | cut -c1-20)

echo 'phpmyadmin phpmyadmin/dbconfig-install boolean true' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/app-password-confirm password $randomdbpasstxt69' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/mysql/admin-pass password $randomdbpasstxt69' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/mysql/app-pass password $randomdbpasstxt69' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2' | debconf-set-selections
sudo apt-get install phpmyadmin -y
sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf
sudo a2enconf phpmyadmin.conf
sudo systemctl restart apache2

wait

sudo apt-get install -y php-soap
sudo apt-get install libapache2-mod-php

sudo systemctl enable mysql.service
sudo systemctl start mysql.service
sudo systemctl enable apache2
sudo systemctl start apache2

echo -e "\n\e[92m Setting Up UFW...\033[0m\n"

ufw allow 'Apache'

sudo systemctl restart apache2

echo -e "\n\e[92mInstalling ...\033[0m\n"

sleep 1

sudo apt-get install -y git
sudo apt-get install -y wget
sudo apt-get install -y unzip
sudo apt install curl -y
sudo apt-get install -y php-ssh2
sudo apt-get install -y libssh2-1-dev libssh2-1

sudo systemctl restart apache2.service

wait

git clone https://github.com/4lph4shell/bobres-bot.git /var/www/html/bobres-bot
sudo chown -R www-data:www-data /var/www/html/bobres-bot/
sudo chmod -R 755 /var/www/html/bobres-bot/
echo -e "\n\033[33mBOBres-Bot config and script have been installed successfully\033[0m"

wait
    
        
RANDOM_CODE=$(LC_CTYPE=C tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c 40)
mkdir "/var/www/html/${RANDOM_CODE}"
echo "Directory created: ${RANDOM_CODE}"
echo "Folder created successfully!"

 cd /var/www/html/
 wget -O BOBres-Botpanel.zip https://github.com/4lph4shell/bobres-bot/releases/download/v1.7.4.7/BOBres-Botpanel-main.zip

 file_to_transfer="/var/www/html/BOBres-Botpanel.zip"
 destination_dir=$(find /var/www/html -type d -name "*${RANDOM_CODE}*" -print -quit)

 if [ -z "$destination_dir" ]; then
   echo "Error: Could not find directory containing 'res' in '/var/www/html'"
   exit 1
 fi

 mv "$file_to_transfer" "$destination_dir/" && yes | unzip "$destination_dir/BOBres-Botpanel.zip" -d "$destination_dir/" && rm "$destination_dir/BOBres-Botpanel.zip" && sudo chmod -R 755 "$destination_dir/" && sudo chown -R www-data:www-data "$destination_dir/" 


wait


if [ ! -d "/root/confbobres" ]; then

    sudo mkdir /root/confbobres
    
    sleep 1
    
    touch /root/confbobres/dbrootbobres.txt
    sudo chmod -R 777 /root/confbobres/dbrootbobres.txt
    sleep 1
    
    randomdbpasstxt=$(openssl rand -base64 10 | tr -dc 'a-zA-Z0-9' | cut -c1-30)

    ASAS="$"

    echo "${ASAS}user = 'root';" >> /root/confbobres/dbrootbobres.txt
    echo "${ASAS}pass = '${randomdbpasstxt}';" >> /root/confbobres/dbrootbobres.txt
    #echo "${ASAS}paths = '${RANDOM_CODE}';" >> /root/confbobres/dbrootbobres.txt
    
    sleep 1

    passs=$(cat /root/confbobres/dbrootbobres.txt | grep '$pass' | cut -d"'" -f2)
    userrr=$(cat /root/confbobres/dbrootbobres.txt | grep '$user' | cut -d"'" -f2)

    sudo mysql -u $userrr -p$passs -e "alter user '$userrr'@'localhost' identified with mysql_native_password by '$passs';FLUSH PRIVILEGES;"

    echo "SELECT 1" | mysql -u$userrr -p$passs 2>/dev/null

    echo "Folder created successfully My 4lph4 Lord!"
else
    echo "Folder already exists."
fi

clear

echo " "
echo -e "\e[32m


██████╗  ██████╗ ██████╗ ██████╗ ███████╗███████╗              ███████╗███████╗██╗     
██╔══██╗██╔═══██╗██╔══██╗██╔══██╗██╔════╝██╔════╝              ██╔════╝██╔════╝██║     
██████╔╝██║   ██║██████╔╝██████╔╝█████╗  ███████╗    █████╗    ███████╗███████╗██║     
██╔══██╗██║   ██║██╔══██╗██╔══██╗██╔══╝  ╚════██║    ╚════╝    ╚════██║╚════██║██║     
██████╔╝╚██████╔╝██████╔╝██║  ██║███████╗███████║              ███████║███████║███████╗
╚═════╝  ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝              ╚══════╝╚══════╝╚══════╝
                                                                                       

                                                                                         
  

\033[0m\n"

read -p "Enter the Server domain: " domainname
if [ "$domainname" = "" ]; then

echo -e "\n\033[91mPlease wait My 4lph4 lord...\033[0m\n"
sleep 3

echo -e "\e[36mNothing was registered for the your server domain.\033[0m\n"

echo -e "\n\033[0m Good Luck My 4lph4 lord\n"

else
# variables
DOMAIN_NAME="$domainname"
# WILDCARD_DOMAIN="*.$wildcarddomain"

# update cron
PATHS=$(cat /root/confbobres/dbrootbobres.txt | grep '$path' | cut -d"'" -f2)
(crontab -l ; echo "* * * * * curl https://${DOMAIN_NAME}/bobres-bot/settings/messagebobres.php >/dev/null 2>&1") | sort - | uniq - | crontab -
(crontab -l ; echo "* * * * * curl https://${DOMAIN_NAME}/bobres-bot/settings/rewardReport.php >/dev/null 2>&1") | sort - | uniq - | crontab -
(crontab -l ; echo "* * * * * curl https://${DOMAIN_NAME}/bobres-bot/settings/warnusers.php >/dev/null 2>&1") | sort - | uniq - | crontab -
(crontab -l ; echo "* * * * * curl https://${DOMAIN_NAME}/bobres-bot/settings/gift2all.php >/dev/null 2>&1") | sort - | uniq - | crontab -
(crontab -l ; echo "*/3 * * * * curl https://${DOMAIN_NAME}/bobres-bot/settings/tronChecker.php >/dev/null 2>&1") | sort - | uniq - | crontab -
(crontab -l ; echo "* * * * * curl https://${DOMAIN_NAME}/${PATHS}/backupnutif.php >/dev/null 2>&1") | sort - | uniq - | crontab -

echo -e "\n\e[92m Setting Up Cron...\033[0m\n"

# Allow HTTP and HTTPS traffic
echo -e "\n\033[1;7;31mAllowing HTTP and HTTPS traffic...\033[0m\n"
sudo ufw allow 80
sudo ufw allow 443

# Let's Encrypt
echo -e "\n\033[1;7;32mInstalling Let's Encrypt...\033[0m\n"
sudo apt install letsencrypt -y

# automatic certificate renewal
echo -e "\n\033[1;7;33mEnabling automatic certificate renewal...\033[0m\n"
sudo systemctl enable certbot.timer

# SSL certificate using standalone mode
echo -e "\n\033[1;7;34mObtaining SSL certificate using standalone mode...\033[0m\n"
sudo certbot certonly --standalone --agree-tos --preferred-challenges http -d $DOMAIN_NAME

# Certbot Apache plugin
echo -e "\n\033[1;7;35mInstalling Certbot Apache plugin...\033[0m\n"
sudo apt install python3-certbot-apache -y

# SSL certificate using Apache plugin
echo -e "\n\033[1;7;36mObtaining SSL certificate using Apache plugin...\033[0m\n"
sudo certbot --apache --agree-tos --preferred-challenges http -d $DOMAIN_NAME

# echo -e "\n\033[1;7;33mObtaining SSL certificate using manual DNS mode (wildcard)...\033[0m\n"
# sudo certbot certonly --manual --agree-tos --preferred-challenges dns -d $DOMAIN_NAME -d $WILDCARD_DOMAIN


echo -e "\e[32m======================================"
echo -e "SSL certificate obtained successfully!"
echo -e "======================================\033[0m"


wait

echo " "

ROOT_PASSWORD=$(cat /root/confbobres/dbrootbobres.txt | grep '$pass' | cut -d"'" -f2)
ROOT_USER="root"
echo "SELECT 1" | mysql -u$ROOT_USER -p$ROOT_PASSWORD 2>/dev/null


if [ $? -eq 0 ]; then

wait

    randomdbpass=$(openssl rand -base64 10 | tr -dc 'a-zA-Z0-9' | cut -c1-22)

    randomdbdb=$(openssl rand -base64 10 | tr -dc 'a-zA-Z0-9' | cut -c1-22)

    if [[ $(mysql -u root -p$ROOT_PASSWORD -e "SHOW DATABASES LIKE 'bobres'") ]]; then
        clear
        echo -e "\n\e[91mYou have already created the database\033[0m\n"
    else
        dbname=bobres
        clear
        echo -e "\n\e[32mPlease enter the database username!\033[0m"
        printf "[+] Default user name is \e[91m${randomdbdb}\e[0m ( let it blank to use this user name ): "
        read dbuser
        if [ "$dbuser" = "" ]; then
        dbuser=$randomdbdb
        fi

        echo -e "\n\e[32mPlease enter the database password!\033[0m"
        printf "[+] Default user name is \e[91m${randomdbpass}\e[0m ( let it blank to use this user name ): "
        read dbpass
        if [ "$dbpass" = "" ]; then
        dbpass=$randomdbpass
        fi

        mysql -u root -p$ROOT_PASSWORD -e "CREATE DATABASE $dbname;" -e "CREATE USER '$dbuser'@'%' IDENTIFIED WITH mysql_native_password BY '$dbpass';GRANT ALL PRIVILEGES ON * . * TO '$dbuser'@'%';FLUSH PRIVILEGES;" -e "CREATE USER '$dbuser'@'localhost' IDENTIFIED WITH mysql_native_password BY '$dbpass';GRANT ALL PRIVILEGES ON * . * TO '$dbuser'@'localhost';FLUSH PRIVILEGES;"
        
        echo -e "\n\e[95mBobres Database Created.\033[0m"
        
        wait
        


        printf "\n\e[33m[+] \e[36mBot Token: \033[0m"
        read YOUR_BOT_TOKEN
        printf "\e[33m[+] \e[36mChat id: \033[0m"
        read YOUR_CHAT_ID
        printf "\e[33m[+] \e[36mDomain: \033[0m"
        read YOUR_DOMAIN
        echo " "
        if [ "$YOUR_BOT_TOKEN" = "" ] || [ "$YOUR_DOMAIN" = "" ] || [ "$YOUR_CHAT_ID" = "" ]; then
           exit
        fi

        ASAS="$"
	
        wait

        sleep 1
        
        file_path="/var/www/html/bobres-bot/baseInfo.php"
        
        if [ -f "$file_path" ]; then
          rm "$file_path"
          echo -e "File deleted successfully."
        else
          echo -e "File not found."
        fi
        
        sleep 2
        
        # print file
        echo -e "<?php" >> /var/www/html/bobres-bot/baseInfo.php
        echo -e "error_reporting(0);" >> /var/www/html/bobres-bot/baseInfo.php
        echo -e "${ASAS}botToken = '${YOUR_BOT_TOKEN}';" >> /var/www/html/bobres-bot/baseInfo.php
        echo -e "${ASAS}dbUserName = '${dbuser}';" >> /var/www/html/bobres-bot/baseInfo.php
        echo -e "${ASAS}dbPassword = '${dbpass}';" >> /var/www/html/bobres-bot/baseInfo.php
        echo -e "${ASAS}dbName = '${dbname}';" >> /var/www/html/bobres-bot/baseInfo.php
        echo -e "${ASAS}botUrl = 'https://${YOUR_DOMAIN}/bobres-bot/';" >> /var/www/html/bobres-bot/baseInfo.php
        echo -e "${ASAS}admin = ${YOUR_CHAT_ID};" >> /var/www/html/bobres-bot/baseInfo.php
        echo -e "?>" >> /var/www/html/bobres-bot/baseInfo.php

        sleep 1

        curl -F "url=https://${YOUR_DOMAIN}/bobres-bot/bot.php" "https://api.telegram.org/bot${YOUR_BOT_TOKEN}/setWebhook"
        MESSAGE="✅ The 4lph4-bobres bot has been successfully installed My AlphA Lord! @Alph4ir"
        curl -s -X POST "https://api.telegram.org/bot${YOUR_BOT_TOKEN}/sendMessage" -d chat_id="${YOUR_CHAT_ID}" -d text="$MESSAGE"
        
        
        sleep 1
        
        url="https://${YOUR_DOMAIN}/bobres-bot/createDB.php"
        curl $url
        
        sleep 1
        
        sudo rm -r /var/www/html/bobres-bot/webpanel
        sudo rm -r /var/www/html/bobres-bot/install
        sudo rm /var/www/html/bobres-bot/createDB.php
	rm /var/www/html/bobres-bot/updateShareConfig.php
	rm /var/www/html/bobres-bot/README.md
	rm /var/www/html/bobres-bot/README-fa.md
	rm /var/www/html/bobres-bot/LICENSE
	rm /var/www/html/bobres-bot/update.sh
	rm /var/www/html/bobres-bot/bobres.sh
	rm /var/www/html/bobres-bot/tempCookie.txt
	rm /var/www/html/bobres-bot/settings/messagebobres.json
            
        clear
        
        echo " "
        
        echo -e "\e[100mDatabase information:\033[0m"
	echo -e "\e[33maddres: \e[36mhttps://${YOUR_DOMAIN}/phpmyadmin\033[0m"
        echo -e "\e[33mDatabase name: \e[36m${dbname}\033[0m"
        echo -e "\e[33mDatabase username: \e[36m${dbuser}\033[0m"
        echo -e "\e[33mDatabase password: \e[36m${dbpass}\033[0m"
        echo " "
        echo -e "\e[100mbobres panel:\033[0m"
        echo -e "\e[33maddress: \e[36mhttps://${YOUR_DOMAIN}/${RANDOM_CODE}/login.php\033[0m"
        
        echo " "
        
        echo -e "Good Luck My 4lph4 Lord! \e[94mThis project is for you. If you like it, be sure to donate me :) , so let's go \033[0m\n"

        fi


        elif [ "$ROOT_PASSWORD" = "" ] || [ "$ROOT_USER" = "" ]; then
        echo -e "\n\e[36mThe password is empty.\033[0m\n"
        else 
        
        echo -e "\n\e[36mThe password is not correct.\033[0m\n"

        fi

fi
