@echo off
cd src
cl /c /MD /O2 /I. /D_CRT_SECURE_NO_DEPRECATE /DLUA_BUILD_AS_DLL *.c
move lua.obj ..
move luac.obj ..
link /dll /out:lua52.dll *.obj
mt -manifest lua52.dll.manifest -outputresource:lua52.dll;2
del lua52.dll.manifest
link /out:lua.exe ..\lua.obj lua52.lib
mt -manifest lua.exe.manifest -outputresource:lua.exe;1
del lua.exe.manifest
cd ..
copy src\*.dll .
copy src\*.exe .
