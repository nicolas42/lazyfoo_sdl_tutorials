@echo off
REM Visual Studio Build

IF "%vcvarsall_has_been_run%"=="" (
    SET vcvarsall_has_been_run=1
    call "c:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x86

    REM Old way
    REM Do this once to enter into the MSVC terminal
    REM call "c:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x86
)

REM compile and link executable jibberish
cl -nologo -Gm- -GR- -EHa- -Oi /JMC /permissive- /GS /analyze- /W3 /Zc:wchar_t /ZI /Gm- /Od /sdl /Zc:inline /fp:precise /I "include" 03_event_driven_programming.cpp /link /MANIFEST /NXCOMPAT /DYNAMICBASE "lib\SDL2.lib" "lib\SDL2main.lib" "kernel32.lib" "user32.lib" "gdi32.lib" "winspool.lib" "comdlg32.lib" "advapi32.lib" "shell32.lib" "ole32.lib" "oleaut32.lib" "uuid.lib" "odbc32.lib" "odbccp32.lib" /DEBUG /MACHINE:X86 /INCREMENTAL /SUBSYSTEM:WINDOWS /MANIFESTUAC:"level='asInvoker' uiAccess='false'" /ERRORREPORT:PROMPT /NOLOGO /TLBID:1 

REM delete files that annoy me
del *.manifest *.ilk *.obj *.pdf *.idb *.pdb

echo To speed up first time execution on windows 10 disable network access (disable wifi or LAN).

REM ------------------------------
REM My MSVC Compilation Notes
REM ------------------------------

REM To speed up first time execution on windows 10 disable wifi (or LAN I guess if you're hardwired in).  I'm not sure why but I think windows 10 checks all apps for possible malicious network access or something the first time they're run. 
REM https://stackoverflow.com/questions/24894776/first-execution-after-compiling-incredibly-slow-unless-its-obvious-that-all

REM Minimal Build

REM     cl /I "include" muratori.cpp /link /DYNAMICBASE "SDL2.lib" "SDL2main.lib" "kernel32.lib" "user32.lib" "gdi32.lib" "winspool.lib" "comdlg32.lib" "advapi32.lib" "shell32.lib" "ole32.lib" "oleaut32.lib" "uuid.lib" "odbc32.lib" "odbccp32.lib" /SUBSYSTEM:CONSOLE

REM To replicate the MSVC options I set it up as per lazyfoo sdl tutorial instructions then found the compiler instructions in project settings > c++ > command line and project settings > linker > command line then I copied them all and ved the ones that didn't make sense any more.  I copied the dll files and lib files that I was using to the same directory.

REM change /SUBSYSTEM:CONSOLE to :WINDOWS to prevent console from coming up

REM If using in another location make sure to copy SDL2.dll and any other dlls being used alongside the executable


REM build options from https://stackoverflow.com/questions/28056672/how-do-i-link-a-static-library-using-cl-exe-specifying-runtimelibrary

REM     cl /I "include" -EHsc -FC -Zi -MT -DSFML_STATIC 03_event_driven_programming.cpp /link "SDL2.lib" "SDL2main.lib" "kernel32.lib" "user32.lib" "gdi32.lib" "winspool.lib" "comdlg32.lib" "advapi32.lib" "shell32.lib" "ole32.lib" "oleaut32.lib" "uuid.lib" "odbc32.lib" "odbccp32.lib" /MACHINE:X86 /SUBSYSTEM:WINDOWS


