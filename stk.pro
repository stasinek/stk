DEFINES += BUILD_STK_LIBRARY

contains(DEFINES, BUILD_STK_LIBRARY) {
    TARGET = stk
    TEMPLATE = lib
    CONFIG -= app_bundle
    CONFIG += windows shared dll lib_bundle
}
else {
    TARGET  = stk_tester
    TEMPLATE = app
    CONFIG += console
    CONFIG += app_bundle
}
CONFIG -= qt
QT -= core gui
CONFIG += precompile_header
#CONFIG -= static
#CONFIG += warn_on
#CONFIG += warn_off
#CONFIG += exceptions
#CONFIG += c++11
# -------------------------------------------------------------
# External ASM .s compiler
# -------------------------------------------------------------
#QMAKE_CFLAGS_RELEASE += rtti_off stl_off exceptions_off
#QMAKE_CXXFLAGS += -save-temps
#QMAKE_CXXFLAGS += -fverbose-asm
#QMAKE_CXXFLAGS -= -pipe
#moc.depend_command = g++ -E -M ${QMAKE_FILE_NAME} | sed "s,^.*: ,,"
#NASM.output  = ${QMAKE_FILE_BASE}_asm.o
#NASM.commands = c:/nasm/nasm -f elf -g -F dwarf --prefix ${PWD}${QMAKE_FILE_NAME} -o ${PWD}/${QMAKE_FILE_OUT}
#NASM.input = ASM_SOURCES
#YASM.output  = ${QMAKE_FILE_BASE}_asm.o
#YASM.commands = c:/YASM/YASM -f elf -g dwarf2 -w -o ${QMAKE_FILE_OUT} ${PWD}${QMAKE_FILE_NAME}
#YASM.input = ASM_SOURCES
#FASM.output  = ${QMAKE_FILE_BASE}_asm.o
#FASM.commands = c:/fasm/fasm  ${PWD}${QMAKE_FILE_NAME} ${QMAKE_FILE_OUT}
#FASM.input = ASM_SOURCES
#QMAKE_EXTRA_COMPILERS += YASM
#ASM_SOURCES += 	../STK/cpu/stk_cpu_nasm.asm
# -------------------------------------------------------------
# GCC
# -------------------------------------------------------------
contains(QMAKE_COMPILER_DEFINES, __GNUC__) {
QMAKE_CXXFLAGS += -fno-use-linker-plugin
QMAKE_CXXFLAGS += -Wno-write-strings -Wno-multichar
QMAKE_CXXFLAGS += -Wno-unused-variable -Wno-unused-parameter -Wno-unused-value -Wno-unused-label
QMAKE_CXXFLAGS += -Wno-unused-but-set-variable
QMAKE_CXXFLAGS += -Wattributes -Winline -Wshadow -Wall
QMAKE_CXXFLAGS += -Wunknown-pragmas
#QMAKE_CXXFLAGS -= -pipe
#QMAKE_CXXFLAGS += -save-temps
QMAKE_CXXFLAGS += -fverbose-asm
QMAKE_CXXFLAGS += -fstrict-aliasing
QMAKE_CXXFLAGS += -dD
QMAKE_CXXFLAGS += -g
QMAKE_CXXFLAGS += -std=gnu++0x -pthread
QMAKE_CXXFLAGS += -malign-double
QMAKE_CXXFLAGS += -momit-leaf-frame-pointer
QMAKE_CXXFLAGS += -fwrapv
QMAKE_CXXFLAGS += -funroll-loops
QMAKE_CXXFLAGS += -m32 -mfpmath=sse -flto -O3
QMAKE_CXXFLAGS += -mpreferred-stack-boundary=8
QMAKE_CXXFLAGS += -mmmx -msse -msse2

QMAKE_CFLAGS   += -fno-use-linker-plugin
QMAKE_CFLAGS   += -Wno-write-strings -Wno-multichar
QMAKE_CFLAGS   += -Wno-unused-variable -Wno-unused-parameter -Wno-unused-value -Wno-unused-label
QMAKE_CFLAGS   += -Wno-unused-but-set-variable
QMAKE_CFLAGS   += -Wattributes -Winline -Wshadow -Wall
QMAKE_CFLAGS   += -Wunknown-pragmas

}
# -------------------------------------------------------------
# VCC
# -------------------------------------------------------------
contains(QMAKE_COMPILER_DEFINES, _MSC_VER) {
QMAKE_CXXFLAGS += /arch:SSE2
QMAKE_CXXFLAGS += /W1
}
# -------------------------------------------------------------
# LLVM - Clang
# -------------------------------------------------------------
contains (QMAKE_COMPILER_DEFINES,__clang__) {
QMAKE_CXX = clang++
QMAKE_CXXFLAGS += -Wno-write-strings -Wno-multichar
QMAKE_CXXFLAGS += -Wno-unused-variable -Wno-unused-parameter -Wno-unused-value -Wno-unused-label
QMAKE_CXXFLAGS += -Wno-unused-but-set-variable
QMAKE_CXXFLAGS += -Wattributes -Winline -Wshadow -Wall
QMAKE_CXXFLAGS += -Wunknown-pragmas
#QMAKE_CXXFLAGS -= -pipe
#QMAKE_CXXFLAGS += -save-temps
QMAKE_CXXFLAGS += -fverbose-asm
QMAKE_CXXFLAGS += -fstrict-aliasing
QMAKE_CXXFLAGS += -dD
QMAKE_CXXFLAGS += -g
QMAKE_CXXFLAGS += -std=gnu++0x -pthread
QMAKE_CXXFLAGS += -malign-double
QMAKE_CXXFLAGS += -momit-leaf-frame-pointer
QMAKE_CXXFLAGS += -fwrapv
QMAKE_CXXFLAGS += -funroll-loops
QMAKE_CXXFLAGS += -m32 --32 -mfpmath=sse -flto -O3
QMAKE_CXXFLAGS += -mpreferred-stack-boundary=8
QMAKE_CXXFLAGS += -mmmx -msse -msse2
QMAKE_CXXFLAGS += -Qunused-arguments -Wno-error=unused-command-line-argument-hard-error-in-future
QMAKE_CXXFLAGS -= -fno-keep-inline-dllexport
QMAKE_CXXFLAGS -= -finline-small-functions

QMAKE_CC  = clang
QMAKE_CFLAGS   += -Wno-write-strings -Wno-multichar
QMAKE_CFLAGS   += -Wno-unused-variable -Wno-unused-parameter -Wno-unused-value -Wno-unused-label
QMAKE_CFLAGS   += -Wno-unused-but-set-variable
QMAKE_CFLAGS   += -Wattributes -Winline -Wshadow -Wall
QMAKE_CFLAGS   += -Wunknown-pragmas

QMAKE_LFLAGS += -Qunused-arguments -Wno-error=unused-command-line-argument-hard-error-in-future
QMAKE_LFLAGS -= -mthreads
}
# -------------------------------------------------------------
SOURCES += \
    stk_set.cpp \
    stk_test.cpp \
    stk_hash_chain.cpp \
    stk_list.cpp \
    stk_vector.cpp \
    stk_variable.cpp \
    stk_map.cpp \
    cpu/stk_cpu.cpp \
