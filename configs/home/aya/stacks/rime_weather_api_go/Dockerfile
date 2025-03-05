FROM golang AS builder

WORKDIR /build

ADD . /build

RUN CGO_ENABLED=0 go build -trimpath -ldflags '-w -s' ./weather_api.go

FROM alpine:3.21 AS runner

WORKDIR /app

COPY --from=builder /build/weather_api .

CMD [ "./weather_api" ]
