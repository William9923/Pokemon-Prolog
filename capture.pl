/* Counting Items */
%% Basis
countMonsta(_,_):- checkStart(1),!.
countMonsta([],0).
%% Rekurens
countMonsta([_|T],X):-
	countMonsta(T,X1),
	X is X1 + 1.


%% succesful capture
capture:- 
	trace,
	in_battle(1),
	list_monsta(L),
	countMonsta(L,X),
	X < 6,
	enemy_monsta(M),
	enemy_monsta_health(M,Health),
	append(L,[M],LNew),
	retract(list_monsta(L)),
	asserta(list_monsta(LNew)),
	asserta(monsta_owned(M)),
	asserta(monsta_owned_health(M,Health)),
	format('Congratulation, you have successfully make ~a your slave!!', [M]),nl,
	retract(in_battle(1)),
	asserta(in_battle(0)),
	retract(monsta_out(1)),
	asserta(monsta_out(0)),
	format('You have captured ~a!!',[M]),
	!.

%% if inventory full
capture:-
	list_monsta(L),
	countMonsta(L,X),
	X >= 6,
	write('You have too much monsta with you already'),nl,!.

%% Unsuccessful capture 
capture:-
	write('You failed to capture it'),nl.
