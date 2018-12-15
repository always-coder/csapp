run : main.o
	ld -o run -dynamic-linker /lib64/ld-linux-x86-64.so.2 main.o \
				/usr/lib/x86_64-linux-gnu/crt1.o \
				/usr/lib/x86_64-linux-gnu/crti.o \
			        /usr/lib/x86_64-linux-gnu/crtn.o -lc
main.o : main.s
	as -o main.o main.s 
main.s : main.i
	cc -S main.i -o main.s
main.i : main.c
	cpp -E main.c -o main.i
clean :
	rm main.i main.s main.o run
