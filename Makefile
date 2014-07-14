##
## Makefile for asm in /home/maxime/projet/actu/asm_minilibc
## 
## Made by Maxime
## Login   <maxime@epitech.net>
## 
## Started on  Wed Feb 26 15:10:05 2014 Maxime
## Last update Mon Jul 14 15:52:43 2014 Maxime
##

ASM		=	nasm

SRC 		=	my_strlen.S \
			my_strchr.S \
			my_memset.S \
			my_memmove.S \
			my_strcmp.S \
			my_strncmp.S \
			my_rindex.S \
			my_strcspn.S

OBJ		=	$(SRC:.S=.o)

ASMFLAGS	=	-f elf64

NAME		=	libasm.so

%.o:			%.S
			${ASM} $< ${ASMFLAGS} -o $@

${NAME}:		$(OBJ)
			gcc -shared -o $(NAME) $(OBJ)

all:			${NAME}

clean:
			rm -f $(OBJ)

fclean:			clean
			rm -f $(NAME)

re:			fclean ${NAME}
