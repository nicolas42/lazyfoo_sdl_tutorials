## This makefile contains all the options GCC passes to the linker
## when you compile like this: gcc test.cpp -o test.exe
CC=gcc

## NOTE: You can only use OPTIMAL_FLAGS with the -Bdynamic option. You'll get a
## screenfull of errors if you try something like this: make smallest type=static
OPTIMAL_FLAGS=-lmingw32 -lmsvcrt -lkernel32

DEFAULT_FLAGS=$(OPTIMAL_FLAGS) \
-lmingw32 \
-lgcc \
-lmoldname \
-lmingwex \
-lmsvcrt \
-ladvapi32 \
-lshell32 \
-luser32 \
-lkernel32 \
-lmingw32 \
-lgcc  \
-lmoldname \
-lmingwex \
-lmsvcrt


LIBRARY_PATH=\
-LC:\MinGW32\lib\gcc\mingw32\4.7.1 \
-LC:\mingw32\lib\gcc \
-LC:\mingw32\lib\mingw32\lib \
-LC:\mingw32\lib\

OBJECT_FILES=\
C:\MinGW32\lib\crt2.o \
C:\MinGW32\lib\gcc\mingw32\4.7.1\crtbegin.o

COLLECT2=C:\MinGW32\libexec\gcc\mingw32\4.7.1\collect2.exe

normal:
    $(CC) -c test.cpp
    $(COLLECT2) -Bdynamic $(OBJECT_FILES)  test.o -B$(type) -lstdc++ -Bdynamic  $(DEFAULT_FLAGS) $(LIBRARY_PATH) -o test.exe

optimized:
    $(CC) -c -O test.cpp
    $(COLLECT2) -Bdynamic $(OBJECT_FILES)  test.o -B$(type) -lstdc++ -Bdynamic  $(DEFAULT_FLAGS) $(LIBRARY_PATH) -o test.exe

smallest:
    $(CC) -c -O test.cpp
    $(COLLECT2) -Bdynamic $(OBJECT_FILES)  test.o -B$(type) -lstdc++ -Bdynamic  $(OPTIMAL_FLAGS) $(LIBRARY_PATH) -o test.exe

ultimate:
    $(CC) -c -O test.cpp
    $(COLLECT2) -Bdynamic $(OBJECT_FILES)  test.o -B$(type) -lstdc++ -Bdynamic  $(OPTIMAL_FLAGS) $(LIBRARY_PATH) -o test.exe
    strip test.exe
    upx test.exe

CLEAN:
    del *.exe *.o