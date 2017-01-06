# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmacheke <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/06/04 07:14:01 by mmacheke          #+#    #+#              #
#    Updated: 2016/06/05 10:30:48 by mmacheke         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

CC = gcc

FLAGS = -Wall -Wextra -Werror

SRC = ft_bit_wise.c \
		ft_print_num_d.c \
		ft_printf.c \
		ft_printf_op_c_unicode.c \
		ft_printf_op_s.c \
		ft_printf_p.c \
		ft_printf_op_s_unicode.c \
		ft_conv_base.c \
		ft_modif_list.c ft_len_func.c \
		ft_drill_2.c \
		ft_drill.c

SRCLIBFT = ft_atoi.c \
    ft_isdigit.c \
    ft_putchar.c \
    ft_putstr.c \
    ft_putstr_fd.c \
    ft_strchr.c \
    ft_strlen.c \
   

OBJ = $(SRC:.c=.o)


OBJLIBFT = $(SRCLIBFT:.c=.o)

all: $(NAME)

$(NAME): $(OBJ)
		$(CC) $(FLAGS) -c $(addprefix  libft/,$(SRCLIBFT))
		@ar rc $(NAME) $(OBJ) $(OBJLIBFT)
		@ranlib $(NAME)

%.o: %.c
	$(CC) -o $@ -c $< $(FLAGS) -I libft/

clean:
	rm -f $(OBJ)
	rm -f $(OBJLIBFT)

fclean: clean
	rm -f $(NAME)

re: fclean all
