bison -d parsor_calc.y
flex scanner_calc.l
g++ parsor_calc.tab.c lex.yy.c -lfl
