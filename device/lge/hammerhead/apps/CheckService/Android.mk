LOCAL_PATH:= $(call my-dir)

# Include res dir from chips
chips_dir := ../../../../../frameworks/opt/chips/res
#Include res dir from libraries
appcompat_dir := ../../../../../prebuilts/sdk/current/support/v7/appcompat/res
gridlayout_dir := ../../../../../prebuilts/sdk/current/support/v7/gridlayout/res
bitmap_dir := ../../../../../frameworks/opt/bitmap/res
res_dirs := res $(appcompat_dir) $(chips_dir) $(gridlayout_dir) $(bitmap_dir)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(call all-java-files-under,src)
LOCAL_REQUIRED_MODULES := com.sentinel.android.services.check
LOCAL_JAVA_LIBRARIES := com.sentinel.android.services.check
LOCAL_JAVA_LIBRARIES += framework

LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res
LOCAL_RESOURCE_DIR += $(addprefix $(LOCAL_PATH)/, $(res_dirs))

LOCAL_STATIC_JAVA_LIBRARIES := android-common
LOCAL_STATIC_JAVA_LIBRARIES += android-support-v7-appcompat
LOCAL_STATIC_JAVA_LIBRARIES += android-support-v4
LOCAL_STATIC_JAVA_LIBRARIES += libchips
LOCAL_STATIC_JAVA_LIBRARIES += guava
LOCAL_STATIC_JAVA_LIBRARIES += android-support-v7-gridlayout
LOCAL_STATIC_JAVA_LIBRARIES += android-support-v13
LOCAL_STATIC_JAVA_LIBRARIES += android-opt-bitmap

LOCAL_AAPT_FLAGS := --auto-add-overlay
LOCAL_AAPT_FLAGS += --extra-packages android.support.v7.appcompat:com.android.ex.chips:android.support.v7.gridlayout:com.android.bitmap

LOCAL_PACKAGE_NAME := SentinelCheckService
LOCAL_PROGUARD_ENABLED := disabled
LOCAL_CERTIFICATE := platform
include $(BUILD_PACKAGE)
