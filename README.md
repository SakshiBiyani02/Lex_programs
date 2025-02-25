# Compiler used:  
GNU Compiler Collection (GCC)
# Editor used: 
VScode
# 1. Lex program to validate chess moves
This Lex program verifies the validity of chess moves written in standard algebraic notation, such as e4, Nf3, Bb5, O-O, O-O-O, and more. It categorizes valid moves and flags invalid ones based on chess rules for pawn moves, piece moves, castling, pawn promotion, checks, and checkmates.
## Procedure:
1.	Write the Lex Program: Save the Lex program code in a file named chess_moves.l.
2.	Prepare the Input File:	Create a text file named chess_moves.txt containing chess moves (one move per line) to test the program.
3.	Compile the Program:
-	Use the flex command to generate the C source code from the Lex file.
-	Compile the generated lex.yy.c using a C compiler.
4.	Run the Executable: Execute the program with the input file to validate chess moves.
## Lex Executable Commands
1.	Generate C File from Lex Program: flex chess.l
2.	Compile the C File: gcc lex.yy.c -o chess
3.	Run the Program with Input File: ./chess chess_moves.txt
## Input
![Input](https://github.com/SakshiBiyani02/Lex_programs/blob/main/Screenshot%202025-02-23%20133938.png?raw=true)
## Output 
![Output](https://github.com/SakshiBiyani02/Lex_programs/blob/main/Screenshot%202025-02-23%20133946.png?raw=true)
## Test cases explanation
- Valid Move: e4
1.	Move Description: The move e4 indicates that a pawn is being moved from its starting position (e2) to the e4 square on the chessboard.
2.	Validation:
- In chess, pawns move forward one square, and they can move two squares forward from their initial position. The move e4 is valid, as it represents a pawn moving two squares forward from its starting position.
- The Lex program recognizes this valid move using the regex pattern for pawn moves, which matches any lowercase letter (a-h) followed by a digit (1-8).
3.	Output: The program identifies this move as: Valid pawn move: e4
- Invalid Move: x
1.	Move Description: The string x is not a valid representation of any chess move.
2.	Validation:
-	In chess notation, valid moves typically include the name of the piece, the target square, or additional notations for capturing, check, or castling.
-	The string x does not correspond to any recognized move format in chess notation. The regex patterns defined in the Lex program do not match this input because it doesn't follow the required format (for example, it lacks a piece designation, a square reference, or proper notation).
3.	Output: The program captures this as an invalid chess move and prints Invalid chess move: x

# 2. Time Zone Format Validator Using Lex
This program is a Lex script that validates time zone strings against a specific format. It identifies valid time zones and provides feedback on invalid time zones based on specific rules (e.g., lowercase letters, numbers, or invalid characters).
## Procedure:
1.	Define Rules in Lex:
- Use regular expressions to match valid and invalid time zone patterns.
Examples:
- Valid time zone: 1-3 uppercase letters optionally followed by an underscore and another set of 1-3 uppercase letters (e.g., EST, PST_AK).
- Invalid cases include lowercase letters, numbers, or the use of special characters like hyphens.
2.	Set Up Main Program:
- Accept the input file as a command-line argument.
- Use yyin to read the input file line by line.
3.	Match and Print Output:
- For each input string, the program checks if it matches the rules for valid time zones.
- - Print results for valid or invalid time zones.
4.	Compile and Execute:
- Generate a scanner using lex and compile with the C compiler.
- Run the executable, providing the input file.
## Lex Executable Commands:
1.	Generate C File from Lex Program: flex timezone.l
2.	Compile the C File: gcc lex.yy.c -o timezone
3.	Run the Program with Input File: ./timezone input.txt
## Input
![Input](https://github.com/SakshiBiyani02/Lex_programs/blob/main/Screenshot%202025-02-23%20133814.png?raw=true)
## Output
![Output](https://github.com/SakshiBiyani02/Lex_programs/blob/main/Screenshot%202025-02-23%20133827.png?raw=true)
## Test cases explanation
GMT:
-	Matches the valid time zone pattern [A-Z]{1,3}(_[A-Z]{1,3})?.
-	It consists of 1–3 uppercase letters, so it is valid.
gmt:
-	Does not match the valid pattern because it contains lowercase letters.
-	Identified as invalid with the message Invalid time zone: gmt (lowercase letters).

# 3. YouTube Link Validator Using Flex
This program validates YouTube links by reading them from an input file. It checks each link against predefined patterns for valid YouTube URLs and outputs whether each link is valid or invalid.
## Procedure
1.	Input File: The program reads YouTube links from an input file named inp.txt, with each link on a new line.
2.	Flex Program: The program uses Flex (a lexical analyzer) to define patterns for valid YouTube links.
3.	Compilation: The Flex file is compiled using GCC to create an executable.
4.	Execution: When the executable runs, it reads the links from the input file, checks their validity, and prints the results.
## Lex Executable Commands
1.	Generate C File from Lex Program: flex youtube_links.l
2.	Compile the C File: gcc lex.yy.c -o youtube_links
3.	Run the Program with Input File: ./youtube_links 
## Input.txt file 
![Input](https://github.com/SakshiBiyani02/Lex_programs/blob/main/Screenshot%202025-02-23%20133844.png?raw=true)
## Output
![Output](https://github.com/SakshiBiyani02/Lex_programs/blob/main/Screenshot%202025-02-23%20133854.png?raw=true)
## Test cases explanation
-Valid YouTube Link
-- Input: https://www.youtube.com/watch?v=dQw4w9WgXcq
-- Output: Valid YouTube Link: https://www.youtube.com/watch?v=dQw4w9WgXcq
-- Reason: The link starts with https://www.youtube.com/watch?v= and contains a valid video ID, so it passes the validation and is recognized as valid.
-Invalid YouTube Link
--	Input: https://www.example.com
--	Output: Invalid YouTube Link: https://www.example.com
--	Reason: The link lacks the required YouTube structure (https://www.youtube.com/watch?v= or https://youtu.be/) and is marked as invalid.
# 4.Lex Program for Parsing and Validating Airline Ticket Codes
This program utilizes Lex to parse an input file containing airline ticket codes and validate their formats. The valid format is defined as three uppercase letters followed by three digits (e.g., "ABC123"). The program reads from a specified input file, processes each line to determine whether it is a valid ticket code, and outputs the results accordingly.
## Procedure
1.	Set Up the Environment:
- Install Flex and GCC on your system if they are not already installed.-
- Create a new folder for your project and open it in Visual Studio Code (VSCode).
2.	Create the Lex Program:
-	Create a file named ticket.l in your project folder.
-	Write the Lex code provided below, which includes rules for matching valid ticket codes and identifying invalid codes.
3.	Create the Input File: Create a file named inp.txt in the same folder and add test airline ticket codes.
4.	Compilation: The Flex file is compiled using GCC to create an executable.
5.	Execution: When the executable runs, it reads the links from the input file, checks their validity, and prints the results.
## Lex Executable Commands
1.	Generate C File from Lex Program: flex ticket.l
2.	Compile the C File: gcc lex.yy.c -o ticket
3.	Run the Program with Input File: ./ticket inp.txt
## Input
![Input](https://github.com/SakshiBiyani02/Lex_programs/blob/main/Screenshot%202025-02-23%20133904.png?raw=true)
## Output
![Output](https://github.com/SakshiBiyani02/Lex_programs/blob/main/Screenshot%202025-02-23%20133913.png?raw=true)
## Test case explanation
1.	Valid Ticket Codes:
-	ABC123: Matches the pattern (3 letters + 3 digits), thus classified as valid.
-	XYZ456: Follows the same pattern, hence also valid.
-	DEF789: Again follows the valid format.
-	JKL123: This matches the expected format, making it valid as well.
2. Invalid Ticket Codes:
- INVALID1: Does not match the expected format. The presence of letters and digits mixed (not adhering to the specific pattern) leads to it being classified as invalid.
- 123ABC: Starts with digits instead of uppercase letters. This fails the validation.
- GHI00X: While it starts with valid letters, it ends with only two digits followed by a letter, which does not meet the required format of three digits, marking it as invalid.
## 5.Lex Program for Extracting and Validating GPS Coordinates
This program utilizes Lex to extract and validate GPS coordinates from an input file. The valid format for GPS coordinates is defined as two decimal numbers separated by a comma, where the first number represents latitude (ranging from -90 to 90) and the second represents longitude (ranging from -180 to 180). The program reads from a specified input file and outputs whether each coordinate pair is valid or invalid.
## Procedure
1.	Set Up the Environment:
o	Install Flex and GCC on your system if they are not already installed.
o	Create a new folder for your project and open it in Visual Studio Code (VSCode).
2.	Create the Lex Program: Create a file named gps_coordinates.l in your project folder.
6.	Create the Input File: Create a file named gps_coords.txt in the same folder and add test airline ticket codes.
7.	Compilation: The Flex file is compiled using GCC to create an executable.
8.	Execution: When the executable runs, it reads the links from the input file, checks their validity, and prints the results.
## Lex Executable Commands
1.	Generate C File from Lex Program: flex gps_coordinates.l
2.	Compile the C File: gcc lex.yy.c -o gps_coordinates
3.	Run the Program with Input File: ./gps_coordinates gps_coords.txt
## Input 
![Input](https://github.com/SakshiBiyani02/Lex_programs/blob/main/Screenshot%202025-02-23%20133921.png?raw=true)
## Output
![Output](https://github.com/SakshiBiyani02/Lex_programs/blob/main/Screenshot%202025-02-23%20133930.png?raw=true)
## Test case explanation
- Case 1: Valid GPS Coordinate
Input: 37.7749,-122.4194
Output: Valid GPS coordinate: 37.7749,-122.4194
Explanation:
•	The input consists of a latitude (37.7749) and a longitude (-122.4194), formatted correctly with a comma.
•	The regex matches both values as valid since they are within acceptable ranges (-90 to 90 for latitude, -180 to 180 for longitude).
- Case 2: Invalid GPS Coordinate
Input: 9
Output: Invalid GPS coordinate: 9
Explanation:
•	The input is a single number without the required comma or a corresponding longitude value.
•	It does not match the valid GPS coordinate format, leading the lexer to classify it as invalid.
These cases illustrate the program's ability to distinguish between valid and invalid GPS coordinates based on formatting.
