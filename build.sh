emmake make clean
emmake make
export BINNAME=repaq
mv $BINNAME $BINNAME.bc
BIOLIB_REQ_FLAGS="\
    -s WASM=1 \
    -s WASM_MEM_MAX=512MB \
    -s TOTAL_MEMORY=512MB \
    -s -g2 \
    -s EMIT_EMSCRIPTEN_METADATA=1 \
    -s LEGALIZE_JS_FFI=1 \
    -s FORCE_FILESYSTEM=1 \
    -lidbfs.js \
    -lnodefs.js \
    -s EXIT_RUNTIME=1 \
	-s ALLOW_MEMORY_GROWTH=1"
APP_ADDITIONAL_FLAGS="-s ERROR_ON_UNDEFINED_SYMBOLS=0"
emcc \
    $BIOLIB_REQ_FLAGS \
    $APP_ADDITIONAL_FLAGS \
    -o $BINNAME.mjs $BINNAME.bc

