FROM golang:1.20.3-alpine3.17

LABEL maintainer "brodie <brodiep21@hotmail.com>"

WORKDIR /k8s

COPY go.mod .
COPY site.html .
COPY main.go .

RUN go mod download


ENV PORT 8081
RUN go build -o /gok8s

EXPOSE 8081

CMD ["/gok8s"]
