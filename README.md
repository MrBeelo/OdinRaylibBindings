A small setup that builds raylib bindings for odin with the headers and binaries provided.  

To Use
------

1. Place header files in the input/ folder.
2. Place raylib and raygui binaries in the lib/raylib and lib/raygui folders.
3. Compile bindgen (odin-c-bindgen), preferably with the patch at bind/bindgen, and place it in this folder.
4. Configure all bindgen.sjson files in bind/<something>/ as necessary.
5. Change BINDGEN in the Makefile to ./bindgen.exe if on windows.
6. Run the Makefile! (output should be in the output/ folder)