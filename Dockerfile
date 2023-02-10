FROM openjdk:17-jdk-slim

WORKDIR /usr/app

COPY Monitoring-CO2-server.jar .

# EXPOSE 8080

CMD ["java", "-jar", "Monitoring-CO2-server.jar", "-Dspring.config.location=application.properties"]
