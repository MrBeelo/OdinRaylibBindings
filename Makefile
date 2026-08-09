BINDGEN ?= "./bindgen.bin"

build: raylib rlgl raygui
	mkdir -p output/rlgl

	# Copy libraries and handmade odin code to output folder
	cp -a lib/raylib/. output/lib/
	cp -a lib/raygui/. output/lib/
	cp -a odin/. output/

	# Copy generated bindings to output folder
	cp bind/raylib/out/raylib.odin output/raylib.odin
	cp bind/rlgl/out/rlgl.odin output/rlgl/rlgl.odin
	cp bind/raygui/out/raygui.odin output/raygui.odin

	# Remove mingw binaries as they are not used
	rm -rf output/lib/win32_mingw-w64
	rm -rf output/lib/win64_mingw-w64

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