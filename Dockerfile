# Use Maven to build the project
FROM maven:3.8.4-openjdk-11 AS build

# Set the working directory
WORKDIR /usr/src/hello-print

# Copy the pom.xml and other necessary files
COPY pom.xml ./
COPY src ./src

# Build the JAR file
RUN mvn clean package

# Use OpenJDK to run the application
FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /usr/src/hello-print

# Copy the JAR file from the build stage
COPY --from=build /usr/src/hello-print/target/hello-print-0.0.1-SNAPSHOT.jar ./

# Command to run the application
CMD ["java", "-jar", "hello-print-0.0.1-SNAPSHOT.jar"]
