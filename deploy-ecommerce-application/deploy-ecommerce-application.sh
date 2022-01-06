    #!/bin/bash

    #Installing all the required package

    sudo_password=caleston123

    for package in $(cat package)
    do
        echo $sudo_password | sudo --stdin yum install -y $package
    done

    #Starting and enabling service

    for service in firewalld mariadb httpd
    do
        echo $sudo_password | sudo --stdin systemctl enable $service --now
    done

    #Enabling ports through firewall

    for port in 3306/tcp 80/tcp
    do
        echo $sudo_password | sudo --stdin firewall-cmd --per --zone=public --add-port=$port
        echo $sudo_password | sudo --stdin firewall-cmd --reload
    done

    #Configuring database
    mysql -uroot -e "CREATE DATABASE ecomdb;"
    mysql -uroot -e "CREATE USER 'ecomuser'@'localhost' IDENTIFIED BY 'ecompassword';"
    mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'ecomuser'@'localhost';"
    mysql -uroot -e "FLUSH PRIVILEGES;"

    #Loading script into db
    sudo mysql < db-load-script.sql

    #Configure httpd
    sudo sed -i 's/index.html/index.php/g' /etc/httpd/conf/httpd.conf

    #Restarting httpd service
    echo $sudo_password | sudo --stdin systemctl start httpd


    #Download Code
    if [ -d /var/www/html/ ]
    then
        rm -rf /var/www/html/*
    fi
    sudo git clone https://github.com/kodekloudhub/learning-app-ecommerce.git /var/www/html/


    #Updating index.php
    sudo sed -i 's/172.20.1.101/localhost/g' /var/www/html/index.php