#!/bin/sh

set -e

~/android-ndk/ndk-build
ant debug
adb install -r bin/NeonTest-debug.apk
adb shell am start -a android.ient.action.MAIN -n st.martin.neontest/.NeonTest

