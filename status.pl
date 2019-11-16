
%% showing status, in-battle
status :-
	in_battle(1),
	monsta_out(1),
	enemy_monsta(X),
	enemy_monsta_health(X,EHealth),
	monsta_health(X,ETotalHealth),
	monsta_affinity_type(X,EType),
	curr_monsta(Y),
	monsta_owned_health(Y,Health),
	monsta_affinity_type(Y,OType),
	monsta_health(Y,OTotalHealth),
	tab(3),write('Current Monsta :'),nl,
	tab(3), format('~a',[Y]),nl,
	tab(3),format('Health : ~d',[Health]),format('/~d',[OTotalHealth]),nl,
	tab(3), format('Type : ~a',[OType]),nl,
	tab(3),write('Opponent Monsta :'),nl,
	tab(3), format('~a',[X]),nl,
	tab(3),format('Health : ~d',[EHealth]),format('/~d',[ETotalHealth]),nl,
	tab(3), format('Type : ~a',[EType]),nl,nl,!.

%% showing status second battle phase battle
status :- 
	in_battle(1),
	list_monsta(L),
	write('Monsta Status : '),nl,
	printStatus(L),
	!.
%% showing status outside the battle phase 
status :- 
	in_battle(0),
	list_monsta(L),
	write('All Monsta Status : '),nl,
	printStatus(L),
	bag,
	legendary_to_beat(X),
	write('Legendary Monsta to beat : '), write(X), nl,!.

list :-
	in_battle(1),
	monsta_out(1),
	list_monsta(L),
	write('Monsta List:'),
	printStatus(L),nl,!.
	
printStatus([]).
printStatus([H|T]):-
	monsta(H),
	write('->'),tab(1),format('~a',[H]),nl,
	monsta_owned_health(H,Health),
	monsta_health(H,TotalHealth),
	tab(3),format('Health : ~d',[Health]),format('/~d',[TotalHealth]),nl,
	monsta_affinity_type(H,Type),
	tab(3),format('Type :~a',[Type]),nl,
	printStatus(T),!.

