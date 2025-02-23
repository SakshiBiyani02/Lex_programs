%{
#include <stdio.h>
#include <stdlib.h>
%}

%%


[A-Z]{3}[0-9]{3} {
    printf("Valid ticket code: %s\n", yytext);
}

[^\n]+ {
    printf("Invalid ticket code: %s\n", yytext);
}

\n { /* This rule is to handle new lines, so we don't output anything for them. */ }

%%

// Main function
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

    yyin = input_file; // Assign the input file to yyin
    yylex();           // Start the lexer
    fclose(input_file);
    return 0;
}

// Define yywrap function
int yywrap() {
    return 1;  // Indicates that there's no more input
}
