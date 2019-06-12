LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    src/InputDevice.cpp \
    src/VNCFlinger.cpp \
    src/main.cpp

LOCAL_SRC_FILES += \
    aidl/org/chemlab/IVNCService.aidl

LOCAL_C_INCLUDES += \
    $(LOCAL_PATH)/src \
    external/libvncserver \
    external/zlib

LOCAL_SHARED_LIBRARIES := \
    libbinder \
    libcrypto \
    libcutils \
    libjpeg \
    libgui \
    libpng \
    libssl \
    libui \
    libutils \
    libz \
    liblog

LOCAL_STATIC_LIBRARIES += \
    libvncserver

LOCAL_CFLAGS := -DVNCFLINGER_VERSION="0.1"
LOCAL_CFLAGS += -Ofast -Werror -std=c++14

#LOCAL_CFLAGS += -DLOG_NDEBUG=0
#LOCAL_CXX := /usr/bin/include-what-you-use

LOCAL_INIT_RC := etc/vncflinger.rc

LOCAL_MODULE := vncflinger

LOCAL_MODULE_TAGS := optional

include $(BUILD_EXECUTABLE)
