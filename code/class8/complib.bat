@echo off
cl /c /MD /O2 %1.c /Iinclude
link /dll /out:%1.dll %1.obj lua52.lib
mt -manifest %1.dll.manifest -outputresource:%1.dll;2
del %1.dll.manifest
