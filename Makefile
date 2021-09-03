
# EMSDK = /usr/local/e/emsdk
EMSDK = ~/git-cloud/emsdk

all: fonts compile unfonts update

local: fonts compile unfonts

local-asm: fonts compile-asm unfonts

fonts:
	(cd ../verovio/fonts; ./.use-vhv-font)

unfonts:
	(cd ../verovio/fonts; ./.checkout-fonts)

compile: compile-wasm

compile-wasm:
	(cd ../verovio/emscripten && rm -f libverovio.bc && rm -rf CMakeFiles CMakeCache.txt Makefile && source $(EMSDK)/emsdk_env.sh && ./buildToolkit -w && cp build/verovio-toolkit-wasm-hum.js ../../verovio-script/scripts/verovio-toolkit-wasm.js && cp build/verovio-toolkit-wasm-hum.js ../../verovio-humdrum-viewer/scripts/local/verovio-toolkit-wasm.js)

compile-asm:
	(cd ../verovio/emscripten && rm -f libverovio.bc && rm -rf CMakeFiles CMakeCache.txt Makefile && source $(EMSDK)/emsdk_env.sh && ./buildToolkit && cp build/verovio-toolkit-hum.js ../../verovio-script/scripts/verovio-toolkit-asm.js && cp build/verovio-toolkit-hum.js ../../verovio-humdrum-viewer/scripts/local/verovio-toolkit-asm.js)

copy:
	(cd ../verovio/emscripten && cp build/verovio-toolkit-wasm-hum.js ../../verovio-script/scripts/verovio-toolkit-wasm.js && cp build/verovio-toolkit-wasm-hum.js ../../verovio-humdrum-viewer/scripts/local/verovio-toolkit-wasm.js)

upload: update
update:
	git commit -am "Update"
	git push
