#
# Qmake Qt5.5.1 file last modified 2018.5, Windows MSC2010,MinGW4.92,LLVM3.7 builds tester
#
DEFINES += BUILD_STK_LIBRARY
# -------------------------------------------------------------
# CONFIG: LIBRARY: STATIC, DLL OR EXE: TESTING.APP
# -------------------------------------------------------------
contains(DEFINES, BUILD_STK_LIBRARY) {
message("Building STK LIBRARY")
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
message("Building STK TESTER PROGRAM")
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
# -------------------------------------------------------------
# GCC
# -------------------------------------------------------------
WARNINGS += -Wextra
WARNINGS += -Wunknown-pragmas -Wundef
WARNINGS += -Wold-style-cast
WARNINGS += -Wdisabled-optimization -Wstrict-overflow=4
WARNINGS += -Weffc++ -Wuseless-cast
WARNINGS += -Winit-self -Wpointer-arith
WARNINGS += -Wlogical-op
WARNINGS += -Wunsafe-loop-optimizations -Wno-error=unsafe-loop-optimizations

message(QMAKESPEC:$$QMAKESPEC)
message(CONFIG:$$CONFIG)
message(DEFINES:$$DEFINES)

win32-g++: {
message("GNU Compiler flags loaded")
#QMAKE_CXXFLAGS -= -pipe
#QMAKE_CXXFLAGS += -save-temps
QMAKE_CXXFLAGS += -Wno-write-strings -Wno-multichar
QMAKE_CXXFLAGS += -Wno-unused-variable -Wno-unused-parameter -Wno-unused-value -Wno-unused-label
QMAKE_CXXFLAGS += -Wno-unused-but-set-variable
QMAKE_CXXFLAGS += -Wattributes -Winline
QMAKE_CXXFLAGS += -Wunknown-pragmas
QMAKE_CXXFLAGS += -Wattributes -Winline -Wshadow -Wall
QMAKE_CXXFLAGS += -fverbose-asm
QMAKE_CXXFLAGS += -fstrict-aliasing
QMAKE_CXXFLAGS += -dD
QMAKE_CXXFLAGS += -g
QMAKE_CXXFLAGS += -std=gnu++0x -pthread

QMAKE_CXXFLAGS_RELEASE += -fno-use-linker-plugin
QMAKE_CXXFLAGS_RELEASE += -malign-double
QMAKE_CXXFLAGS_RELEASE += -momit-leaf-frame-pointer
QMAKE_CXXFLAGS_RELEASE += -fwrapv
QMAKE_CXXFLAGS_RELEASE += -funroll-loops
QMAKE_CXXFLAGS_RELEASE += -m32 -mfpmath=sse -flto -O3
QMAKE_CXXFLAGS_RELEASE += -mpreferred-stack-boundary=8
QMAKE_CXXFLAGS_RELEASE += -mmmx -msse -msse2

#QMAKE_FLAGS -= -pipe
#QMAKE_FLAGS += -save-temps
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
win32-msvc2010: {
message("MSVC Microsoft Compiler flags loaded")
QMAKE_CXXFLAGS_RELEASE += /arch:SSE2
QMAKE_CXXFLAGS_RELEASE += /w
QMAKE_CXXFLAGS += /W0
QMAKE_CXXFLAGS -= /W3
}
# -------------------------------------------------------------
# LLVM - Clang
# -------------------------------------------------------------
win32-g++: {
message("LLVM Clang Compiler flags loaded")
QMAKE_CXX = clang++
#QMAKE_CXXFLAGS -= -pipe
#QMAKE_CXXFLAGS += -save-temps
QMAKE_CXXFLAGS += -Wno-write-strings -Wno-multichar
QMAKE_CXXFLAGS += -Wno-unused-variable -Wno-unused-parameter -Wno-unused-value -Wno-unused-label
QMAKE_CXXFLAGS += -Wno-unused-but-set-variable
QMAKE_CXXFLAGS += -Wattributes -Winline -Wshadow -Wall
QMAKE_CXXFLAGS += -Wunknown-pragmas
QMAKE_CXXFLAGS += -fverbose-asm
QMAKE_CXXFLAGS += -fstrict-aliasing
QMAKE_CXXFLAGS += -dD
QMAKE_CXXFLAGS += -g
QMAKE_CXXFLAGS += -std=gnu++0x -pthread
QMAKE_CXXFLAGS += -Qunused-arguments -Wno-error=unused-command-line-argument-hard-error-in-future

QMAKE_CXXFLAGS_RELEASE += -malign-double
QMAKE_CXXFLAGS_RELEASE += -momit-leaf-frame-pointer
QMAKE_CXXFLAGS_RELEASE += -fwrapv
QMAKE_CXXFLAGS_RELEASE += -funroll-loops
QMAKE_CXXFLAGS_RELEASE += -m32 --32 -mfpmath=sse -flto -O3
QMAKE_CXXFLAGS_RELEASE += -mpreferred-stack-boundary=8
QMAKE_CXXFLAGS_RELEASE += -mmmx -msse -msse2
QMAKE_CXXFLAGS_RELEASE -= -fno-keep-inline-dllexport
QMAKE_CXXFLAGS_RELEASE -= -finline-small-functions

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
win32-g++: {
message("ASM sources GNUC C compiler flags loaded")
SOURCES+=
    cpu/stk_cpu_gas.s
}
win32-msvc2010: {
message("ASM sources MSVC C compiler flags loaded")
SOURCES+=
    cpu/stk_cpu_gas.s
}
win32-g++: {
message("ASM sources LLVM C compiler flags loaded")
SOURCES+=
    cpu/stk_cpu_gas.s
}
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
message("Qt GUI files loaded")
CONFIG +=
SOURCES +=
HEADERS +=
FORMS +=
RESOURCES +=
}
# -------------------------------------------------------------
win32-g++: {
message("Linker GNUC libs loaded")
    LIBS += -lkernel32
    LIBS += -lgdi32 -lcomctl32 -lshell32 -luser32 -luserenv
    LIBS += -lws2_32 -lwsock32
    LIBS += -lwinmm -limm32
    LIBS += -lole32 -loleaut32
    LIBS += -uiid -advapi32
    LIBS += -lcrypt32
    LIBS += -lgomp

    #LIBS += L"../BHAPI/src/libs/freetype/objs/debug" -libfreetype
    #LIBS += L"../../../../x86_libraries/BHAPI" -libBHAPI
    contains(DEFINES, QT_GUI) {
        LIBS += QtCored.a
    }
}
# -------------------------------------------------------------
win32-msvc2010: {
message("Linker MSVC libs loaded")
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
}
# -------------------------------------------------------------
win32-g++: {
message("Linker LLVM libs loaded")
    LIBS +=
    contains(DEFINES, QT_GUI) {
        LIBS += QtCored.lib
    }
}
# -------------------------------------------------------------
win32: {
message("Windows Resource files loaded")
    RC_FILE     =  stk_version.rc
#-manifest file.manifest
}
OTHER_FILES +=
DISTFILES += test.txt
# -------------------------------------------------------------

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
