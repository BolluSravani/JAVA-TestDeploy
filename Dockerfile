FROM openjdk:17-alpine

COPY target/hello-world.jar /src/main/hello-world.jar

WORKDIR /src/main

EXPOSE 80

ENTRYPOINT ["java", "-jar", "hello-world.jar"]