#    cipher/rsa/stk_rsa_single.c \
    cipher/stk_base64.cpp \
    cipher/stk_cipher_mtf.cpp \
    cipher/stk_cipher_API.cpp \
    cipher/stk_cipher_pair.cpp \
    compression/stk_compression_ari.cpp \
    compression/stk_compression_bwt_matrix2.cpp \
    compression/stk_compression_huff.cpp \
    compression/stk_compression_lzstv4.cpp \
    compression/stk_compression_static_huff.cpp \
    compression/stk_compression_API.cpp \
    database/stk_database_items.cpp \
    database/stk_database.cpp \
    file/stk_file_mime_types.cpp \
    file/ini/stk_file_ini.cpp \
    file/eno/stk_file_lzst_header.cpp \
    file/json/stk_json.cpp \
    file/vfs/stk_file_vfs.cpp \
    file/xml/stk_xml.cpp \
    file/zip/miniz.c \
    hash/stk_hash_crc32.cpp \
    hash/stk_hash_md5.cpp \
    hash/stk_hash_password.cpp \
    hash/stk_hash_ssc1.cpp \
    hash/md5/md5.c \
    hash/sha1/hmac_sha1.c \
    hash/sha1/sha1.c \
    io/stk_file_io.cpp \
    io/stk_rs232.cpp \
    io/stk_console.cpp \
    koperek/stk_kop32_class.cpp \
    koperek/stk_kop32_controler.cpp \
    koperek/stk_kop32_search.cpp \
    koperek/stk_kop32_socket_server.cpp \
    koperek/stk_kop32_API.cpp \
    mem/stk_mem.cpp \
    mem/stk_btree.cpp \
    process_journal/stk_journal.cpp \
    pharser/stk_pharse_command_line.cpp \
    pharser/stk_pharse_math.cpp \
    sockets/stk_sockets.cpp \
    stasm/stk_stasm.cpp \
    threads/stk_threads.cpp \
    text/stk_cstr_utils.cpp \
    time/stk_time.cpp \
    text/stk_cstr_class.cpp \
    text/stk_cstr_stack.cpp
