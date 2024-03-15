% Exercise 3.12

my_flatten([], []).
my_flatten([H|T], Flattened) :-
	my_flatten(H, X),
	my_flatten(T, Y),
	append(X, Y, Flattened), !.
my_flatten(X, [X]).

% Exercise 5.2

class(Number, positive) :- Number > 0, !.
class(0, zero) :- !.
class(_, negative).

split([], [], []).
split([H|T], [H|Pos], Neg) :- H >= 0, split(T, Pos, Neg).
split([H|T], Pos, [H|Neg]) :- H < 0, split(T, Pos, Neg).

% Version 2, with cuts for efficiency

split([], [], []).
split([H|T], [H|Pos], Neg) :- H >= 0, !, split(T, Pos, Neg).
split([H|T], Pos, [H|Neg]) :- split(T, Pos, Neg).

% Exercise 5.5

set_difference([], _, []).
set_difference([H|T], Set2, Diff) :- member(H, Set2), !, set_difference(T, Set2, Diff).
set_difference([H|T], Set2, [H|Diff]) :- set_difference(T, Set2, Diff).

% Exercise 5.6

unifiable([], _, []).
unifiable([H|T], Term, List) :- not(H = Term), !, unifiable(T, Term, List).
unifiable([H|T], Term, [H|List]) :- unifiable(T, Term, List).

% not, so that 5.6 works (just in case)

not(P) :-
	P, !, fail
;
	true.
