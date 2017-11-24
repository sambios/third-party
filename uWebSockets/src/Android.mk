LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

SRC_PATH :=./src
LOCAL_MODULE := uwebsocket

LOCAL_SRC_FILES := $(SRC_PATH)/Epoll.cpp $(SRC_PATH)/Epoll.h \
                   $(SRC_PATH)/Extensions.cpp $(SRC_PATH)/Extensions.h \
				   $(SRC_PATH)/Hub.cpp $(SRC_PATH)/Hub.h \
				   $(SRC_PATH)/Networking.cpp $(SRC_PATH)/Networking.h \
                   $(SRC_PATH)/Node.cpp $(SRC_PATH)/Node.h \
				   $(SRC_PATH)/Socket.cpp $(SRC_PATH)/Socket.h \
				   $(SRC_PATH)/WebSocket.cpp $(SRC_PATH)/WebSocket.h \
				   $(SRC_PATH)/HTTPSocket.cpp $(SRC_PATH)/HTTPSocket.h \
                   $(SRC_PATH)/Group.cpp $(SRC_PATH)/Group.h

##
## Local cflags
##

LOCAL_C_INCLUDES += $(THIRD_PARTY_DIR)/openssl/android/include
LOCAL_C_INCLUDES += $(THIRD_PARTY_DIR)/libuv/android/include
LOCAL_CFLAGS += -DUSE_LIBUV -fPIC
LOCAL_CPPFLAGS += -std=c++11 -fexceptions -fpermissive -frtti


include $(BUILD_STATIC_LIBRARY)








