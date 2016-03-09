LOCAL_PATH := $(call my-dir)

#Build the library
include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := com.sentinel.android.services.check
LOCAL_SRC_FILES := $(call all-subdir-java-files)
LOCAL_SRC_FILES += com/sentinel/android/services/check/ICheckService.aidl
LOCAL_STATIC_JAVA_LIBRARIES := android-common
#LOCAL_JAVA_LIBRARIES := core-sentinel
include $(BUILD_JAVA_LIBRARY)

#Build the documentation
include $(CLEAR_VARS)
LOCAL_SRC_FILES := $(call all-subdir-java-files) $(call all-subdir-html-files)
LOCAL_MODULE := com.sentinel.android.services.check_doc
LOCAL_DROIDDOC_OPTIONS := com.sentinel.android.services.check
LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_DROIDDOC_USE_STANDARD_DOCLET := true
include $(BUILD_DROIDDOC)

#Copy com.sentinel.android.services.check.xml to /system/etc/permissions
#include $(CLEAR_VARS)
#LOCAL_MODULE_TAGS := optional
#LOCAL_MODULE := com.sentinel.android.services.check.xml
#LOCAL_MODULE_CLASS := ETC
#LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/permissions
#LOCAL_SRC_FILES := $(LOCAL_MODULE)
#include $(BUILD_PREBUILT)
