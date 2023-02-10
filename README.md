# Monitoring CO2 - Server-Docker

Files required to set up Docker and deploy the Monitoring CO2 backend server with all dependencies

## Docker compose schematic

![Docker schematic](https://raw.githubusercontent.com/Monitoring-CO2/.github/main/images/Docker_schematic.jpg)

## How to deploy

In order to run the Monitoring CO2 backend server, you will need to set up the docker compose, there are two ways to do so.

- Downloading a prebuilt docker image : the image will already contain the latest version of the backend server **as it is in its GitHub repository [here](https://github.com/Monitoring-CO2/Backend-server)**
- Building the backend server .jar yourself and building the Docker image yourself

The first method is the simplest one but if you need to make changes to the backend server, you may find it simpler to just clone its repo, modify it and use the second method to deploy it.

### First method (downloading a prebuilt image)

Open a shell on the machine where you want to deploy the Monitoring CO2 backend server and follow the steps :

1. Create a folder where you want to put the server files for example `Monitoring_CO2`
2. Copy in that folder the following files :  
   - **[docker-compose.yml](https://github.com/Monitoring-CO2/Server-Docker/blob/main/docker-compose.yml)**
   - **[deploy.sh](https://github.com/Monitoring-CO2/Server-Docker/blob/main/deploy.sh)**
   - **[application.properties](https://github.com/Monitoring-CO2/Backend-server#server-setup-required)** : copy your custom application.properties and make sure to apply the [specific Docker configuration](#docker-compose-applicationproperties)
3. Make the script executable with : `chmod +x deploy.sh`
4. Run the script with : `./deploy.sh`

### Second method (building yourself)

1. Create a folder where you want to put the server files for example `Monitoring_CO2`
2. Copy in that folder the following files :  
    - **[docker-compose.yml](docker-compose.yml)**
    - **[deploy.sh](deploy.sh)**
    - **[application.properties](https://github.com/Monitoring-CO2/Backend-server#server-setup-required)** : copy your custom application.properties and make sure to apply the [specific Docker configuration](#docker-compose-applicationproperties)
    - **Monitoring-CO2-server.jar** : the .jar you built yourself by following the instructions [here](https://github.com/Monitoring-CO2/Backend-server#building-the-server)
    - **[Dockerfile](Dockerfile)**
3. Edit the **docker-compose.yml** file and change the following lines at the top :
   - From :
     ```yaml
       server_co2:
         image: ghcr.io/monitoring-co2/backend-server:main
         # build: .
     ```
   - To :
     ```yaml
       server_co2:
         # image: ghcr.io/monitoring-co2/backend-server:main
         build: .
     ```
4. Make the script executable with : `chmod +x deploy.sh`
5. Run the script with : `./deploy.sh`

## Docker compose `application.properties`

The [application.properties](https://github.com/Monitoring-CO2/Backend-server#server-setup-required) file needs to be configured properly for the backend server to work within the Docker compose.  
Set the following key/value pair :
- **server.port**=8080
- **spring.data.mongodb.host**=mongodb_co2
- **spring.data.mongodb.port**=27017
- **influxdb.url**=http://influxdb_co2:8086
