:-dynamic(at/1).
at(5).
tes:- asserta(at(10)).

item(william).
tes2(X):-
	item(X),
	format('Kamu menjatuhkan ~a.',[X]),
	nl.

%% randomizer
randomPercentage(X,Bool):-
	random(1,10,Z),
	Z =< X,
	Bool = yes,!.
randomPercentage(X,Bool):- Bool = no.

lists([a,b,c,d,e,f,g]).

%% Basis
count([],0).
%% Rekurens
count([_|T],X):- 
	count(T,X1),
	X is X1+1.

tes:- 
	count(lists,X),
	X > 10,
	write(X),!.
tes:-
	write('no').



