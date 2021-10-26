FROM golang:1.17-alpine AS builder

RUN apk add --no-cache git

WORKDIR /tmp/app

# We want to populate the module cache based on the go.{mod,sum} files.
COPY go.mod .
COPY go.sum .

RUN go mod download

COPY . .

# Build the Go app
RUN go build -o ./dist .

# Start fresh from a smaller image
FROM alpine:3.9 
RUN apk add ca-certificates

COPY --from=builder /tmp/app/dist /app/run

# Run the binary program produced by the builder
CMD ["/app/run"]
