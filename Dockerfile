FROM openjdk:11-alpine

COPY target/hello-world.jar /app/hello-world.jar

WORKDIR /app

EXPOSE 80

ENTRYPOINT ["java", "-jar", "hello-world.jar"]
