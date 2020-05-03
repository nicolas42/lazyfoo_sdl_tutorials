call "c:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x64
cl muratori.cpp /I include /link "SDL2.lib" "SDL2main.lib" 

REM "kernel32.lib" "user32.lib" "gdi32.lib" "winspool.lib" "comdlg32.lib" "advapi32.lib" "shell32.lib" "ole32.lib" "oleaut32.lib" "uuid.lib" "odbc32.lib" "odbccp32.lib"


REM set CommonCompilerFlags=-diagnostics:column -WL -O2 -nologo -fp:fast -fp:except- -Gm- -GR- -EHa- -Zo -Oi -WX -W4 -wd4201 -wd4100 -wd4189 -wd4505 -wd4127 -FC -Z7 -GS- -Gs9999999 /I include1
REM set CommonCompilerFlags=-DHANDMADE_INTERNAL=1 -DHANDMADE_SLOW=1 -DHANDMADE_WIN32=1 %CommonCompilerFlags%
REM set CommonLinkerFlags=-STACK:0x100000,0x100000 -incremental:no -opt:ref user32.lib gdi32.lib winmm.lib kernel32.lib 

REM cl %CommonCompilerFlags% -D_CRT_SECURE_NO_WARNINGS muratori.cpp /link %CommonLinkerFlags%
