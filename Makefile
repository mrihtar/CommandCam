# For nmake
CPP = cl /nologo
RM = del /q

DEBUG= /O2
#DEBUG = /Zi /DEBUG
CFLAGS = /Wall /fp:precise
LDFLAGS = 
LIBS = ole32.lib strmiids.lib oleaut32.lib

CommandCam.exe: CommandCam.cpp
	$(CPP) $(DEBUG) $(CFLAGS) CommandCam.cpp /Fe$@ $(LDFLAGS) $(LIBS)

clean:
	-$(RM) CommandCam.exe
