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
%% run in the battle 
run :- 
	trace,
	in_battle(1),
	random(1,10,X),
	X < 5,
	tab(3),write('Escape successful'),nl,
	retract(enemy_monsta(M)),
	retract(enemy_monsta_health(M,_)),
	asserta(enemy_monsta('')),
	asserta(enemy_monsta_health('',0)),
	retract(curr_monsta(_)),
	asserta(curr_monsta('')),
	end_battle,
	!.
run :-
	in_battle(1),
	tab(3),write('Escape unsuccessful!'),nl,
	fight,!.
