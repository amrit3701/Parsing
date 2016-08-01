%{
#include <iostream>
using namespace std;
extern "C" int yylex();
extern "C" int yyparse();

void yyerror(const char *s);
%}

%union{
    int no;
}

%token <no> INT;
%token ADD;
%token SUB; 
%token MUL;
%token DIV; 
%token ABS;
%token EOL;

//%type <no> calclist;
%type <no> exp;
%type <no> fact;
//%type <no> factor;
//%type <no> term;

%%
calclist:
    |calclist exp EOL {}
    ;
exp: fact 
    |exp ADD fact { $$ = $1+$3; cout << $$ << endl;}
    |exp SUB fact {$$ = $1-$3; cout << $$ << endl;} 

fact: INT
    |INT MUL INT { $$ =$1*$3; cout << $$ << endl;}
    |INT DIV INT {$$ = $1/$3; cout << $$ << endl;}
    ;
%%

int main()
{
    int tok;
    while (tok = yyparse()){
     }
}

void yyerror(const char *s) {
    cout << "EEK, parse error!  Message: " << s << endl;
    // might as well halt now:
    exit(-1);
}
