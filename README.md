> This repository is now [hosted on Gitlab](https://gitlab.com/romaricpascal/docker-lamp). Please head there if you wish to contribute. Thanks 🙂

lamp
====

A docker container hosting a LAMP stack, serving its content from `/var/www`.

It is built on top of the [docker MySQL image](https://registry.hub.docker.com/_/mysql/).
This means you can use the same environment variables to setup the root login (`MYSQL_ROOT_PASSWORD`), 
user credentials (`MYSQL_USER`, `MYSQL_PASSWORD`) and name of the database (`MYSQL_DATABASE`).

Use:
```
docker build -t <name-of-built-image>
docker run -p 80 -p 443 -v <path/on/host>:/var/www <name-of-built-image>
```
