FROM maven:3.8.4-openjdk-11 AS build
COPY target/hello-print-0.0.1-SNAPSHOT-jar-with-dependencies.jar /usr/src/hello-print/
WORKDIR /usr/src/hello-print
CMD ["java", "-jar", "hello-print-0.0.1-SNAPSHOT-jar-with-dependencies.jar"]
