LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := jsoncpp

LOCAL_SRC_FILES := src/lib_json/json_reader.cpp \
                   src/lib_json/json_value.cpp \
		   src/lib_json/json_writer.cpp

LOCAL_C_INCLUDES += $(LOCAL_PATH)/include \
                    src/lib_json

LOCAL_CPP_CFLAGS += -std=c++11


include $(BUILD_STATIC_LIBRARY)



