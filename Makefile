BINDGEN ?= "./bindgen"

build: raylib rlgl raygui
	mkdir -p out/rlgl
	cp -a lib/. out/lib/
	cp -a odin/. out/
	cp bind/raylib/output/raylib.odin out/raylib.odin
	cp bind/rlgl/output/rlgl.odin out/rlgl/rlgl.odin
	cp bind/raygui/output/raygui.odin out/raygui.odin

raylib:
	$(BINDGEN) bind/raylib/bindgen.sjson

rlgl:
	$(BINDGEN) bind/rlgl/bindgen.sjson

raygui:
	$(BINDGEN) bind/raygui/bindgen.sjson
	rm bind/raygui/output/raylib.odin

clean:
	rm -rf out
	rm -rf bind/raylib/output
	rm -rf bind/rlgl/output