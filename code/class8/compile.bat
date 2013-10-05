@echo off
cl /MD /O2 %1.c /Iinclude lua52.lib
mt -manifest %1.exe.manifest -outputresource:%1.exe;1
del %1.exe.manifest
