
# EMSDK = /usr/local/e/emsdk
EMSDK = ~/git-cloud/emsdk

all: pull compile update

pull:
	git pull

local: compile

local-asm: compile-asm

compile: compile-wasm

compile-wasm:
	(cd ../verovio/emscripten && rm -f libverovio.bc && rm -rf CMakeFiles CMakeCache.txt Makefile && source $(EMSDK)/emsdk_env.sh && ./buildToolkit -w && cp build/verovio-toolkit-hum.js ../../verovio-script/scripts/verovio-toolkit-wasm.js && cp build/verovio-toolkit-hum.js ../../verovio-humdrum-viewer/scripts/local/verovio-toolkit-wasm.js)

copy:
	(cd ../verovio/emscripten && cp build/verovio-toolkit-hum.js ../../verovio-script/scripts/verovio-toolkit-wasm.js && cp build/verovio-toolkit-hum.js ../../verovio-humdrum-viewer/scripts/local/verovio-toolkit-wasm.js)

upload: update
update:
	git commit -am "Update"
	git push
