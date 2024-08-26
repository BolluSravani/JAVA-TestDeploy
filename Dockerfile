FROM openjdk:11-alpine

COPY target/hello-world.jar /app/hello-world.jar

WORKDIR /app

ENTRYPOINT ["java", "-jar", "hello-world.jar"]
