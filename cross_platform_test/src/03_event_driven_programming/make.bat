REM g++ 03_event_driven_programming\03_event_driven_programming.cpp -Iinclude -Llib -w -Wl,-subsystem,windows -lmingw32 -lSDL2main -lSDL2

@echo off
IF "%vcvarsall_has_been_run%"=="" (
    SET vcvarsall_has_been_run=1
    call "c:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x86
)

cl -Zi /I "win\include" src\03_event_driven_programming\03_event_driven_programming.cpp /link "win\lib\SDL2.lib" "win\lib\SDL2main.lib" "kernel32.lib" "user32.lib" "shell32.lib" /SUBSYSTEM:WINDOWS
del *.manifest *.ilk *.obj *.pdf *.idb *.pdb
