##
## EPITECH PROJECT, 2022
## Lib
## File description:
## Makefile
##

SRC		= 	src/strlen.asm \
		  	src/strcmp.asm \
		  	src/strncmp.asm \
			src/strchr.asm \
			src/strrchr.asm \
			src/memset.asm \
		  	src/memcpy.asm \
		  	src/memmove.asm \
		  	src/strcasecmp.asm \
			src/strstr.asm \
		  	src/strcspn.asm \
		  	src/strpbrk.asm \

AS			= nasm
ASFLAGS		= -f elf64

CC			= ld
CFLAGS		= -shared -fno-builtin

OBJS		= $(SRC:.asm=.o)

NAME		= libasm.so

all: $(NAME)

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) -o $(NAME) $(OBJS)

%.o: %.asm
	$(AS) $(ASFLAGS) $< -o $@

clean:
	rm -rf $(OBJS)

fclean: clean
	rm -f $(NAME)

re:	fclean all

.PHONY: all clean fclean re
