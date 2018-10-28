#!/bin/bash
# By Mohammad Afaneh (2018), Afaneh92 @ XDA Developers.

adb shell mount -o rw,remount /system > /dev/null 2>&1
adb push fstab.qcom /system/vendor/etc
adb shell chmod 0644 /system/vendor/etc/fstab.qcom > /dev/null 2>&1
echo Wipe date/factory reset from stock recovery...
