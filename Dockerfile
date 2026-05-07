# FROM maven:3.9.7-eclipse-temurin-17 AS build
# RUN git clone https://github.com/dummyrepos/spring-petclinic-june24.git
# RUN cd spring-petclinic-june24 && mvn clean package



# FROM amazoncorretto:17-alpine-jdk
# RUN mkdir /spc && chown nobody /spc
# USER nobody
# WORKDIR /spc
# COPY --from=build --chown=nobody /spring-petclinic-june24/target/spring-petclinic-3.3.0-SNAPSHOT.jar /spc/spring-petclinic.jar
# EXPOSE 8080
# CMD ["java", "-jar", "spring-petclinic.jar"]

# FROM maven:3.9.7-eclipse-temurin-17 AS build

# WORKDIR /spc-app

# COPY . .

# RUN mvn clean package -DskipTests

# FROM amazoncorretto:17

# # Set working directory inside container
# WORKDIR /spc-app

# # Copy the Maven-built JAR from target/
# COPY --from=build /spc-app/target/*.jar app.jar

# # Expose the port the app runs on
# EXPOSE 8080

# # Run the Spring Boot JAR
# ENTRYPOINT ["java","-jar","app.jar"]

FROM amazoncorretto:17

# Set working directory
WORKDIR /spc-app

# Copy jar built by GitHub Actions
COPY target/*.jar app.jar

# Expose Spring Boot port
EXPOSE 8080

# Run application
ENTRYPOINT ["java", "-jar", "app.jar"]