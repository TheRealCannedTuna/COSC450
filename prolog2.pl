% Exercise 3.1(a)

delete_three(L, L1) :-
	conc(L1, [_,_,_], L).

% Exercise 3.1(b)

delete_six(L, L2) :-
	conc([_,_,_], L2, L1),
	delete_three(L, L1).

% Exercise 3.2(a)

my_last(List, Item) :-
	conc(_, [Item], List),
	member(Item, List).

% Exercise 3.2(b)

your_last([Item], Item).
your_last([_|List], Item) :-
	your_last(List, Item).
