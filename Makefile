AS = /home/giles/opt/cross/bin/i686-elf-as
CC = /home/giles/opt/cross/bin/i686-elf-gcc

%.o: %.c
	${CC} -c $< -o $@ -std=gnu99 -ffreestanding -O2 -Wall -Wextra

%.o: %.s
	${AS} $< -o $@
