Running through these tutorials on macos 
https://lazyfoo.net/tutorials/SDL/index.php


INSTALL
-----------------------------------------------------

Download library from https://www.libsdl.org/

To Install:
Copy the SDL2.framework to /Library/Frameworks

You may alternatively install it in <Your home directory>/Library/Frameworks 
if your access privileges are not high enough. 


NOTES
-----------------------------------------------------

The names of header files need to be changed on macos, e.g.

#include <SDL2/SDL.h>
#include <SDL2_image/SDL_image.h>


To compile and link the proper frameworks (libraries) do something like this

g++ -framework SDL2 -framework SDL2_image main.cpp


The first and second examples don't load because they don't have event loops.  The event polling example event code is used instead. https://stackoverflow.com/questions/34424816/sdl-window-does-not-show

other SDL frameworks can be downloaded from here
https://www.libsdl.org/projects/


ttf rendering in SDL sucks