#
# Qmake Qt5.5.1 file last modified 2018.5, Windows MSC2010,MinGW4.92,LLVM3.7 builds tester
#
DEFINES += BUILD_STK_LIBRARY
#DEFINES += BUILD_STK_TESTER
# -------------------------------------------------------------
# CONFIG: LIBRARY: STATIC, DLL OR EXE: TESTING.APP
# -------------------------------------------------------------
contains(DEFINES, BUILD_STK_LIBRARY) {
message($$DEFINES)
    TARGET = stk
    TEMPLATE = lib
#    CONFIG += lib_bundle
#    CONFIG += staticlib
    CONFIG += embed_manifest_dll
    CONFIG += dll
    CONFIG -= warn_on
    CONFIG += warn_off
}
else {
message("BUILD_STK_TESTER")
    TARGET  = stk_tester
    TEMPLATE = app
#    CONFIG += app_bundle
    CONFIG += console
    CONFIG += embed_manifest_exe
    CONFIG -= warn_on
    CONFIG += warn_off
}
# -------------------------------------------------------------
# MESSAGE ABOUT TARGET
# -------------------------------------------------------------
message(QMAKESPEC:$$QMAKESPEC)
message(CONFIG:$$CONFIG)
contains(TEMPLATE, dll) {
contains(CONFIG, dll) {
message($$TARGET".dll")
}
contains(CONFIG, static) {
message("lib"{$$TARGET}".lib")
}
}
# -------------------------------------------------------------
# MORE CONFIG
# -------------------------------------------------------------
QT -= core gui
CONFIG -= qt
CONFIG += precompile_header
#CONFIG -= static
CONFIG += warn_on
CONFIG += exceptions
CONFIG += c++11
contains(QMAKE_COMPILER_DEFINES,_MSC_VER) {
# -------------------------------------------------------------
# VCC
# -------------------------------------------------------------
message("MSVC Microsoft Compiler FLAGS loaded")
QMAKE_CXXFLAGS -= /W1
QMAKE_CXXFLAGS -= /W2
QMAKE_CXXFLAGS -= /W3
QMAKE_CXXFLAGS -= /W4
QMAKE_CXXFLAGS_RELEASE += /w
QMAKE_CXXFLAGS_DEBUG += /W0
QMAKE_CXXFLAGS_RELEASE += /arch:SSE2
} else {
contains(QMAKE_COMPILER_DEFINES,__clang__) {
# -------------------------------------------------------------
# LLVM - Clang
# -------------------------------------------------------------
message("LLVM Clang Compiler FLAGS loaded")

WARNINGS_LLVM += -Wextra
WARNINGS_LLVM += -Wunknown-pragmas -Wundef
WARNINGS_LLVM += -Wold-style-cast
WARNINGS_LLVM += -Wdisabled-optimization -Wstrict-overflow=4
WARNINGS_LLVM += -Weffc++ #-Wuseless-cast
WARNINGS_LLVM += -Winit-self -Wpointer-arith
WARNINGS_LLVM += -Wlogical-op
WARNINGS_LLVM += -Wunsafe-loop-optimizations -Wno-error=unsafe-loop-optimizations
WARNINGS_LLVM += -Wno-write-strings -Wno-multichar

NO_WARNINGS_LLVM += -Wno-write-strings -Wno-multichar
NO_WARNINGS_LLVM += -Wno-unused-variable -Wno-unused-parameter -Wno-unused-value -Wno-unused-label
NO_WARNINGS_LLVM += -Wno-unused-but-set-variable
NO_WARNINGS_LLVM += -Wattributes -Winline
NO_WARNINGS_LLVM += -Wunknown-pragmas
NO_WARNINGS_LLVM += -Wattributes -Winline -Wshadow -Wall
#NO_WARNINGS_LLVM += -fverbose-asm
#NO_WARNINGS_LLVM += -fstrict-aliasing
#NO_WARNINGS_LLVM += -dD
#NO_WARNINGS_LLVM += -g
NO_WARNINGS_LLVM += -std=gnu++0x -pthread
NO_WARNINGS_LLVM += -Qunused-arguments -Wno-error=unused-command-line-argument-hard-error-in-future

FLAGS_LLVM += -fno-use-linker-plugin
FLAGS_LLVM += -malign-double
FLAGS_LLVM += -momit-leaf-frame-pointer
FLAGS_LLVM += -fwrapv
FLAGS_LLVM += -funroll-loops
FLAGS_LLVM += -m32 -mfpmath=sse -flto -O3
FLAGS_LLVM += -mpreferred-stack-boundary=8
FLAGS_LLVM += -mmmx -msse -msse2
FLAGS_LLVM -= -fno-keep-inline-dllexport
FLAGS_LLVM -= -finline-small-functions

#QMAKE_CXXFLAGS -= -pipe
#QMAKE_CXXFLAGS += -save-temps
QMAKE_CXXFLAGS += $$FLAGS_LLVM
QMAKE_CXXFLAGS_RELEASE += $$NO_WARNINGS_LLVM
QMAKE_CXXFLAGS_DEBUG += $$WARNINGS_LLVM
QMAKE_CXXFLAGS += clang++

#QMAKE_CFLAGS -= -pipe
#QMAKE_CFLAGS += -save-temps
QMAKE_CFLAGS   += $$FLAGS_LLVM
QMAKE_CFLAGS_RELEASE += $$NO_WARNINGS_LLVM
QMAKE_CFLAGS_DEBUG += $$WARNINGS_LLVM
QMAKE_CFLAGS += clang

QMAKE_LFLAGS += -Qunused-arguments -Wno-error=unused-command-line-argument-hard-error-in-future
QMAKE_LFLAGS -= -mthreads
} else {
contains(QMAKE_COMPILER_DEFINES,__GNUC__) {
# -------------------------------------------------------------
# GCC
# -------------------------------------------------------------
message("GNUC FLAGS loaded")

WARNINGS_GNU += -Wextra
WARNINGS_GNU += -Wunknown-pragmas -Wundef
WARNINGS_GNU += -Wold-style-cast
WARNINGS_GNU += -Wdisabled-optimization -Wstrict-overflow=4
WARNINGS_GNU += -Weffc++ #-Wuseless-cast
WARNINGS_GNU += -Winit-self -Wpointer-arith
WARNINGS_GNU += -Wlogical-op
WARNINGS_GNU += -Wunsafe-loop-optimizations -Wno-error=unsafe-loop-optimizations
WARNINGS_GNU += -Wno-write-strings -Wno-multichar

NO_WARNINGS_GNU += -Wno-write-strings -Wno-multichar
NO_WARNINGS_GNU += -Wno-unused-variable -Wno-unused-parameter -Wno-unused-value -Wno-unused-label
NO_WARNINGS_GNU += -Wno-unused-but-set-variable
NO_WARNINGS_GNU += -Wattributes -Winline
NO_WARNINGS_GNU += -Wunknown-pragmas
NO_WARNINGS_GNU += -Wattributes -Winline -Wshadow -Wall
#NO_WARNINGS_GNU += -fverbose-asm
#NO_WARNINGS_GNU += -fstrict-aliasing
#NO_WARNINGS_GNU += -dD
#NO_WARNINGS_GNU += -g
NO_WARNINGS_GNU += -pthread

FLAGS_GNU += -fno-use-linker-plugin
FLAGS_GNU += -malign-double
FLAGS_GNU += -momit-leaf-frame-pointer
FLAGS_GNU += -fwrapv
FLAGS_GNU += -funroll-loops
FLAGS_GNU += -m32 -mfpmath=sse -flto -O3
FLAGS_GNU += -mpreferred-stack-boundary=8
FLAGS_GNU += -mmmx -msse -msse2

QMAKE_CXXFLAGS_DEBUG += $$FLAGS_GNU $$WARNINGS_GNU -std=gnu++0x
QMAKE_CXXFLAGS_RELEASE += $$FLAGS_GNU $$NO_WARNINGS_GNU -std=gnu++0x
#QMAKE_CXXFLAGS -= -pipe
#QMAKE_CXXFLAGS += -save-temps

QMAKE_CFLAGS_DEBUG += $$FLAGS_GNU $$WARNINGS_GNU
QMAKE_CFLAGS_RELEASE += $$FLAGS_GNU $$NO_WARNINGS_GNU
#QMAKE_FLAGS -= -pipe
#QMAKE_FLAGS += -save-temps
}
}}
# -------------------------------------------------------------
SOURCES += \
    stk_set.cpp \
    stk_test.cpp \
    stk_hash_chain.cpp \
    stk_list.cpp \
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
    text/stk_cstr_stack.cpp \
    koperek/stk_kop32_options.cpp \
    koperek/stk_kop32_list.cpp \
    file/zip/miniz.c
