1️⃣ Java + Maven Dockerfile
Used when building Java applications with Apache Maven.
# Build stage
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# Run stage
FROM openjdk:17
WORKDIR /app
COPY --from=build /app/target/app.jar app.jar
EXPOSE 8080
CMD ["java","-jar","app.jar"]

2️⃣ NodeJS Production Dockerfile
For production Node.js applications using Node.js.
FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install --production

COPY . .

EXPOSE 3000

3️⃣ Multi-Stage Dockerfile (Most Important)CMD ["node","app.js"]
# Build Stage
FROM node:18 AS build

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# Production Stage
FROM node:18-alpine

WORKDIR /app
COPY --from=build /app .

EXPOSE 3000

CMD ["node","app.js"]
