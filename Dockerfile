FROM golang:1.19-alpine3.16 as builder
WORKDIR /root/paas-prometheus-exporter
COPY . .
RUN go build

FROM alpine:3.17.0
COPY --from=builder /root/paas-prometheus-exporter /usr/local/bin
CMD paas-prometheus-exporter
