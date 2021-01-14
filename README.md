SETUP ON MACOS
----------------------------------------------------

INSTALL

Download library from https://www.libsdl.org/

To Install:
Copy the SDL2.framework to /Library/Frameworks

You may alternatively install it in <Your home directory>/Library/Frameworks 
if your access privileges are not high enough. 


COMPILE AND LINK EXAMPLE

g++ -framework SDL2 03_event_driven_programming/03_event_driven_programming.cpp



NOTES
-----------------------------------------------------

The first example on mac doesn't load because it doesn't have an event loop I think.
https://stackoverflow.com/questions/34424816/sdl-window-does-not-show