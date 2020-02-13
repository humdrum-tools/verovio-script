
EMSDK = /usr/local/e/emsdk

all:
	(cd ../verovio/emscripten && source $(EMSDK)/emsdk_env.sh && ./buildToolkit --cpp 11 -x "Bravura,Gootville,Petaluma" && cp build/verovio-toolkit-hum.js ../../verovio-script/scripts/verovio-toolkit.js && cp build/verovio-toolkit-hum.js ../../verovio-humdrum-viewer/scripts/local/verovio-toolkit.js)
