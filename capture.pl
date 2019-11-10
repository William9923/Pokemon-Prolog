/*
%% /* Counting Items 
%% %% Basis
%% countMonsta(_,_):- checkStart(1),!.
%% countMonsta([],0).
%% %% Rekurens
%% countMonsta([_|T],X):-
%% 	countMonsta(T,X1),
%% 	X is X1 + 1.
*/
capture:-
	numMonsta(X),
	X >= 6,
	write('You have too much monsta with you already'),nl,!.
%% succesful capture
capture:- 
	in_battle(1),
	list_monsta(L),
	numMonsta(X),
	X < 6,
	enemy_monsta(M),
	enemy_monsta_health(M,Health),
	\+member(M,L),
	append(L,[M],LNew),
	retract(list_monsta(L)),
	asserta(list_monsta(LNew)),
	asserta(monsta_owned(M)),
	asserta(monsta_owned_health(M,Health)),
	format('Congratulation, you have successfully make ~a your slave!!', [M]),nl,
	end_battle,
	format('You have captured ~a!!',[M]),
	X1 is X + 1,
	retract(numMonsta(_)),
	asserta(numMonsta(X1)),
	!.
%% capture 
capture:-
	enemy_monsta(M),
	list_monsta(L),
	member(M,L),
	format('~a will sad if you abondon it and capture another monsta!', [M]),!.
%% Unsuccessful capture 
capture:-
	write('You failed to capture it'),nl.

%% end battle status
end_battle :-
	retract(in_battle(_)),
	asserta(in_battle(0)),
	retract(monsta_out(_)),
	asserta(monsta_out(0)),
	retract(special_out(_)),
	asserta(special_out(0)).
