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

NAME = minishell

SRCS_DIR = src
OBJ_DIR = .obj
INC_DIR = inc

LIBFT_DIR = libft
LIBFT_INC = $(LIBFT_DIR)
LIBFT_LIB = $(LIBFT_DIR)/libft.a

FT_PRINTF_DIR = ft_printf
FT_PRINTF_INC = $(FT_PRINTF_DIR)
FT_PRINTF_LIB = $(FT_PRINTF_DIR)/libftprintf.a

SRCS = $(SRCS_DIR)/main.c \
       $(SRCS_DIR)/history_m.c \
       $(SRCS_DIR)/clean_all_m.c \
       $(SRCS_DIR)/bi_pwd_m.c \
       $(SRCS_DIR)/bi_env_m.c \
       $(SRCS_DIR)/bi_env_dollar_j.c \
       $(SRCS_DIR)/bi_echo_short_j.c \
       $(SRCS_DIR)/bi_echo_short_2_j.c \
       $(SRCS_DIR)/bi_echo_m.c \
       $(SRCS_DIR)/bi_echo_dollar_j.c \
       $(SRCS_DIR)/bi_echo_dollar_2_j.c \
       $(SRCS_DIR)/bi_export_m.c \
       $(SRCS_DIR)/signal_j.c \
       $(SRCS_DIR)/signal2_j.c \
       $(SRCS_DIR)/bi_cd_m.c \
       $(SRCS_DIR)/bi_unset_m.c \
       $(SRCS_DIR)/execute_command_m.c \
       $(SRCS_DIR)/manage_inputs_m.c \
       $(SRCS_DIR)/manage_inputs_utils_j.c \
       $(SRCS_DIR)/manage_input_dollars_j.c \
       $(SRCS_DIR)/manage_input_dollars2_j.c \
       $(SRCS_DIR)/manage_input_dollars3_j.c \
       $(SRCS_DIR)/redirections_m.c \
       $(SRCS_DIR)/bi_exit_j.c \
       $(SRCS_DIR)/get_next_line.c \
       $(SRCS_DIR)/get_next_line_utils.c \
       $(SRCS_DIR)/parsing_j.c \
       $(SRCS_DIR)/parsing2_j.c \
       $(SRCS_DIR)/manage_token_parsing_j.c \
       $(SRCS_DIR)/manage_token_dollars_j.c \
       $(SRCS_DIR)/manage_token_dollars2_j.c \
       $(SRCS_DIR)/manage_token_dollars3_j.c \
       $(SRCS_DIR)/manage_pipes_m.c \
       $(SRCS_DIR)/realloc_input_j.c \
       $(SRCS_DIR)/split_exp_utils_j.c \
       $(SRCS_DIR)/update_inputs_m.c \
       $(SRCS_DIR)/redirections_solve_m.c \
       $(SRCS_DIR)/redirections_solve_j.c \
       $(SRCS_DIR)/bi_export_utils_m.c \
       $(SRCS_DIR)/update_env_m.c \
       $(SRCS_DIR)/execute_command_path_m.c \
       $(SRCS_DIR)/manage_pipes_utils_m.c \
       $(SRCS_DIR)/manage_pipes_utils2_m.c \
       $(SRCS_DIR)/init_struct_m.c

OBJS = $(patsubst $(SRCS_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRCS))

CC = cc
CFLAGS = -Wall -Wextra -Werror -g -fsanitize=address -fsanitize=leak -fno-omit-frame-pointer -I$(INC_DIR) -I$(LIBFT_INC) -I$(FT_PRINTF_INC)
AR = ar rcs

all: $(LIBFT_LIB) $(FT_PRINTF_LIB) $(NAME)

$(OBJ_DIR)/%.o: $(SRCS_DIR)/%.c | $(OBJ_DIR)
	@$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR):
	@printf "  \033[33m⚙\033[0m  Compiling %d files...\n" $(words $(OBJS))
	@mkdir -p $(OBJ_DIR)


$(LIBFT_LIB): $(LIBFT_DIR)/Makefile
	@$(MAKE) --no-print-directory -C $(LIBFT_DIR)


$(FT_PRINTF_LIB): $(FT_PRINTF_DIR)/Makefile $(LIBFT_LIB)
	@$(MAKE) --no-print-directory -C $(FT_PRINTF_DIR)

$(NAME): $(OBJS) $(LIBFT_LIB) $(FT_PRINTF_LIB)
	@printf "  \033[32m✓\033[0m Compiled %d files → $(NAME)\n" $(words $(OBJS))
	@$(CC) $(CFLAGS) $(OBJS) $(FT_PRINTF_LIB) $(LIBFT_LIB) -lreadline -o $(NAME)

clean:
	@printf "  \033[31m✗\033[0m  Removing object files...\n"
	@rm -rf $(OBJ_DIR)
	@$(MAKE) --no-print-directory clean -C $(LIBFT_DIR)
	@$(MAKE) --no-print-directory clean -C $(FT_PRINTF_DIR)

fclean: clean
	@printf "  \033[31m✗\033[0m  Removing $(NAME)...\n"
	@rm -f $(NAME)
	@$(MAKE) --no-print-directory fclean -C $(LIBFT_DIR)
	@$(MAKE) --no-print-directory fclean -C $(FT_PRINTF_DIR)

re: fclean all

.PHONY: all clean fclean re
