#!/bin/bash
# By Mohammad Afaneh (2018), Afaneh92 @ XDA Developers.

adb push ramdisk-recovery.img /tmp
adb push bbx /sbin
adb push hijack /sbin

adb shell chmod 755 /sbin/bbx > /dev/null 2>&1
adb shell chmod 755 /sbin/hijack > /dev/null 2>&1

adb shell sh /sbin/hijack > /dev/null 2>&1
