cmake_minimum_required(VERSION 2.8)

set(PROJECT_NAME uWS)
set(OS_NAME mac)

aux_source_directory(./src DIR_SRCS)

set(CMAKE_CXX_FLAGS "-std=c++11 ${CMAKE_CXX_FLAGS}")

include_directories(../../libuv/${OS_NAME}/include 
                    /usr/local/opt/openssl/include)

add_library(uWS ${DIR_SRCS})

install(TARGETS ${PROJECT_NAME} DESTINATION $HOME/clients/main/third_party/uWebSockets/mac/lib)


