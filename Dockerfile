FROM maven:3.8.6-jdk-11 AS build  
COPY src ./src
COPY pom.xml  .
RUN mvn clean package

FROM openjdk:11-jre-slim
COPY --from=build target/my-app-1.0-SNAPSHOT.jar my-app-1.0-SNAPSHOT.jar  
EXPOSE 9090  
ENTRYPOINT ["java","-jar","my-app-1.0-SNAPSHOT.jar"]  
ENTRYPOINT ["tail", "-f", "/dev/null"]
