##
## EPITECH PROJECT, 2019
## ASM
## File description:
## Makefile
##

SRC	=	src/strlen.asm		\
		src/strchr.asm		\
		src/memset.asm		\
		src/memcpy.asm 		\
		src/strcmp.asm 		\
		src/strncmp.asm 	\
		src/rindex.asm 		\
		src/strcasecmp.asm 	\
		src/strpbrk.asm		\
		src/strstr.asm 		\
		src/strcspn.asm 	\
		src/memmove.asm 	\

NAME	=	libasm.so

OBJS	=	$(SRC:.asm=.o)

%.o:%.asm
	nasm -f elf64 -o $@ $<

all:	$(OBJS)
	ld -shared $(OBJS) -o $(NAME)

clean:
	rm -f $(OBJS)

fclean:	clean
	rm -f $(NAME)

re:	fclean all

.PHONY : clean fclean re
