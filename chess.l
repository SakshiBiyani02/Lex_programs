%{
#include <stdio.h>
%}

%option noyywrap

%%

[a-h][1-8]                                  { printf("Valid pawn move: %s\n", yytext); }
[NBRQK][a-h][1-8]                           { printf("Valid piece move: %s\n", yytext); }
[a-h]x[a-h][1-8]                            { printf("Valid pawn capture: %s\n", yytext); }
[NBRQK]x[a-h][1-8]                          { printf("Valid piece capture: %s\n", yytext); }
O-O                                         { printf("Valid kingside castling: %s\n", yytext); }
O-O-O                                       { printf("Valid queenside castling: %s\n", yytext); }
[a-h][1-8]=[QRBN]                           { printf("Valid pawn promotion: %s\n", yytext); }
[a-h][1-8]\+[QRBN]?                         { printf("Valid check move: %s\n", yytext); }
[a-h][1-8]#                                 { printf("Valid checkmate move: %s\n", yytext); }
[ \t\n]+                                    ;
.                                           { printf("Invalid chess move: %s\n", yytext); }

%%

int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *input_file = fopen(argv[1], "r");
        if (!input_file) {
            fprintf(stderr, "Error: Could not open file %s\n", argv[1]);
            return 1;
        }
        yyin = input_file;
    }
    yylex();
    return 0;
}
