%% run in the battle 
run :- 
	in_battle(1),
	random(1,10,X),
	X < 5,
	tab(3),write('Escape successful'),nl,
	retract(in_battle(1)),
	retract(enemy_monsta(M)),
	retract(enemy_monsta_health(M,_)),
	asserta(enemy_monsta('')),
	asserta(enemy_monsta_health('',0)),
	retract(curr_monsta(M)),
	asserta(curr_monsta('')),
	asserta(in_battle(0)),!.
run :-
	in_battle(1),
	tab(3),write('Escape unsuccessful!'),nl.
%% run before fight 
run:-
	in_battle(0),
	random(1,11,X),
	X < 7,
	tab(3),write('Escape successful !'),nl,!.
run:-
	in_battle(0),
	tab(3),write('Escape unsuccessful !'),nl,
	fight.