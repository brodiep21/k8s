FROM goalng:latest

LABEL maintainer "brodie <brodiep21@hotmail.com>"

WORKDIR /k8s

COPY go.mod .
COPY site.html .
COPY main.go .

ENV PORT 8080

RUN go build

ENTRYPOINT go run main.go
