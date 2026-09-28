# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mpico-bu <mpico-bu@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/20 15:51:55 by mpico-bu          #+#    #+#              #
#    Updated: 2025/01/22 12:50:54 by mpico-bu         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a

SRCS_DIR = .
OBJ_DIR = .
INC_DIR = .

SRCS = $(wildcard $(SRCS_DIR)/*.c)

OBJS = $(SRCS:.c=.o)

CC = cc
CFLAGS = -Wall -Wextra -Werror -I$(INC_DIR)
AR = /usr/bin/ar rc

all: $(NAME)

%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@

$(NAME): $(OBJS)
	@printf "  \033[32m✓\033[0m Compiled %d files → $(NAME)\n" $(words $(OBJS))
	@/usr/bin/ar rc $(NAME) $(OBJS)
	@/usr/bin/ranlib $(NAME)

clean:
	@printf "  \033[31m✗\033[0m  Removing object files...\n"
	@rm -f $(OBJS)

fclean: clean
	@printf "  \033[31m✗\033[0m  Removing $(NAME)...\n"
	@rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
