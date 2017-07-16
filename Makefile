AS = /home/giles/opt/cross/bin/i686-elf-as

%.o: %.s
	${AS} $< -o $@
