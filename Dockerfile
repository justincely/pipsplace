# syntax-docker/dockerfile:1

FROM golang:1.19 AS build-stage
RUN mkdir /app
WORKDIR /app
COPY . .
RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux go build -o main ./...


FROM alpine:latest AS production
COPY --from=build-stage /app/main .
COPY --from=build-stage /app/config.yaml .
CMD ["./main"] 