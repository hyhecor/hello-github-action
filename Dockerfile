FROM docker.io/golang AS builder

WORKDIR /src

COPY . .

RUN go build -o /src/bin/hello main.go


FROM docker.io/alpine

WORKDIR /app

COPY --from=builder /src/bin/hello .

ENTRYPOINT ["/app/hello"]
