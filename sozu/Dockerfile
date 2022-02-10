FROM alpine:latest as builder

COPY . /source/

RUN apk update && apk add --no-cache --virtual .build-dependencies \
  cargo \
  build-base \
  file \
  libgcc \
  musl-dev \
  rust
RUN apk add --no-cache openssl-dev \
  llvm-libunwind \
  pkgconfig

RUN cargo install --git https://github.com/jimbertools/sozu.git sozu --features use-openssl

FROM alpine:latest as bin


RUN apk update && apk add --no-cache openssl-dev \
  llvm-libunwind \
  libgcc


COPY --from=builder /root/.cargo/bin/sozu sozu
#
ENV SOZU_CONFIG /etc/sozu/config.toml
#
VOLUME /etc/sozu
#
RUN mkdir -p /run/sozu
VOLUME /run/sozu
#
EXPOSE 80
EXPOSE 443
#
ENTRYPOINT ["/sozu"]
#
CMD ["start", "-c", "/etc/sozu/config.toml"]



















