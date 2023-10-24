#include <iostream>
#include <cstring>
#include <unistd.h>
#define RED "\033[1;31m"
#define GRE "\033[1;32m"
#define BLU "\033[1;34m"
#define RES "\033[0m"
#define ACT "\b \b\b \b\b \b "

extern "C" {
    size_t ft_strlen(const char*);
	size_t ft_write(int, const char*, size_t);
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
	ft_write(1, str, 2);
	return true;
}

int main() {
	std::cout << BLU << "ft_strlen..." << RES << std::flush;
	sleep(1);
	if (!test_strlen())
	{
	std::cout << RED << ACT << "failure!" << RES << std::endl;
		return 1;
	}
	std::cout << GRE << ACT << "success!" << RES << std::endl;

	std::cout << BLU << "ft_write..." << RES << std::flush;
	sleep(1);
	if (!test_write())
	{
	std::cout << RED << ACT << "failure!" << RES << std::endl;
		return 1;
	}
	std::cout << GRE << ACT << "success!" << RES << std::endl;
    return 0;
}
