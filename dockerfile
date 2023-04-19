FROM golang:1.20.3-alpine3.17

LABEL maintainer "brodie <brodiep21@hotmail.com>"

WORKDIR /

COPY . .

RUN go mod tidy

ENV PORT 8080
EXPOSE 8080

RUN go build

ENTRYPOINT go run main.go
