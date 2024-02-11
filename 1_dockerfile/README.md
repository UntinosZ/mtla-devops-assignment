
# Create a Dockerfile for a given application

I'm separate section build and runnner with Multistage Dockerfile and use upx to reduce image size and use distroless for run application with static state

if build with normal Dockerfile without alpine base image size will huge more than 9xx MB
and then use alpine image still large more than 3xx MB
until multistage image size ruduce to 1x MB
final with upx and distroless and ldflags latest size is 4MB
```
# base image
FROM golang:1.22.0-alpine3.18 as base
WORKDIR /builder
RUN apk add upx

ENV GO111MODULE=on CGO_ENABLED=0

COPY go.mod go.sum /builder/
RUN go mod download

COPY . .

RUN go build \
    -ldflags "-s -w" \
    -o /builder/main /builder/main.go
RUN upx -9 /builder/main

# runner image
FROM gcr.io/distroless/static:latest
WORKDIR /app
COPY --from=base /builder/main main

EXPOSE 8080
CMD ["/app/main"]
```
## Reference
reduce size technique : https://clavinjune.dev/en/blogs/how-to-minimize-go-apps-container-image/