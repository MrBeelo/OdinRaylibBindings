BINDGEN ?= "./bindgen"

build: raylib rlgl raygui
	mkdir -p output/rlgl
	cp -a lib/. output/lib/
	cp -a odin/. output/
	cp bind/raylib/out/raylib.odin output/raylib.odin
	cp bind/rlgl/out/rlgl.odin output/rlgl/rlgl.odin
	cp bind/raygui/out/raygui.odin output/raygui.odin

raylib:
	$(BINDGEN) bind/raylib/bindgen.sjson

rlgl:
	$(BINDGEN) bind/rlgl/bindgen.sjson

raygui:
	$(BINDGEN) bind/raygui/bindgen.sjson
	rm bind/raygui/out/raylib.odin

clean:
	rm -rf output
	rm -rf bind/raylib/out
	rm -rf bind/rlgl/out
	rm -rf bind/raygui/out