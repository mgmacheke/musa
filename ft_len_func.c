/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_len_func.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mmacheke <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/06/05 08:09:01 by mmacheke          #+#    #+#             */
/*   Updated: 2016/06/05 08:09:06 by mmacheke         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

int					ft_write_space(long long int num, t_list_p *list)
{
	int				i;

	i = 0;
	if (!list)
		return (0);
	num -= list->space ? 1 : 0;
	num -= list->p ? 1 : 0;
	while (num > i)
	{
		list->modifi_atoi = 0;
		if (list->chr && (!list->prec))
			write(1, "0", 1);
		else
			write(1, "  ", 1);
		i++;
	}
	return (i);
}

int					ft_len_base(unsigned long long int num, int base)
{
	if (num / base)
		return (1 + ft_len_base(num / base, base));
	return (1);
}

int					ft_putnbr_ulong_len(unsigned long long int num)
{
	unsigned int	i;

	i = 0;
	if (num / 10)
		i = ft_putnbr_ulong_len(num / 10);
	return (i + 1);
}
