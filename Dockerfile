FROM golang:alpine AS builder
WORKDIR /app
RUN apk add --no-cache git
RUN git clone https://github.com/apernet/hysteria.git . && go build -o hysteria ./cmd/server


FROM alpine
COPY --from=builder /app/hysteria /usr/bin/hysteria
COPY config.yaml /etc/hysteria/config.yaml
CMD ["hysteria", "-c", "/etc/hysteria/config.yaml"]
