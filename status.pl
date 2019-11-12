
%% showing status, in-battle
status :-
	in_battle(1),
	enemy_monsta(X),
	enemy_monsta_health(X,EHealth),
	curr_monsta(Y),
	monsta_owned_health(Y,Health),
	tab(3),format('Your monsta health ~d',[Health]),nl,
	tab(3),format('Your opponent health ~d', [EHealth]),nl,!.
/*' Your Monsta Health: ~d'*/
/*' Opponent Monsta Health: ~d'*/
%% showing status outside battle
status :- 
	list_monsta(L),
	write('Your monsta status : '),nl,
	printStatus(L),nl,!.
/*' Your Monsta Status: '*/
printStatus([]).
printStatus([H|T]):-
	monsta(H),
	format('~a :',[H]),nl,
	monsta_owned_health(H,Health),
	format('Health : ~d',[Health]),nl,
	printStatus(T),!.

