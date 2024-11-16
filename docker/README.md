# Simple docker examples

### Get IP

`
docker inspect CONTAINER_ID  | grep IPAddress. 
`

## Postgress

https://hub.docker.com/_/postgres

`
docker run --name local-postgres -p 5432:5432 -e POSTGRES_PASSWORD=admin -d postgres
`

`
docker exec -u postgres -it local-postgres bash
`


## MySQL

https://hub.docker.com/_/mysql

`
docker run --name local-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=admin -d mysql:5.7
`

`
docker exec -it local-mysql bash
`

## Node

`
docker run -it --rm -v %cd%:/app -w /app  -p 5000:5000 -p 3000:3000 node:16 bash
`

## Portainer

`
docker run -d \
  -p 9443:9443 \
  --name portainer \
  --restart unless-stopped \
  -v data:/data \
  -v /var/run/docker.sock:/var/run/docker.sock \
  portainer/portainer-ce:latest
`

https://localhost:9443