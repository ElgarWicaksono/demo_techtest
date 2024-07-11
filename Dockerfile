FROM eclipse-temurin:17-jdk-focal
WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
COPY src ./src

RUN chmod +x mvnw

CMD ["./mvnw", "spring-boot:run"]