# -------------------------------------------------------------
contains(QMAKE_COMPILER_DEFINES,__GNUC__) {
message("GNUC GAS sources  loaded")
SOURCES+=
    cpu/stk_cpu_gas.s
} else {
contains(QMAKE_COMPILER_DEFINES,__clang__) {
message("LLVM GAS sources loaded")
SOURCES+=
    cpu/stk_cpu_gas.s
} else {
contains(QMAKE_COMPILER_DEFINES,_MSC_VER) {
message("AMSVC ASM sources loaded")
SOURCES+=
    cpu/stk_cpu_gas.s
}
}}
# -------------------------------------------------------------
#PRECOMPILED_HEADER += $$PWD/stk_MAIN.h
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
    koperek/stk_kop32_search.h \
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
    stk_test.h \
    file/zip/miniz.h
# -------------------------------------------------------------
contains(DEFINES, QT_GUI) {
message("Qt GUI sources loaded")
CONFIG +=
SOURCES +=
HEADERS +=
FORMS +=
RESOURCES +=
}
# -------------------------------------------------------------
contains(DEFINES, _MSC_VER) {
message("MSVC libs loaded")
#    LIBS += vcomp.lib
    LIBS += crypt32.lib
    LIBS += kernel32.lib shell32.lib gdi32.lib
    LIBS += user32.lib uuid.lib
    LIBS += wsock32.lib ws2_32.lib
    LIBS += winmm.lib
    LIBS += ole32.lib oleaut32.lib
    LIBS -= gomp.lib
    contains(DEFINES, QT_GUI) {
        LIBS += QtCored.lib
    }
} else {
contains(QMAKE_COMPILER_DEFINES,__clang__) {
message("LLVM libs loaded")
    LIBS +=
    contains(DEFINES, QT_GUI) {
        LIBS += QtCored.lib
    }
} else {
contains(QMAKE_COMPILER_DEFINES,__GNUC__) {
message("GNUC libs loaded")
    LIBS += -lkernel32
    LIBS += -lgdi32 -lcomctl32 -lshell32 -luser32 -luserenv
    LIBS += -lws2_32 -lwsock32
    LIBS += -lwinmm -limm32
    LIBS += -lole32 -loleaut32
    LIBS += -ladvapi32
    LIBS += -lcrypt32 -uiid
    LIBS += -lgomp
    #LIBS += L"../BHAPI/src/libs/freetype/objs/debug" -libfreetype
    #LIBS += L"../../../../x86_libraries/BHAPI" -libBHAPI
    contains(DEFINES, QT_GUI) {
        LIBS += QtCored.a
    }
}
}}
# -------------------------------------------------------------
win32: {
message("Windows Resource files loaded")
    RC_FILE     =  stk_version.rc
#-manifest file.manifest
}
OTHER_FILES +=
DISTFILES += test.txt
# -------------------------------------------------------------
message("END")
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


#postlink.target = .buildfile
#postlink.commands = dlltool -z --output-def,exported.def -l $$postlink.target
#QMAKE_EXTRA_TARGETS += postlink
#QMAKE_POST_LINK += postlink
