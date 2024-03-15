% Exercise 3.4

my_reverse([],[]).
my_reverse([X|List], Rev) :-
	my_reverse(List, R),
	conc(R,[X],Rev).

% Exercise 3.5

palindrome(List) :-
	reverse(List,Y),
	List == Y.	

% Exercise 3.6

shift([X|L1],L2) :-
	conc(L1, [X], L2).
	
% Exercise 3.11

my_flatten([], []).
my_flatten([H|T], Flattened) :-
	my_flatten(H, X),
	my_flatten(T, Y),
	conc(X, Y, Flattened).
my_flatten(X, [X]).
