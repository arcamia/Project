LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(call all-java-files-under,src)
LOCAL_REQUIRED_MODULES := com.sentinel.android.services.check
LOCAL_JAVA_LIBRARIES := com.sentinel.android.services.check
LOCAL_JAVA_LIBRARIES += framework

#LOCAL_AAPT_FLAGS := --auto-add-overlay
#LOCAL_AAPT_FLAGS += --extra-packages com.sentinel.android.services.check:android.support.v7.appcompat:android-support-v4

LOCAL_STATIC_JAVA_LIBRARIES := android-common
#LOCAL_STATIC_JAVA_LIBRARIES += com.sentinel.android.services.check
LOCAL_STATIC_JAVA_LIBRARIES += android-support-v7-appcompat
LOCAL_STATIC_JAVA_LIBRARIES += android-support-v4

LOCAL_PACKAGE_NAME := SentinelCheckService
LOCAL_PROGUARD_ENABLED := disabled
LOCAL_CERTIFICATE := platform
#LOCAL_MODULE_TAGS := tests
include $(BUILD_PACKAGE)
