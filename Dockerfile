FROM golang:alpine AS builder
RUN apk update && apk add --no-cache git
ENV USER=appuser
ENV UID=10001 
RUN adduser \    
    --disabled-password \    
    --gecos "" \    
    --home "/nonexistent" \    
    --shell "/sbin/nologin" \    
    --no-create-home \    
    --uid "${UID}" \    
    "${USER}"

WORKDIR /go/src/helloworld

COPY . .
RUN go get -d -v

RUN GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /go/bin/hello



FROM scratch

COPY --from=builder /etc/passwd /etc/passwd
COPY --from=builder /etc/group /etc/group

COPY --from=builder /go/bin/hello /go/bin/hello
USER appuser:appuser
ENTRYPOINT [ "/go/bin/hello"]