package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    public String lexeme; /*clase publica*/
%}
%%
int |
if |
else |
while {lexeme=yytext(); return Reservadas;} /*todas la reservadas*/
{espacio} {/*Ignore*/} /*ignorar los especios*/
"//".* {/*Ignore*/} /*retornar los simbolos matematicos*/
"=" {return Igual;}
"+" {return Suma;}
"-" {return Resta;}
"*" {return Multiplicacion;}
"/" {return Division;}
{L}({L}|{D})* {lexeme=yytext(); return Identificador;} /*identificadores*/
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
 . {return ERROR;}
