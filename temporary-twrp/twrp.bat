:: By Mohammad Afaneh (2018), Afaneh92 @ XDA Developers.
mode con:cols=100 lines=25
@echo off
title TWRP Snapdragon S7 and S7 Edge
color 9A
echo.
echo Waiting for the phone to be connected ...
adb kill-server
adb wait-for-device
echo Device connected ...
echo.
adb push ramdisk-recovery.img /tmp
adb push bbx /sbin
adb push hijack /sbin

adb shell chmod 755 /sbin/bbx
adb shell chmod 755 /sbin/hijack

adb shell sh /sbin/hijack
pause