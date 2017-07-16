AS = /home/giles/opt/cross/bin/i686-elf-as
CC = /home/giles/opt/cross/bin/i686-elf-gcc

C_SOURCES = $(wildcard *.c)
ASM_SOURCES = $(wildcard *.s)

OBJ = ${C_SOURCES:.c=.o} ${ASM_SOURCES:.s=.o}

%.o: %.c
	${CC} -c $< -o $@ -std=gnu99 -ffreestanding -O2 -Wall -Wextra

%.o: %.s
	${AS} $< -o $@

myos.bin: ${OBJ}
	${CC} -T linker.ld -o $@ -ffreestanding -O2 -nostdlib $^ -lgcc
