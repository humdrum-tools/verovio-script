
EMSDK = /usr/local/e/emsdk

all:
	(cd ../verovio/emscripten && source $(EMSDK)/emsdk_env.sh && \
	./buildToolkit && \
	cp build/verovio-toolkit-hum.js ../../verovio-script/scripts/verovio-toolkit.js )


