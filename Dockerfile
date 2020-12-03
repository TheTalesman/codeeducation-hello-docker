FROM golang:1.15

WORKDIR /go/src/helloworld

COPY . .
RUN go get

RUN GOOS=linux go build
EXPOSE 9090

ENTRYPOINT [ "./helloworld" ]