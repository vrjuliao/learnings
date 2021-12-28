FROM gcr.io/cloud-builders/go:latest
COPY ./git-log.go /go
COPY ./go.mod /go

RUN apk add pkgconfig cmake openssl-dev

RUN wget https://github.com/libgit2/libgit2/archive/refs/tags/v1.3.0.zip \
    && unzip v1.3.0.zip \
    && cd libgit2-1.3.0 \
    && mkdir build && cd build \
    && pwd \
    && ls \
    && cmake ../ \
    && cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
    && cmake --build . --target install

RUN cd /go
RUN go build git-log.go

ENTRYPOINT [ "./git-log" ]