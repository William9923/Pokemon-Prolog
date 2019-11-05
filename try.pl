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



