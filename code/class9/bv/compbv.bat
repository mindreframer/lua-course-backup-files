@echo off
cl /c /MD /O2 lbv.c /Iinclude
link /dll /out:bv.dll lbv.obj bv.obj lua52.lib
mt -manifest bv.dll.manifest -outputresource:bv.dll;2
del bv.dll.manifest
