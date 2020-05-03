REM cd downloads\lazyfoo_sdl_tutorials\windows 
call "c:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x86

cl /I "include" muratori.cpp /link /DYNAMICBASE "SDL2.lib" "SDL2main.lib" "kernel32.lib" "user32.lib" "gdi32.lib" "winspool.lib" "comdlg32.lib" "advapi32.lib" "shell32.lib" "ole32.lib" "oleaut32.lib" "uuid.lib" "odbc32.lib" "odbccp32.lib" /SUBSYSTEM:CONSOLE