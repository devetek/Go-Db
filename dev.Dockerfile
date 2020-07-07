FROM golang:1.14.3-alpine

WORKDIR /devetek

COPY . .

RUN apk update && apk upgrade; \
    apk add --no-cache postgresql-client; \
    go mod tidy; \
    rm -rf scripts volume main.go Makefile docker-compose.yml .gitignore .dockerignore;