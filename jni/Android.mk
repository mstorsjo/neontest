
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := neontest-exe
LOCAL_SRC_FILES := main.c asm.S
LOCAL_LDLIBS    := -static

include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_CFLAGS    := -DANDROID_LOG
LOCAL_MODULE    := neontest
LOCAL_SRC_FILES := jni_main.c main.c asm.S
LOCAL_LDLIBS    := -llog

include $(BUILD_SHARED_LIBRARY)

