@echo off
cl pong.c /MD /D_CRT_SECURE_NO_DEPRECATE /Iinclude /I. /I..\include *.lib ..\lua52.lib
mt -manifest pong.exe.manifest -outputresource:pong.exe;1
del pong.exe.manifest
