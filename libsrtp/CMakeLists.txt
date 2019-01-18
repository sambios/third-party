cmake_minimum_required(VERSION 3.2)

project(libsrtp)

add_definitions(-DHAVE_CONFIG_H -DOPENSSL
    -DHAVE_STDLIB_H
    -DHAVE_STRING_H
    -DHAVE_STDINT_H
    -DHAVE_INTTYPES_H
    -DHAVE_INT16_T
    -DHAVE_INT32_T
    -DHAVE_INT8_T
    -DHAVE_UINT16_T
    -DHAVE_UINT32_T
    -DHAVE_UINT64_T
    -DHAVE_UINT8_T
    )

if (UNIX)
    add_definitions(-DHAVE_ARPA_INET_H
       -DHAVE_NETINET_IN_H
       -DHAVE_SYS_TYPES_H
       -DHAVE_UNISTD_H
       )
elseif (WIN32)
    add_definitions(-DHAVE_WINSOCK2_H)
endif()

include_directories(config
    include
    crypto/include
    $ENV{THIRD_PARTY_ROOT}/openssl/$ENV{MARCH_NAME}/include
    )

set(srtp_src_list crypto/cipher/aes_gcm_ossl.c
    crypto/cipher/aes_icm_ossl.c
    crypto/cipher/cipher.c
    crypto/cipher/null_cipher.c
    crypto/hash/auth.c
    crypto/hash/hmac_ossl.c
    crypto/hash/null_auth.c
    crypto/kernel/alloc.c
    crypto/kernel/crypto_kernel.c
    crypto/kernel/err.c
    crypto/kernel/key.c
    crypto/math/datatypes.c
    crypto/math/stat.c
    crypto/replay/rdb.c
    crypto/replay/rdbx.c
    srtp/ekt.c
    srtp/srtp.c
    )

add_library(srtp ${srtp_src_list})

set(srtp_test_src_list test/util.c
    test/getopt_s.c
    crypto/replay/ut_sim.c
    )

link_directories($ENV{THIRD_PARTY_ROOT}/openssl/$ENV{MARCH_NAME}/lib)

add_executable(test_dtls_srtp_driver ${srtp_test_src_list} test/dtls_srtp_driver.c)
target_link_libraries(test_dtls_srtp_driver srtp ssl crypto)

add_executable(test_rdbx_driver ${srtp_test_src_list} test/rdbx_driver.c)
target_link_libraries(test_rdbx_driver srtp ssl crypto)

add_executable(replay_driver ${srtp_test_src_list} test/replay_driver.c)
target_link_libraries(replay_driver srtp ssl crypto)

add_executable(roc_driver ${srtp_test_src_list} test/roc_driver.c)
target_link_libraries(roc_driver srtp ssl crypto)

add_executable(srtp_driver ${srtp_test_src_list} test/srtp_driver.c)
target_link_libraries(srtp_driver srtp ssl crypto)

add_executable(cipher_driver ${srtp_test_src_list} crypto/test/cipher_driver.c)
target_link_libraries(cipher_driver srtp ssl crypto)

add_executable(datatypes_driver ${srtp_test_src_list} crypto/test/datatypes_driver.c)
target_link_libraries(datatypes_driver srtp ssl crypto)

add_executable(kernel_driver ${srtp_test_src_list} crypto/test/kernel_driver.c)
target_link_libraries(kernel_driver srtp ssl crypto)

