PRODUCTS := libmecab.js libmecab.data libmecab.wasm

.PHONY: all
all: $(PRODUCTS)

mecab/src/.libs/libmecab.so:
	cd mecab && emconfigure ./configure && emmake make -j9

mecab-ipadict/dist/sys.dic:
	cd mecab-ipadict && ./configure --with-dicdir=$$PWD/dist && make && /usr/lib/mecab/mecab-dict-index -f euc-jp -t utf-8 && make install

$(PRODUCTS): mecab/src/.libs/libmecab.so mecab-ipadict/dist/sys.dic build_js.sh
	@bash -x ./build_js.sh

dist: mecab-wasm.zip

mecab-wasm.zip: $(PRODUCTS)
	zip $@ $(PRODUCTS)
