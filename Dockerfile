FROM golang:1.20-alpine3.17 as builder

WORKDIR /app

COPY *.go ./

RUN go mod init challenge-1 && go build

RUN go mod download

FROM scratch
WORKDIR /exec
COPY --from=builder /app/challenge-1 .
CMD ["/exec/challenge-1"]
