/*
Name: Sushma Nuthanapati
Class: CS 524
Date: October 10 2017
Program - 1
*/
% splits string into a list L and then prints the list

printList(S) :- split_string(S, " \n\t", "\s\n\t", L),
write(L).

% Take a program string and split it into a list

readFile(String) :- split_string(String, " \n", "\s\n\t", Prog),
    phrase(program, Prog), !.
	
% Grammer and rules to be checked

program --> ["int"], ["main"], ["("], [")"], ["{"], declarations, statements, ["}"].

declarations --> declaration.
declarations --> declaration, declarations.
declarations --> [].
declaration --> type, identifier, [";"].
declaration --> type, identifier, ["["], digit, ["]"], [";"].

type --> ["int"].
type --> ["bool"].
type --> ["float"]. 
type --> ["char"].

statements --> statement.
statements --> statement, statements.
statements --> [].
statement --> [";"].
statement --> block.
statement --> assignment.
statement --> if_statement.
statement --> while_statement.

block --> ["{"], statements, ["}"].
assignment --> identifier, ["="], expression, [";"].
assignment --> identifier, ["["], digit, ["]"], ["="], expression, [";"].
if_statement --> ["if"], ["("], expression, [")"], statement.
while_statement --> ["while"], ["("], expression, [")"], statement.

expression --> conjunction.
expression --> conjunction, ["||"], expression.
conjunction --> equality.
conjunction --> equality, ["&&"], conjunction.

equality --> relation.
equality --> relation, equ_op, relation.
equ_op --> ["=="] | ["!="].
relation --> addition.
relation --> addition, rel_op, addition.
rel_op --> ["<"] | ["<="] | [">"] | [">="].


addition --> term.
addition --> term, add_op, addition.
add_op --> ["+"].
add_op --> ["-"].

term --> factor.
term --> factor, mul_op, factor.
mul_op --> ["*"].
mul_op --> ["/"].
mul_op --> ["%"].

factor --> primary.
factor --> unary_op, primary.
unary_op --> ["-"].
unary_op --> ["!"].

primary --> literal.
primary --> identifier.
primary --> identifier, ["["], digit, ["]"].
primary --> ["("], expression, [")"].
primary --> type, ["("], expression, [")"].

literal --> digit.
literal --> boolean.

identifier --> ["A"].
identifier --> ["B"].
identifier --> ["C"].
identifier --> ["D"].
identifier --> ["E"].
identifier --> ["F"].
identifier --> ["G"].
identifier --> ["H"].
identifier --> ["I"].
identifier --> ["J"].
identifier --> ["K"].
identifier --> ["L"].
identifier --> ["M"].
identifier --> ["N"].
identifier --> ["O"].
identifier --> ["P"].
identifier --> ["Q"].
identifier --> ["R"].
identifier --> ["S"].
identifier --> ["T"].
identifier --> ["U"].
identifier --> ["V"].
identifier --> ["W"].
identifier --> ["X"].
identifier --> ["Y"].
identifier --> ["Z"].
identifier --> ["a"].
identifier --> ["b"].
identifier --> ["c"].
identifier --> ["d"].
identifier --> ["e"].
identifier --> ["f"].
identifier --> ["g"].
identifier --> ["h"].
identifier --> ["i"].
identifier --> ["j"].
identifier --> ["k"].
identifier --> ["l"].
identifier --> ["m"].
identifier --> ["n"].
identifier --> ["o"].
identifier --> ["p"].
identifier --> ["q"].
identifier --> ["r"].
identifier --> ["s"].
identifier --> ["t"].
identifier --> ["u"].
identifier --> ["v"].
identifier --> ["w"].
identifier --> ["x"].
identifier --> ["y"].
identifier --> ["z"].
boolean --> ["true"].
boolean --> ["false"].
digit --> ["0"].
digit --> ["1"].
digit --> ["2"].
digit --> ["3"].
digit --> ["4"].
digit --> ["5"].
digit --> ["6"].
digit --> ["7"].
digit --> ["8"].
digit --> ["9"].

% to open the file and read. Split into list, display the list.
% Call readFile rule and check the grammer given
parse_program(Prog) :- open(Prog, read, Fd),
read_string(Fd, "", "", -1, Str),
write(Str), readFile(Str).
