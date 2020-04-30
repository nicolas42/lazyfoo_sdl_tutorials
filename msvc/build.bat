@echo off
IF "%vcvarsall_has_been_run%"=="" (
    SET vcvarsall_has_been_run=1
    call "c:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x86
)

REM ctime -begin handmade_hero.ctm

REM -d1reportTime
set CommonCompilerFlags=-diagnostics:column -WL -O2 -nologo -fp:fast -fp:except- -Gm- -GR- -EHa- -Zo -Oi -WX -W4 -wd4201 -wd4100 -wd4189 -wd4505 -wd4127 -FC -Z7 -GS- -Gs9999999
set CommonCompilerFlags=-DHANDMADE_INTERNAL=0 -DHANDMADE_SLOW=0 -DHANDMADE_WIN32=1 -I "include" %CommonCompilerFlags%
set CommonLinkerFlags=-STACK:0x100000,0x100000 -incremental:no -opt:ref "lib\SDL2.lib" "lib\SDL2main.lib" "kernel32.lib" "user32.lib" "shell32.lib"  

del *.pdb > NUL 2> NUL
cl %CommonCompilerFlags% -MTd 03_event_driven_programming.cpp /link /SUBSYSTEM:windows %CommonLinkerFlags%

REM Simple preprocessor
REM cl %CommonCompilerFlags% -D_CRT_SECURE_NO_WARNINGS ..\handmade\code\REM simple_preprocessor.cpp /link %CommonLinkerFlags%
REM pushd ..\handmade\code
REM ..\..\build\simple_preprocessor.exe > handmade_generated.h
REM popd

REM PNG parser
REM cl %CommonCompilerFlags% -D_CRT_SECURE_NO_WARNINGS ..\handmade\code\test_png.cpp /link %CommonLinkerFlags%

REM Sampling generator
REM cl %CommonCompilerFlags% -D_CRT_SECURE_NO_WARNINGS ..\handmade\code\hhsphere.cpp /link %CommonLinkerFlags%

REM Lighting profiler
REM cl %CommonCompilerFlags% -D_CRT_SECURE_NO_WARNINGS 03_event_driven_programming.cpp /link %CommonLinkerFlags%

REM Simple compressor
REM cl %CommonCompilerFlags% -D_CRT_SECURE_NO_WARNINGS ..\handmade\code\simple_compressor.cpp /link %CommonLinkerFlags%

REM Asset file builder build
REM cl %CommonCompilerFlags% -D_CRT_SECURE_NO_WARNINGS ..\handmade\code\test_asset_builder.cpp /link %CommonLinkerFlags%

REM Win32 font extractor
REM cl %CommonCompilerFlags% -D_CRT_SECURE_NO_WARNINGS ..\handmade\code\hhfont.cpp /link %CommonLinkerFlags%

REM Asset file editor
REM cl %CommonCompilerFlags% -D_CRT_SECURE_NO_WARNINGS ..\handmade\code\hhaedit.cpp /link %CommonLinkerFlags%


REM 32-bit build
REM cl %CommonCompilerFlags% ..\handmade\code\win32_handmade.cpp /link -subsystem:windows,5.1 %CommonLinkerFlags%

REM 64-bit build
REM Optimization switches /wO2
REM echo WAITING FOR PDB > lock.tmp

REM REM Renderers
REM cl %CommonCompilerFlags% -MTd ..\handmade\code\win32_handmade_opengl.cpp -LD /link -incremental:no -opt:ref -PDB:win32_handmade_opengl_%random%.pdb -EXPORT:Win32LoadRenderer -EXPORT:Win32BeginFrame -EXPORT:Win32EndFrame gdi32.lib opengl32.lib user32.lib

REM REM Game
REM cl %CommonCompilerFlags% -MTd -I..\iaca-win64\ ..\handmade\code\handmade.cpp ..\handmade\code\handmade_msvc.c -Fmhandmade.map -LD /link -incremental:no -opt:ref -PDB:handmade_%random%.pdb -EXPORT:GameGetSoundSamples -EXPORT:GameUpdateAndRender -EXPORT:DEBUGGameFrameEnd
REM set LastError=%ERRORLEVEL%
REM del lock.tmp
REM cl %CommonCompilerFlags% ..\handmade\code\win32_handmade.cpp ..\handmade\code\handmade_msvc.c -Fmwin32_handmade.map /link /NODEFAULTLIB /SUBSYSTEM:windows %CommonLinkerFlags%

REM Renderer testbed
REM cl %CommonCompilerFlags% -MTd 03_event_driven_programming.cpp /link /SUBSYSTEM:windows %CommonLinkerFlags%

popd

REM ctime -end handmade_hero.ctm %LastError%
