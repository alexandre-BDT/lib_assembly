##
## EPITECH PROJECT, 2017
## Makefile
## File description:
## Makefile
##


NAME	=	libasm.so

NASM	=	nasm -f elf64

LD	=	ld

RM	=	rm -f

SRCS	=	strlen.asm	\
		strchr.asm	\
		memset.asm	\
		memcpy.asm	\
		strcmp.asm	\
		rindex.asm	\
		strstr.asm	\
		strpbrk.asm	\
		strcspn.asm	\
		memmove.asm	\
		strncmp.asm	\
		strcasecmp.asm	\

OBJ	=	$(addprefix ./lib/,$(SRCS:.asm=.o))

all:	$(NAME)

$(NAME):	$(OBJ)
	$(LD) $(OBJ) -shared -o $(NAME)

%.o:	%.asm
	$(NASM) $< -o $@

clean:
	$(RM) $(OBJ)

fclean:	clean
	$(RM) $(NAME)

re:	fclean all

test: re; gcc -fno-builtin main.c; clear; LD_PRELOAD=/home/alexandre/delivery/ASM/ASM_minilibc_2018/libasm.so ./a.out

.PHONY:	all clean fclean re