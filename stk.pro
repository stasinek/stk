TEMPLATE = lib
DEFINES += STK_BUILD_LIBRARY

QMAKE_CFLAGS_RELEASE += rtti_off stl_off exceptions_off

contains (QMAKE_COMPILER_DEFINES,__clang__) {
QMAKE_CC  = clang
QMAKE_CXX = clang++
}
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
#ASM_SOURCES += 	../STK/cpu/tsoft_cpu_nasm.asm

CONFIG += windows shared dll lib_bundle staticlib
CONFIG -= app_bundle
CONFIG -= qt
QT -= core gui

LIBS += -lkernel32 -lgdi32 -lshell32 -luser32 -lcomctl32 -luserenv
LIBS += -lws2_32 -lwsock32 -lwinmm -limm32 -lole32 -loleaut32

contains(DEFINES, STK_BUILD_LIBRARY) {
TARGET = stk
}
else {
TARGET = stk_test
CONFIG += console
}

CONFIG -= static
CONFIG += precompile_header
CONFIG += debug
CONFIG += warn_on exceptions
CONFIG += c++11

#LIBS += L"../STK/objs/debug" -libstk
#LIBS += L"../BHAPI/src/libs/freetype/objs/debug" -libfreetype
#LIBS += L"../../../../x86_libraries/BHAPI" -libBHAPI


contains(QMAKE_COMPILER_DEFINES, __GNUC__) {
QMAKE_CXXFLAGS += -Wno-write-strings -Wno-multichar
QMAKE_CFLAGS   += -Wno-write-strings -Wno-multichar
QMAKE_CXXFLAGS += -Wno-unused-variable -Wno-unused-parameter -Wno-unused-value -Wno-unused-label
QMAKE_CFLAGS   += -Wno-unused-variable -Wno-unused-parameter -Wno-unused-value -Wno-unused-label
QMAKE_CXXFLAGS += -Wno-unused-but-set-variable
QMAKE_CFLAGS   += -Wno-unused-but-set-variable
QMAKE_CXXFLAGS += -Wattributes -Winline -Wshadow -Wall
QMAKE_CFLAGS   += -Wattributes -Winline -Wshadow -Wall
QMAKE_CXXFLAGS += -Wunknown-pragmas
QMAKE_CFLAGS   += -Wunknown-pragmas

QMAKE_CXXFLAGS -= -pipe
QMAKE_CXXFLAGS += -save-temps
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
}

contains(QMAKE_COMPILER_DEFINES, __clang__) {
QMAKE_CXXFLAGS += -Wno-write-strings -Wno-multichar
QMAKE_CFLAGS   += -Wno-write-strings -Wno-multichar
QMAKE_CXXFLAGS += -Wno-unused-variable -Wno-unused-parameter -Wno-unused-value -Wno-unused-label
QMAKE_CFLAGS   += -Wno-unused-variable -Wno-unused-parameter -Wno-unused-value -Wno-unused-label
QMAKE_CXXFLAGS += -Wno-unused-but-set-variable
QMAKE_CFLAGS   += -Wno-unused-but-set-variable
QMAKE_CXXFLAGS += -Wattributes -Winline -Wshadow -Wall
QMAKE_CFLAGS   += -Wattributes -Winline -Wshadow -Wall
QMAKE_CXXFLAGS += -Wunknown-pragmas
QMAKE_CFLAGS   += -Wunknown-pragmas

QMAKE_CXXFLAGS += -save-temps
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
QMAKE_CXXFLAGS -= -pipe

QMAKE_LFLAGS += -Qunused-arguments -Wno-error=unused-command-line-argument-hard-error-in-future
QMAKE_LFLAGS -= -mthreads
}

contains(QMAKE_COMPILER_DEFINES, _MSC_VER) {
QMAKE_CXXFLAGS += /arch:SSE2
}

SOURCES += \
        ../STK/cpu/tsoft_cpu.cpp\
        ../STK/time/tsoft_time.cpp\
        ../STK/text/tsoft_cstr_class.cpp\
        ../STK/text/tsoft_cstr_stack.cpp\
        ../STK/io/tsoft_file_io.cpp\
        ../STK/io/tsoft_rs232.cpp\
        ../STK/file/tsoft_file_mime_types.cpp\
        ../STK/file/ini/tsoft_file_ini.cpp\
        ../STK/file/eno/tsoft_file_lzst_header.cpp\
        ../STK/io/tsoft_console.cpp\
        ../STK/database/tsoft_database_items.cpp\
        ../STK/database/tsoft_database.cpp\
        ../STK/process_journal/tsoft_journal.cpp\
        ../STK/pharser/tsoft_pharse_command_line.cpp\
        ../STK/pharser/tsoft_pharse_math.cpp\
        ../STK/sockets/tsoft_sockets.cpp\
        ../STK/compression/tsoft_compression_ari.cpp\
        ../STK/compression/tsoft_compression_bwt_matrix2.cpp\
        ../STK/compression/tsoft_compression_huff.cpp\
        ../STK/compression/tsoft_compression_lzstv4.cpp\
        ../STK/compression/tsoft_compression_static_huff.cpp\
        ../STK/compression/tsoft_compression_API.cpp\
        ../STK/hash/tsoft_hash_crc32.cpp\
        ../STK/hash/tsoft_hash_md5.cpp\
        ../STK/hash/tsoft_hash_password.cpp\
        ../STK/hash/tsoft_hash_ssc1.cpp\
        ../STK/cipher/tsoft_cipher_mtf.cpp\
        ../STK/cipher/tsoft_cipher_API.cpp\
        ../STK/koperek/tsoft_kop32_class.cpp\
        ../STK/koperek/tsoft_kop32_controler.cpp\
        ../STK/koperek/tsoft_kop32_search.cpp\
        ../STK/koperek/tsoft_kop32_socket_server.cpp\
        ../STK/koperek/tsoft_kop32_API.cpp\
        ../STK/sthreads/tsoft_threads.cpp\
        ../STK/kop32_main.cpp\
        ../STK/__vector.cpp\
        ../STK/__set.cpp\
        ../STK/__hash_chain.cpp\
        ../STK/__list.cpp\
        ../STK/__property.cpp\
        ../STK/__map.cpp\
        ../STK/stasm/__stasm.cpp\
        ../STK/cipher/tsoft_cipher_pair.cpp\
        ../STK/tsoft_test.cpp \
        ../STK/file/vfs/tsoft_file_vfs.cpp \
        ../STK/mem/tsoft_mem.cpp \
        ../STK/text/tsoft_cstr_utils.cpp \
        ../STK/file/json/json.c \
        ../STK/file/zip/miniz.c \
        ../STK/hash/md5/md5.c \
        ../STK/hash/sha1/hmac_sha1.c \
        ../STK/cipher/tsoft_base64.cpp \
        ../STK/file/xml/XML.CPP \
        ../STK/hash/sha1/sha1.c

