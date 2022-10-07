# Api Docker Setup
Simple demo api based on FastAPI and mariadb.

## Start the Containers

Start your local docker containers in a console window with `docker-compose up -d`. 
After a while (and a lot of messages) you should have 3 containers running:
- php-apache: Containing Apache Webserver and PHP
- MariaDB: your database server for SQL

## Test the Installation
Call `http://localhost:8004/animal` to see a list of animals currently in the db.
This route supports the typical CRUD operations.

## Stop the Containers
Call `docker-compose down` to stop the containers.

## Settings
- docker-compose.yml -- used ports
- api/.env for fastapi database settings
- env.txt root pwd of the databse

