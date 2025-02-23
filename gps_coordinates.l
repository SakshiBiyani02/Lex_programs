%{
#include <stdio.h>
#include <stdlib.h>
%}

%option noyywrap

%%

[-+]?([1-8]?[0-9](\.[0-9]{1,4})?|90(\.0{1,4})?),[-+]?((1[0-7][0-9](\.[0-9]{1,4})?|[1-9]?[0-9](\.[0-9]{1,4})?|0)(\.[0-9]{1,4})?|180(\.0{1,4})?) {
    printf("Valid GPS coordinate: %s\n", yytext);
}

[ \t]+       ;  
\n          ;  
.            { printf("Invalid GPS coordinate: %s\n", yytext); }

%% 

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE *input_file = fopen(argv[1], "r");
    if (!input_file) {
        perror("Error opening file");
        return 1;
    }

    yyin = input_file;
    yylex();
    fclose(input_file);
    return 0;
}