contains(DEFINES, QT_GUI) {
        SOURCES +=
}
contains(QMAKE_COMPILER_DEFINES, __GNUC__) {
SOURCES+=
        ../STK/cpu/tsoft_cpu_gas.s
}

#PRECOMPILED_HEADER += ../STK/tsoft_MAIN.h
#PRECOMPILED_HEADER += ../STK/kop32_main.h

HEADERS += \
        ../STK/tsoft_main.h \
        ../STK/time/tsoft_time.h \
        ../STK/cpu/tsoft_cpu.h \
        ../STK/text/tsoft_cstr_class.h \
        ../STK/text/tsoft_cstr_stack.h \
        ../STK/io/tsoft_file_io.h \
        ../STK/io/tsoft_rs232.h \
        ../STK/file/tsoft_file_mime_types.h \
        ../STK/file/ini/tsoft_file_ini.h \
        ../STK/file/eno/tsoft_file_lzst_header.h \
        ../STK/io/tsoft_console.h \
        ../STK/database/tsoft_database.h \
        ../STK/database/tsoft_database_owner.h \
        ../STK/database/tsoft_database_alias.h \
        ../STK/database/tsoft_database_items.h \
        ../STK/pharser/tsoft_pharse_math.h \
        ../STK/pharser/tsoft_pharse_command_line.h \
        ../STK/process_journal/tsoft_journal.h \
        ../STK/sockets/tsoft_sockets.h \
        ../STK/compression/tsoft_compression_static_huff.h \
        ../STK/compression/tsoft_compression_ari.h \
        ../STK/compression/tsoft_compression_bwt_matrix2.h \
        ../STK/compression/tsoft_compression_bwt_matrix3_suffix.h \
        ../STK/compression/tsoft_compression_huff.h \
        ../STK/compression/tsoft_compression_lzstv4.h \
        ../STK/compression/tsoft_compression_API.h \
        ../STK/hash/tsoft_hash_ssc1.h \
        ../STK/hash/tsoft_hash_crc32.h \
        ../STK/hash/tsoft_hash_md5.h \
        ../STK/hash/tsoft_hash_password.h \
        ../STK/cipher/tsoft_cipher_mtf.h \
        ../STK/cipher/tsoft_cipher_API.h \
        ../STK/koperek/tsoft_kop32_class.h \
        ../STK/koperek/tsoft_kop32_search.cpp \
        ../STK/koperek/tsoft_kop32_controler.h \
        ../STK/koperek/tsoft_kop32_list.h \
        ../STK/koperek/tsoft_kop32_options.h \
        ../STK/koperek/tsoft_kop32_socket_server.h \
        ../STK/koperek/tsoft_kop32_API.h \
        ../STK/sthreads/tsoft_threads.h \
        ../STK/kop32_main.h \
        ../STK/3D/__3Dvector.h \
        ../STK/__set.h \
        ../STK/__vector.h \
        ../STK/__hash_chain.h \
        ../STK/__list.h \
        ../STK/__map.h \
        ../STK/stasm/__stasm.h \
        ../STK/cipher/tsoft_cipher_pair.h \
        ../STK/file/vfs/tsoft_file_vfs.h \
        ../STK/incbin/__incbin.h \
        ../STK/mem/tsoft_mem.h \
        ../STK/text/tsoft_cstr_utils.h \
        ../STK/text/tsoft_cstr.h \
        ../STK/file/json/json.h \
        ../STK/hash/md5/md5.h \
        ../STK/hash/sha1/hmac_sha1.h \
        ../STK/cipher/tsoft_base64.h \
        ../STK/file/xml/XML.H \
        ../STK/hash/sha1/sha.h

contains(DEFINES, QT_GUI) {
HEADERS +=
}
contains(QMAKE_COMPILER_DEFINES, __GNUC__) {
LIBS += -lwinmm -lgomp
LIBS += -lwsock32 -lws2_32 -lcrypt32 -lgdi32 -luser32 -lshell32
}
contains(QMAKE_COMPILER_DEFINES, _MSC_VER) {
LIBS += \
        winmm.lib wsock32.lib ws2_32.lib crypt32.lib
LIBS += \
    vcompd.lib
LIBS += \
    gdi32.lib user32.lib shell32.lib ole32.lib oleaut32.lib kernel32.lib uuid.lib\
    QtCored.lib
LIBS -= \
    gomp.lib
}

contains(DEFINES, QT_GUI) {
FORMS +=
RESOURCES +=
}

OTHER_FILES +=

DISTFILES += \
    ../STK/test.txt
