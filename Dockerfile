FROM golang:1.17 as build
WORKDIR /build
COPY server.go .
ENV CGO_ENABLED=0
RUN go build server.go

FROM scratch
WORKDIR /app
COPY --from=build /build/server .
CMD ["./server"]
EXPOSE 80
