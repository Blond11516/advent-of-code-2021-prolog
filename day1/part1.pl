:- module(part1,
          [ solve/2
          ]).


increased(First, Second) :-
    First<Second.
count_increases([First, Second], 1) :-
    increased(First, Second).
count_increases([_, _], 0).
count_increases([_], 0).
count_increases([], 0).
count_increases([First, Second|Rest], Sum) :-
    increased(First, Second),
    count_increases([Second|Rest], SumRest),
    Sum is SumRest+1.
count_increases([_, Second|Rest], Sum) :-
    count_increases([Second|Rest], Sum).

solve(Lines, Result) :-
    maplist(number_codes, Depths, Lines),
    count_increases(Depths, Result).
