RAYLIB_SHARED :: #config(RAYLIB_SHARED, false)
RAYLIB_WASM_LIB :: #config(RAYLIB_WASM_LIB, "lib/webassembly/libraylib.web.a")

when ODIN_OS == .Windows {
	@(extra_linker_flags="/NODEFAULTLIB:" + ("msvcrt" when RAYLIB_SHARED else "libcmt"))
	foreign import lib {
		(
			"lib/win64_msvc16/raylibdll.lib" when RAYLIB_SHARED && ODIN_ARCH == .amd64 else 
			"lib/win64_msvc16/raylib.lib" when ODIN_ARCH == .amd64 else 
			"lib/win32_msvc16/raylibdll.lib" when RAYLIB_SHARED && ODIN_ARCH == .i386 else 
			"lib/win32_msvc16/raylib.lib" when ODIN_ARCH == .i386 else 
			"lib/winarm64_msvc16/raylibdll.lib" when RAYLIB_SHARED && ODIN_ARCH == .arm64 else 
			"lib/winarm64_msvc16/raylib.lib" when ODIN_ARCH == .arm64 else
			"system:raylib"
		),
		"system:Winmm.lib",
		"system:Gdi32.lib",
		"system:User32.lib",
		"system:Shell32.lib",
	}
} else when ODIN_OS == .Linux {
	// Note(bumbread): I'm not sure why in `linux/` folder there are
	// multiple copies of raylib.so, but since these bindings are for
	// particular version of the library, I better specify it. Ideally,
	// though, it's best specified in terms of major (.so.4)
	foreign import lib {
		(
			"lib/linux_amd64/libraylib.so.6.0.0" when RAYLIB_SHARED && ODIN_ARCH == .amd64 else 
			"lib/linux_amd64/libraylib.a" when ODIN_ARCH == .amd64 else 
			"lib/linux_i386/libraylib.a" when ODIN_ARCH == .i386 else 
			"lib/linux_arm64/libraylib.so.6.0.0" when RAYLIB_SHARED && ODIN_ARCH == .arm64 else 
			"lib/linux_arm64/libraylib.a" when ODIN_ARCH == .arm64 else
			"system:raylib"
		),
		"system:dl",
		"system:pthread",
		"system:X11",
	}
} else when ODIN_OS == .Darwin {
	foreign import lib {
		"lib/macos/libraylib.6.0.0.dylib" when RAYLIB_SHARED else "lib/macos/libraylib.a",
		"system:Cocoa.framework",
		"system:OpenGL.framework",
		"system:IOKit.framework",
	}
} else when ODIN_ARCH == .wasm32 || ODIN_ARCH == .wasm64p32 {
	foreign import lib {
		RAYLIB_WASM_LIB,
	}
} else {
	foreign import lib "system:raylib"
}