#include <iostream>
#include <cstring>
#include <unistd.h>
#include <cerrno>
#include <cstdlib>
#define RED "\033[1;31m"
#define GRE "\033[1;32m"
#define BLU "\033[1;34m"
#define RES "\033[0m"
#define ACT "\b \b\b \b\b \b "

extern "C" {
    size_t	ft_strlen(const char*);
	size_t	ft_write(int, const char*, size_t);
	int		ft_strcmp(const char *s1, const char *s2);
	char	*ft_strchr(const char *s, int c);
}

bool	test_strlen()
{
	const char* str = "Hi";
	if (ft_strlen(str) != strlen(str))
		return false;
	return true;
}

bool	test_write()
{
	const char* str = "Hi";
	int tmp_errno = 0;

	if (ft_write(1, str, 3) != write(1, str, 3))
		return false;
	if (ft_write(1, str, 0) != write(1, str, 0))
		return false;
	if (ft_write(1, str, 1) != write(1, str, 1))
		return false;
	if (ft_write(1, str, 12) != write(1, str, 12))
		return false;
	errno = 0;
	write(-1, str, 1);
	tmp_errno = errno;
	errno = 0;
	ft_write(-1, str, 1);
	if (errno != tmp_errno)
		std::cout << "Errno error" << std::endl;
	return true;
}

bool	test_strchr()
{
	const char *str = "Test";
	int c = 'T';
	bool test = false;
	printf("REAL %s : %s ASM\n", strchr(str, c), ft_strchr(str, c));
	test |= (strchr(str, c) == ft_strchr(str, c));
	return test;
}

int main() {
	std::cout << BLU << "ft_strlen..." << RES << std::flush;
	// sleep(1);
	if (!test_strlen())
	{
	std::cout << RED << ACT << "failure!" << RES << std::endl;
		return 1;
	}
	std::cout << GRE << ACT << "success!" << RES << std::endl;

	std::cout << BLU << "ft_write..." << RES << std::flush;
	// sleep(1);
	if (!test_write())
	{
	// std::cout << RED << ACT << "failure!" << RES << std::endl;
		return 1;
	}
	// std::cout << GRE << ACT << "success!" << RES << std::endl;
	printf("\n");
	// const char *a = "\0";
	// const char *b = "\0";
	// printf("REAL %d : %d ASM\n", strcmp(a, b), ft_strcmp(a, b));
	test_strchr();
	return 0;
}
