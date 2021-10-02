#!/bin/bash

emcc mecab/src/.libs/libmecab.so -o lib/libmecab.js -g \
    -s MODULARIZE -s EXPORT_ES6=1 -s ENVIRONMENT="web,webview,worker" \
    -s ASSERTIONS=1 -s SAFE_HEAP=1 -s STACK_OVERFLOW_CHECK=1 -s INITIAL_MEMORY=199950336 \
    -s EXPORTED_FUNCTIONS='["_mecab_new2", "_mecab_sparse_tostr3"]' \
    -s EXPORTED_RUNTIME_METHODS='["ccall","cwrap","UTF8ToString","lengthBytesUTF8"]' \
    --preload-file mecab/mecabrc@/usr/local/etc/mecabrc \
    --preload-file mecab-ipadict/dist@/usr/local/lib/mecab/dic/ipadic
