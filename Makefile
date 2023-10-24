# Variables
SRCS = ft_strlen.s ft_write.s
BSRCS = 
OBJS = $(SRCS:.s=.o)
BOBJS = 

all: libasm.a

libasm.a: $(OBJS)
	@ar rcs $@ $^

%.o: %.s
	@nasm -f elf64 $< -o $@

test: libasm.a
	@g++ -c main.cpp -o main.o
	@g++ main.o -L. -lasm -o testmain -no-pie
	@./testmain

clean:
	@rm -rf $(OBJS) main.o

fclean: clean
	@rm -rf libasm.a testmain

re: fclean all

rex: re
	valgrind ./testmain

.PHONY: all clean fclean re rex test