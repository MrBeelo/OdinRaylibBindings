A small setup that builds raylib bindings for odin with the headers and binaries provided.  

To Use
------

1. Place header files in the input/ folder.
2. Place raylib binaries in the lib/raylib folder.
3. Place raygui binaries in the lib/raygui folder.
4. Install bindgen (odin-c-bindgen) and place it in this folder.
5. Configure all bindgen.sjson files in bind/<something>/ as necessary.
6. Run the Makefile! (output should be in the output/ folder)

TODO
----

- Change some types ("i32" -> "c.int")