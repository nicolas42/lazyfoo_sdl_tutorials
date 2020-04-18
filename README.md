http://lazyfoo.net/tutorials/SDL/index.php

Notes - Making Things in Macos, the joys therein (version 2)

New plan.  Just include the headers and the dynamic link libraries for the necessary SDL libraries
in the source. Woo. It seems like the only file which is necessary is the dylib and I haven't been able to link statically against the supplied .a files.  If you run otool -L libSDL2.dylib there's a long list of system frameworks that it depends on so I guess it needs to be dynamically linked.  The system frameworks should be there anyway on a mac so there wouldn't be any installation requirements.

Compile and run a file from this directory like this.

    clang++ 04_key_presses/04_key_presses.cpp -Iinclude lib/libSDL2.dylib ; ./a.out


The libraries get installed to a lot of places it seems. /usr/local/lib and usr/local/include seem to be pretty good places to get them.  They're also hidden away in /Libraries/Frameworks if you get in there and seem to be symlinked? in /usr/local/opt

-----------------------------------

Notes - Making Things in Macos, the joys therein

Got the SDL2 and SDL2_image frameworks and put them into /Libraries/Frameworks then restarted terminal.  I also did a lot of other things before I did this so they might have done something too unfortunately.

Changed the imports from #include <SDL.h> to #include <SDL2/SDL.h>

Make and run examples

    clang++ -framework SDL2 03_event_driven_programming/03_event_driven_programming.cpp ; ./a.out

    clang++ -framework SDL2 04_key_presses/04_key_presses.cpp ; ./a.out

    clang++ -framework SDL2 05_optimized_surface_loading_and_soft_stretching/05_optimized_surface_loading_and_soft_stretching.cpp ; ./a.out



for some reason outputting a file like 04_key_presses causes a linker error ???

brew also installs things but I don't think it installs the frameworks.  It'll put the library files into /usr/local/lib if I'm not mistaken.  

when importing libraries include the library directory with -L<dir> and include the library files themselves with -l<library_name>
you don't include the lib prefix or the .a or .dylib suffix

so for example 
libm.a is included with -lm
libSDL2.a is included with -lSDL2

I'm not sure but I think this also takes care of the dylib files as well.
so libSDL2.dylib I think will also work this way, possibly one reason why this convention exists.

