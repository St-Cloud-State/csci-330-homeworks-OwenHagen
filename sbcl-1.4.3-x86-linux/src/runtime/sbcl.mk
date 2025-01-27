CC=cc
LD=ld
CFLAGS=-g -Wall -Wundef -Wsign-compare -Wpointer-arith -O3 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -m32 -fno-omit-frame-pointer
ASFLAGS=-g -Wall -Wundef -Wsign-compare -Wpointer-arith -O3 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -m32 -fno-omit-frame-pointer
LINKFLAGS=-g -Wl,--export-dynamic -m32
LDFLAGS=
__LDFLAGS__=-m elf_i386
LIBS=-ldl -lpthread -lm
