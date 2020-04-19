REM Visual Studio Build

call "c:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x86

cl /JMC /permissive- /GS /analyze- /W3 /Zc:wchar_t /ZI /Gm- /Od /sdl /Zc:inline /fp:precise /I "include" 03_event_driven_programming.cpp /link /MANIFEST /NXCOMPAT /DYNAMICBASE "SDL2.lib" "SDL2main.lib" "kernel32.lib" "user32.lib" "gdi32.lib" "winspool.lib" "comdlg32.lib" "advapi32.lib" "shell32.lib" "ole32.lib" "oleaut32.lib" "uuid.lib" "odbc32.lib" "odbccp32.lib" /DEBUG /MACHINE:X86 /INCREMENTAL /SUBSYSTEM:CONSOLE /MANIFESTUAC:"level='asInvoker' uiAccess='false'" /ERRORREPORT:PROMPT /NOLOGO /TLBID:1 

del *.manifest *.ilk *.obj *.pdf *.idb *.pdb


REM Minimal Options
REM cl /I "include" muratori.cpp /link /DYNAMICBASE "SDL2.lib" "SDL2main.lib" "kernel32.lib" "user32.lib" "gdi32.lib" "winspool.lib" "comdlg32.lib" "advapi32.lib" "shell32.lib" "ole32.lib" "oleaut32.lib" "uuid.lib" "odbc32.lib" "odbccp32.lib" /SUBSYSTEM:CONSOLE

REM To replicate the MSVC options I set it up as per lazyfoo sdl tutorial instructions then found the compiler instructions in project settings > c++ > command line and project settings > linker > command line then I copied them all and removed the ones that didn't make sense any more.  I copied the dll files and lib files that I was using to the same directory.