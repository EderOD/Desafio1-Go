FROM golang:1.16-buster AS build

WORKDIR /app


RUN go mod init docker-bin
COPY *.go ./
RUN go build -o /docker-bin

# deploy
FROM scratch
WORKDIR /
COPY --from=build /docker-bin /docker-bin
ENTRYPOINT ["/docker-bin"]