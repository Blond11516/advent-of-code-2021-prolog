:- initialization(main, main).

read_lines(Stream, []) :-
    at_end_of_stream(Stream).
read_lines(Stream, [Line|Rest]) :-
    \+ at_end_of_stream(Stream),
    read_line_to_codes(Stream, Line),
    read_lines(Stream, Rest).

files(Day, Part, PrologFilePath, InputFilePath) :-
    string_concat("day", Day, DayFolder),
    atomics_to_string([part, Part, ".pl"], "", PrologFileName),
    atomics_to_string([DayFolder, PrologFileName], "/", PrologFilePath),
    atomics_to_string([DayFolder, "input.txt"], "/", InputFilePath).

read_input(InputFilePath, Lines) :-
    open(InputFilePath, read, Stream),
    read_lines(Stream, Lines),
    close(Stream).

main([Day, Part]) :-
    files(Day, Part, PrologFilePath, InputFilePath),
    read_input(InputFilePath, Lines),
    consult(PrologFilePath),
    solve(Lines, Result),
    writeln(Result).