# -------------------------------------------------------------
contains(QMAKE_COMPILER_DEFINES, __GNUC__) {
SOURCES+=
    cpu/stk_cpu_gas.s
}
contains(QMAKE_COMPILER_DEFINES, _MSC_VER) {
SOURCES+=
    cpu/stk_cpu_gas.s
}
contains(QMAKE_COMPILER_DEFINES, __clang__) {
SOURCES+=
    cpu/stk_cpu_gas.s
}
# -------------------------------------------------------------
PRECOMPILED_HEADER += stk_MAIN.h
HEADERS += \
    stk_hash_chain.h \
    stk_list.h \
    stk_main.h \
    stk_map.h \
    stk_set.h \
    stk_vector.h \
    3D/stk_3Dvector.h \
    cpu/stk_cpu.h \
    cipher/stk_cipher_API.h \
    cipher/stk_cipher_mtf.h \
    cipher/stk_cipher_pair.h \
    cipher/stk_base64.h \
    cipher/FastAESinC/stk_aes.h \
    compression/stk_compression_static_huff.h \
    compression/stk_compression_ari.h \
    compression/stk_compression_bwt_matrix2.h \
    compression/stk_compression_bwt_matrix3_suffix.h \
    compression/stk_compression_huff.h \
    compression/stk_compression_lzstv4.h \
    compression/stk_compression_API.h \
    database/stk_database.h \
    database/stk_database_owner.h \
    database/stk_database_alias.h \
    database/stk_database_items.h \
    file/stk_file_mime_types.h \
    file/ini/stk_file_ini.h \
    file/eno/stk_file_lzst_header.h \
    file/json/stk_json.h \
    file/vfs/stk_file_vfs.h \
    file/xml/stk_xml.h \
    hash/stk_hash_ssc1.h \
    hash/stk_hash_crc32.h \
    hash/stk_hash_md5.h \
    hash/stk_hash_password.h \
    hash/md5/md5.h \
    hash/sha1/hmac_sha1.h \
    hash/sha1/sha.h \
    incbin/stk_incbin.h \
    io/stk_file_io.h \
    io/stk_rs232.h \
    io/stk_console.h \
    koperek/stk_kop32_class.h \
    koperek/stk_kop32_search.cpp \
    koperek/stk_kop32_controler.h \
    koperek/stk_kop32_list.h \
    koperek/stk_kop32_options.h \
    koperek/stk_kop32_socket_server.h \
    koperek/stk_kop32_API.h \
    mem/stk_mem.h \
    mem/stk_btree.h \
    pharser/stk_pharse_math.h \
    pharser/stk_pharse_command_line.h \
    process_journal/stk_journal.h \
    sockets/stk_sockets.h \
    stasm/stk_stasm.h \
    threads/stk_threads.h \
    time/stk_time.h \
    text/stk_cstr_class.h \
    text/stk_cstr_stack.h \
    text/stk_cstr_utils.h \
    text/stk_cstr.h \
    stk_test.h
# -------------------------------------------------------------
contains(DEFINES, QT_GUI) {
CONFIG +=
SOURCES +=
HEADERS +=
FORMS +=
RESOURCES +=
}
# -------------------------------------------------------------
contains(QMAKE_COMPILER_DEFINES, __GNUC__) {
LIBS += -lkernel32
LIBS += -lgdi32 -lcomctl32 -lshell32 -luser32 -luserenv
LIBS += -lws2_32 -lwsock32
LIBS += -lwinmm -limm32
LIBS += -lole32 -loleaut32
LIBS += -lcrypt32
LIBS += -lgomp
#LIBS += L"../BHAPI/src/libs/freetype/objs/debug" -libfreetype
#LIBS += L"../../../../x86_libraries/BHAPI" -libBHAPI
    contains(DEFINES, QT_GUI) {
    LIBS += QtCored.a
    }
}
# -------------------------------------------------------------
contains(QMAKE_COMPILER_DEFINES, _MSC_VER) {
LIBS += vcompd.lib
LIBS += kernel32.lib shell32.lib gdi32.lib
LIBS += winmm.lib wsock32.lib ws2_32.lib crypt32.lib
LIBS += user32.lib uuid.lib
LIBS += ole32.lib oleaut32.lib
LIBS -= gomp.lib
    contains(DEFINES, QT_GUI) {
    LIBS += QtCored.lib
    }
}
# -------------------------------------------------------------
contains(QMAKE_COMPILER_DEFINES, __clang__) {
LIBS +=
    contains(DEFINES, QT_GUI) {
    LIBS += QtCored.lib
    }
}
# -------------------------------------------------------------
OTHER_FILES +=
DISTFILES += test.txt
# -------------------------------------------------------------
