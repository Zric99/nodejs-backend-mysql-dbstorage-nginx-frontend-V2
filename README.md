# Bezkoder´s 'Node.js Rest APIs with Express, Sequelize & MySQL example' as an Docker-Container

The Docker Compose script will build a container from the backend code (https://github.com/bezkoder/nodejs-express-sequelize-mysql) using the Dockerfile, which will run as the backend. As a data store for the backend, a database based on Mysql is also started in the Docker-Compose script.

The backend can only be called via an Nginx frontend which is also started as a separate container by the Docker Compose script.

Separating the frontend and backend networks in Docker-Compose.yml ensures that only the frontend, and not the backend or database directly, can be accessed from both the host and other clients.

The environment variables in Docker-Compose.yml can be used to edit the database credential.

If the ports used here are already in use on the host system, those can be edited in Docker-Compose.yml. It is important to mention that the ports should then also get adjusted in the file 'conf.d/default.conf' at 'proxy_pass'. 

## Run
In foreground:
```
docker-compose up
```
In background:
```
docker-compose up -d
```
