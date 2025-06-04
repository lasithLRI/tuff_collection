FROM maven:3.8.6-amazoncorretto-17

WORKDIR /app

COPY pom.xml .

COPY src ./src

RUN mvn clean package -DskipTests

# Run the build

FROM openjdk:17

WORKDIR /app

COPY --from=build /app/target/tuff_backend.jar app.jar

EXPOSE 7575
CMD ["java", "-jar", "app.jar"]
