%{
    #include "y.tab.h"    
%}
%option yylineno
unary "++"|"--"
%%
"int"                       {return INT;}
"string"                    {return STRING;}
"float"                     {return FLOAT;}
"adap"                      {return ADAPT;}
"return"                    { return RETURN; }
"for"	                    {return FOR;}
"if"	                    {return IF;}
"while"                     {return WHILE;}
"else"	                    {return ELSE;}
"true"                      {return TRUE;}
"false"                     {return FALSE;}
"func"                      {return FUNC}
"print"                     {return PRINT}
"accept"                    {return ACCEPT}
{unary}                      {return UNARY;}
"+"                          {return ADD;}
"-"                          {return SUB;}
"/"                          {return DIV;}
"*"                          {return MUL;}
"|"                          {return OR:}
"<="                         {return LE;}
">="                         {return GE;}
"=="                         {return EQ;}
"!="                         {return NE;}
">"	                         {return GT;}
"<"	                         {return LT;}
"&&"	                     {return AND;}


[-]?[0-9]+                {strcpy.intVal = atoi(yytext); return INT_VALUE;}
[-]?[0-9]*\.?[0-9]+       {strcpy.floatVal = atof(yytext); return FLOAT_VALUE;}
[a-zA-Z]                  {strcpy.strVal = yytext; return STRING_VALUE;}
[a-zA-Z]([a-zA-Z]|[-]?[0-9]+)* {return IDENTIFIER;}
\n                          {yylineno++;}
[ \t\r\v\f]                 {return WHITESPACE} 
"/""*"(.|\n)*"*""/"         {return COMMENTS}
%%
int yywrap(){
}

main(){
    yylex();
}