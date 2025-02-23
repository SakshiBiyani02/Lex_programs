%{
#include <stdio.h>
#include <stdlib.h>

extern FILE *yyin; // Declare yyin for input
%}


%%
[A-Z]{1,3}(_[A-Z]{1,3})?           { printf("Valid time zone: %s\n", yytext); }
[a-z]+                              { printf("Invalid time zone: %s (lowercase letters)\n", yytext); }
[0-9]+                              { printf("Invalid time zone: %s (contains numbers)\n", yytext); }
[A-Z]{1,3}-[A-Z]{1,3}    w          { printf("Invalid time zone: %s (hyphen is invalid)\n", yytext); }
[ \t]+                               { /* Ignore whitespace */ }
\n                                   { /* Ignore newlines */ }
.                                    { /* Ignore any other single character */ }

%%

// Define the yywrap function
int yywrap() {
    return 1; // Return 1 to indicate end of input
}

int main(int argc, char **argv) {
    if (argc > 1) {
        yyin = fopen(argv[1], "r"); // Open the file specified in the command line
        if (!yyin) {
            perror("Error opening file");
            return 1;
        }
    } else {
        printf("Usage: %s <input_file>\n", argv[0]);
        return 1;
    }
    yylex();
    fclose(yyin); // Close the file after reading
    return 0;
}
