mode con:cols=100 lines=25
@echo off
title Installing fstab.qcom to system
color 9A
echo.
echo Waiting for the phone to be connected ...
adb kill-server
adb wait-for-device
echo Device connected ...
echo.
adb shell mount -o rw,remount /system
adb push fstab.qcom /system/vendor/etc
adb shell chmod 0644 /system/vendor/etc/fstab.qcom
echo Wipe date/factory reset from stock recovery...
pause