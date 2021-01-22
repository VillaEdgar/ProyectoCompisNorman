a.out: main.o lex.yy.o BisonP.tab.o
		gcc main.o lex.yy.o BisonP.tab.o -ll

main.o: main.c BisonP.tab.c
		gcc -c main.c

lex.yy.o: lex.yy.c
		gcc -c lex.yy.c

BisonP.tab.o: BisonP.tab.c
		gcc -c BisonP.tab.c 

lex.yy.c: FlexP.l BisonP.tab.c
		flex FlexP.l

BisonP.tab.c: BisonP.y
		bison -d BisonP.y

clean:
		rm -f a.out main.o lex.yy.o BisonP.tab.o lex.yy.c BisonP.tab.c BisonP.tab.h

run: a.out
		./a.out
