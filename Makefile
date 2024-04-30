SRCS = $(addprefix 'mandatory/', $(SRCS_MANDATORY)) $(addprefix 'bonus/', $(SRCS_BONUS))
SRCS_MANDATORY = ft_strlen.s
OBJS = $(SRCS:.s=.o)

all: libasm.a

libasm.a: $(OBJS)
	@ar rcs $@ $^

%.o: %.s
	@nasm -f elf64 $< -o $@

test: re all
	@c++ -c main.cpp -o main.o
	@c++ main.o -L. -lasm -o testmain
	@./testmain

clean:
	@rm -rf $(OBJS) main.o

fclean: clean
	@rm -rf libasm.a testmain

re: fclean all

rex: re
	@valgrind ./testmain

.PHONY: all clean fclean re rex test