
# Run
## Start
```
make
```
## Stop
```
make stop
```
# Connection

## Postgresql
```
jdbc:postgresql://localhost:5432/
```
## MariaDB
```
jdbc:mariadb://localhost:3306/demo
```
## Redis
```
jdbc:redis://localhost:6379/0
```
# Admin

## Portainer

https://localhost:9443


## Pgadmin

http://localhost:5050


## Adminer

http://localhost:8080


## PhpMyAdmin

http://localhost:8081

## RabbitMQ

http://localhost:15672

Login: guest
Hasło: guest

## Redisinsight

http://localhost:8082


## Mailhog

http://localhost:8025


# Other

Composer update
```
composer self-update
```

Install laravel
```
echo 'export PATH="/root/.config/herd-lite/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
/bin/bash -c "$(curl -fsSL https://php.new/install/linux/8.4)"
```

Create new project laravel
```
laravel new demo
mv demo/.* demo/* . 2>/dev/null
rmdir demo
chmod -R 777 .
```
```
DB_CONNECTION=mariadb
DB_HOST=mariadb
DB_PORT=3306
DB_DATABASE=demo
DB_USERNAME=demo
DB_PASSWORD=qwerty
```
```
DB_CONNECTION=pgsql
DB_HOST=postgres
DB_PORT=5432
DB_DATABASE=demo
DB_USERNAME=demo
DB_PASSWORD=qwerty
```
```
MAIL_MAILER=smtp
MAIL_HOST=mailhog
MAIL_PORT=1025
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null
MAIL_FROM_ADDRESS="test@example.com"
MAIL_FROM_NAME="${APP_NAME}"
```