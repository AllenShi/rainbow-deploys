FROM golang:latest as builder
WORKDIR /go/src/github.com/someone/rainbow-deploys/
COPY . .
RUN CGO_ENABLED=0 GOOS=linux make build

FROM scratch
COPY --from=builder /go/src/github.com/someone/rainbow-deploys/rainbow-deploys .
ARG COLOR
ENV COLOR ${COLOR}
ENTRYPOINT ["/rainbow-deploys"]
