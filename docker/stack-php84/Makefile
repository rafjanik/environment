include .env
export $(shell sed 's/=.*//' .env)

.PHONY: start stop build up down restart ssh

# --- System ---

start: down up tools

stop: tools-stop down

build:
	docker-compose build

up:
	docker-compose up -d

down:
	docker-compose down

restart:
	$(MAKE) down build up

shell:
	docker exec -it $(APP_HOST)-nginx sh
	
frontend-build:
	docker run -it --rm -v ./src:/app -w /app node:22-alpine npm run build

# --- Backup and restore ---

backup: 
	@echo "backup ..."

restore: 
	@echo "restore ..."

clear: 
	sudo rm -rf ./infrastructure/mariadb/data/* ./infrastructure/mariadb/logs/* ./infrastructure/mariadb/data/.my-healthcheck.cnf
	sudo rm -rf ./infrastructure/postgres/data/* ./infrastructure/postgres/logs/*
	sudo rm -rf ./infrastructure/redis/data/* ./infrastructure/redis/logs/*
	sudo rm -rf ./infrastructure/portainer/data/* ./infrastructure/portainer/logs/*
	sudo rm -rf ./infrastructure/pgadmin/data/* ./infrastructure/pgadmin/logs/*
	sudo rm -rf ./infrastructure/php84-nginx/logs/*

# --- Tools ---

tools: portainer pgadmin adminer phpmyadmin redisinsight mailhog

tools-stop: portainer-stop pgadmin-stop adminer-stop phpmyadmin-stop redisinsight-stop mailhog-stop

portainer:
	docker run -d \
	-p 9443:9443 \
	-v ./infrastructure/portainer/data:/data \
	-v /var/run/docker.sock:/var/run/docker.sock \
	--rm \
	--name portainer \
	portainer/portainer-ce:latest

portainer-stop:
	docker stop portainer

pgadmin:
	docker run -d \
	-p 5050:80 \
	-e PGADMIN_DEFAULT_EMAIL=$(PGADMIN_DEFAULT_EMAIL) \
	-e PGADMIN_DEFAULT_PASSWORD=$(PGADMIN_DEFAULT_PASSWORD) \
	-v ./infrastructure/pgadmin/data:/var/lib/pgadmin \
	--rm \
	--name pgadmin \
	--user root \
	dpage/pgadmin4:latest

pgadmin-stop:
	docker stop pgadmin

adminer:
	docker run -d \
	-p 8080:8080 \
	--rm \
	--name adminer \
	adminer:latest

adminer-stop:
	docker stop adminer

phpmyadmin:
	docker run -d \
	-p 8081:80 \
	-e PMA_HOST=mysql \
	-e PMA_PORT=3306 \
	--rm \
	--name phpmyadmin \
	phpmyadmin

phpmyadmin-stop:
	docker stop phpmyadmin

redisinsight:
	docker run -d \
	-p 8082:5540 \
	-v ./infrastructure/redis/data:/data \
	--rm \
	--name redisinsight \
	--user root \
	redis/redisinsight:latest 

redisinsight-stop:
	docker stop redisinsight

mailhog:
	docker run -d \
	-p 8025:8025 \
	-p 1025:1025 \
	--rm \
	--name mailhog \
	mailhog/mailhog

mailhog-stop:
	docker stop mailhog
