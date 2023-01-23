FROM emscripten/emsdk:latest AS builder

LABEL maintainer="drescher.wolfgang@gmail.com"

WORKDIR /usr/local

# craigsapp/humlib
RUN git clone https://github.com/craigsapp/humlib.git

# rism-digital/verovio
RUN git clone -b develop-humdrum https://github.com/rism-digital/verovio.git
RUN cp /usr/local/humlib/include/humlib.h /usr/local/verovio/include/hum/humlib.h && \
    cp /usr/local/humlib/src/humlib.cpp /usr/local/verovio/src/hum/humlib.cpp
RUN (cd verovio/emscripten && ./buildToolkit -w)



FROM ubuntu:jammy

LABEL maintainer="drescher.wolfgang@gmail.com"

WORKDIR /app

COPY --from=builder /usr/local/verovio/emscripten/build/verovio-toolkit-hum.js ./verovio-toolkit-wasm.js

