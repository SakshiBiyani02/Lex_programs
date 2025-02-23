%{
#include <stdio.h>
#include <string.h>
#include <stdbool.h>

bool is_valid_youtube_link(const char *link) {
    return (strstr(link, "https://www.youtube.com/watch?v=") == link ||
            strstr(link, "https://youtu.be/") == link);
}

int yywrap(void) {
    return 1;  // End of input
}
%}

%%

^.*\n {
    if (is_valid_youtube_link(yytext)) {
        printf("Valid YouTube Link: %s", yytext);
    } else {
        printf("Invalid YouTube Link: %s", yytext);
    }
}

%% 

int main() {
    FILE *file = fopen("input.txt", "r");
    if (file == NULL) {
        perror("Error opening input.txt");
        return 1;
    }

    char input[256];
    while (fgets(input, sizeof(input), file) != NULL) {
        printf("Reading line: %s", input);  // Debugging output
        YY_BUFFER_STATE buffer_state = yy_scan_string(input);
        yylex();
        yy_delete_buffer(buffer_state);
    }

    fclose(file);
    return 0;
}
