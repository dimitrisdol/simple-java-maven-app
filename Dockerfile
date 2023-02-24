FROM maven:3.5-jdk-8 AS build  
COPY src /src
COPY pom.xml  pom.xml
RUN mvn -f pom.xml clean package

FROM gcr.io/distroless/java  
COPY --from=build target/my-app-1.0-SNAPSHOT.jar my-app-1.0-SNAPSHOT.jar  
EXPOSE 9090  
ENTRYPOINT ["java","-jar","my-app-1.0-SNAPSHOT.jar"]  