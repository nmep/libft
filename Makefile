# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lgarfi <lgarfi@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/10 18:37:52 by lgarfi            #+#    #+#              #
#    Updated: 2024/01/16 16:32:35 by lgarfi           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# CONSOLE DESIGN
WHITE=$'\033[0;37m
GREY=$'\033[0;30m
RED=$'\033[0;31m
GREEN=$'\033[0;32m
YELLOW=$'\033[0;33m
CYAN=$'\033[0;34m
PURPLE=$'\033[0;35m

#variables
SRCS= ft_atoi.c		\
	ft_bzero.c		\
	ft_calloc.c		\
	ft_isalnum.c	\
	ft_isalpha.c	\
	ft_isascii.c	\
	ft_isdigit.c	\
	ft_isprint.c	\
	ft_itoa.c	\
	ft_memchr.c	\
	ft_memcmp.c	\
	ft_memcpy.c	\
	ft_memmove.c	\
	ft_memset.c	\
	ft_putchar_fd.c	\
	ft_putendl_fd.c	\
	ft_putnbr_fd.c	\
	ft_putstr_fd.c	\
	ft_split.c	\
	ft_strchr.c	\
	ft_strdup.c	\
	ft_striteri.c	\
	ft_strjoin.c	\
	ft_strlcat.c	\
	ft_strlcpy.c	\
	ft_strlen.c	\
	ft_strmapi.c	\
	ft_strncmp.c	\
	ft_strnstr.c	\
	ft_strrchr.c	\
	ft_strtrim.c	\
	ft_substr.c	\
	ft_tolower.c	\
	ft_toupper.c	\

SRCS_B=	ft_lstadd_back.c \
		ft_lstadd_front.c \
		ft_lstclear.c      \
		ft_lstdelone.c      \
		ft_lstiter.c         \
		ft_lstlast.c          \
		ft_lstmap.c            \
		ft_lstnew.c             \
		ft_lstsize.c              \


#flag
CC= gcc
CFLAGS=-Wall -Wextra -Werror

#include
$HEADER=libft.h

# .o
OBJS=${SRCS:.c=.o}
OBJS_B=${SRCS_B:.c=.o}

# .a
NAME=libft.a
AR= ar rcs

#del
RM=rm -rf

# rule
.c.o: ${HEADER}
	${CC} ${CFLAGS} -c $< -o ${<:.c=.o}

all: ${NAME}
#	@if test -f ${NAME} >/dev/null; then\
#		fclean
#	else\
#		echo "file not exist";\
#	fi
${NAME}: ${OBJS} ${OBJS_B}
	${AR} ${NAME} $?
	ranlib $@

#so:
#	$(CC) -nostartfiles -fPIC $(CFLAGS) $(SRCS) ${SRCS_B}
#	gcc -nostartfiles -shared -o libft.so $(OBJS) ${OBJS_B}

norminette:
	@echo "⚠️ ${YELLOW} Checking The Norm ⚠️"
	@if norminette ${DIR_SRCS} >/dev/null; then\
        echo " ${GREEN}    Norminette : OK${WHITE}\n";\
    else\
        echo " ${RED}    Norminette : KO${WHITE}\n";\
    fi
bonus: ${OBJS} ${OBJS_B}
	${AR} ${NAME} $?

clean:
	${RM} ${OBJS} ${OBJS_B}

fclean:	clean
	${RM} ${NAME}

re: fclean all

.PHONY : all clean fclean re bonus norminette
