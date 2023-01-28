FROM openjdk:17-jdk-slim

WORKDIR /usr/app

COPY src/Monitoring-CO2-server-0.0.1-SNAPSHOT.jar .
# COPY src/application.properties .

# EXPOSE 8080

CMD ["java", "-jar", "Monitoring-CO2-server-0.0.1-SNAPSHOT.jar", "-Dspring.config.location=application.properties"]
