/* 
   	This file says where each of the sections defined in the 
   	object files should go in order to make up the resulting 
   	binary
*/

/* 
	The bootloader will look at this image and start execution
	at the symbol we designate as the entry point:
*/
ENTRY(_start)

/* 
	Now we specify where the various sections of the object files
	will be put in the final kernel image
*/
SECTIONS
{
	/* We start at 1MiB, which is a conventional place for kernels 
	   to be loaded to by the bootloader */
	. = 1M;

	.text BLOCK(4K) : ALIGN(4K)
	{
		/* Now we put in our multiboot header, which needs to be near the 
		   start of the image. */
		*(.multiboot)
		*(.text)
	}

	.rodata BLOCK(4K) : ALIGN(4K) 
	{
		/* Read-only data */
		*(.rodata)
	}

	.data BLOCK(4K) : ALIGN(4K) 
	{
		/* Read-write data */
		*(.rodata)
	}

	.bss BLOCK(4K) : ALIGN(4K)
	{
		/* read-write data (uninitialized) */
		*(COMMON)
		/* stack */
		*(.bss)
	}

}