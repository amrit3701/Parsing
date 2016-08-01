%{
//#include <cstdio> 
#include <iostream>
#include "parsor_calc.tab.h"
using namespace std;
#define YY_DECL extern "C" int yylex()
int a;
%}

%%
"+" {return ADD;}
"*" {return MUL;}
"|" {return ABS;}
"/" {return DIV;}
[0-9]+ {yylval.no = atoi(yytext); return INT;}
\n {return EOL;}
[ \t] {}
. {cout << "mystery charcter" << *yytext;}
%%

/*
int main()
{
    yylex();
    cout<<"a: " << a <<endl;
}*/
