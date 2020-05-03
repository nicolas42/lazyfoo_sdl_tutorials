@echo off
IF "%vcvarsall_has_been_run%"=="" (
    SET vcvarsall_has_been_run=1
    call "c:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x86
)

cl -Zi /I "include" 05_optimized_surface_loading_and_soft_stretching\05_optimized_surface_loading_and_soft_stretching.cpp /link "lib\SDL2.lib" "lib\SDL2main.lib" "kernel32.lib" "user32.lib" "shell32.lib" /SUBSYSTEM:WINDOWS
del *.manifest *.ilk *.obj *.pdf *.idb *.pdb

