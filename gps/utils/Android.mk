#
# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

ifneq ($(BUILD_TINY_ANDROID),true)
#Compile this library only for builds with the latest modem image

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

## Libs
LOCAL_SHARED_LIBRARIES := \
    libutils \
    libcutils \
    liblog

LOCAL_SRC_FILES += \
    loc_log.cpp \
    loc_cfg.cpp \
    msg_q.c \
    linked_list.c \
    loc_target.cpp \
    loc_timer.c \
    ../platform_lib_abstractions/elapsed_millis_since_boot.cpp \
    loc_misc_utils.cpp

LOCAL_CFLAGS += \
     -fno-short-enums \
     -D_ANDROID_

ifeq ($(TARGET_BUILD_VARIANT),user)
   LOCAL_CFLAGS += -DTARGET_BUILD_VARIANT_USER
endif

LOCAL_LDFLAGS += -Wl,--export-dynamic

## Includes
LOCAL_C_INCLUDES:= \
    $(LOCAL_PATH)/../platform_lib_abstractions

LOCAL_COPY_HEADERS_TO:= gps.utils/
LOCAL_COPY_HEADERS:= \
   loc_log.h \
   loc_cfg.h \
   log_util.h \
   linked_list.h \
   msg_q.h \
   loc_target.h \
   loc_timer.h \
   ../platform_lib_abstractions/platform_lib_includes.h \
   ../platform_lib_abstractions/platform_lib_time.h \
   ../platform_lib_abstractions/platform_lib_macros.h \
   loc_misc_utils.h

LOCAL_MODULE := libgps.utils

LOCAL_MODULE_TAGS := optional

LOCAL_PRELINK_MODULE := false

include $(BUILD_SHARED_LIBRARY)
endif # not BUILD_TINY_ANDROID
