
# EMSDK = /usr/local/e/emsdk
EMSDK = /Users/craig/git-cloud/emsdk

all:
	(cd ../verovio/emscripten && rm -f libverovio.bc && rm -rf CMakeFiles CMakeCache.txt Makefile && source $(EMSDK)/emsdk_env.sh && ./buildToolkit -w && cp build/verovio-toolkit-wasm-hum.js ../../verovio-script/scripts/verovio-toolkit-wasm.js && cp build/verovio-toolkit-wasm-hum.js ../../verovio-humdrum-viewer/scripts/local/verovio-toolkit-wasm.js)

copy:
	(cd ../verovio/emscripten && cp build/verovio-toolkit-wasm-hum.js ../../verovio-script/scripts/verovio-toolkit-wasm.js && cp build/verovio-toolkit-wasm-hum.js ../../verovio-humdrum-viewer/scripts/local/verovio-toolkit-wasm.js)
