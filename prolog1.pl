% Test relations

parent( pam, bob).  % Pam is a parent of Bob
parent( tom, bob).
parent( tom, liz).
parent( bob, ann).
parent( bob, pat).
parent( pat, jim).

female( pam).       % Pam is female
female( liz).
female( ann).
female( pat).
male( tom).         % Tom is male
male( bob).
male( jim).

% Exercise 1.4

grandchild(X, Y) :-
	parent(Y, Z),
	parent(Z, X).

% Exercise 1.5

aunt(X, Y) :-
	parent(N, X),
	parent(N, Z),
	female(X),
	parent(Z, Y).
