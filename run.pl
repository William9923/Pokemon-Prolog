%% run before fight 
%% Too much run 
%% Current run prohibited per turn : 1 run
:-dynamic( endRun/0 ).

run :-
	run_counter(1),
	write('You cannot run from this match again this turn'),nl,!.

%% when fighting legendary
run :- 
	vs_legend,
	write('You are facing the divine monster. You felt that running away is not an option now'),nl,
	fight,!.

%% Run away chance before battle : 70 %
run:-
	in_battle(0),
	random(1,11,X),
	X < 8,
	write('Escape successful !'),nl,
	asserta(endRun),
	!.
run:-
	in_battle(0),
	write('Escape unsuccessful !'),nl,
	fight.

%% run in the battle : successful rate 40%
%% if run successful
run :- 
	in_battle(1),
	random(1,11,X),
	X < 5,
	write('Escape successful'),nl,
	retract(run_counter(_)),
	asserta(run_counter(0)),
	retract(enemy_monsta(M)),
	retract(enemy_monsta_health(M,_)),
	asserta(enemy_monsta('')),
	asserta(enemy_monsta_health('',0)),
	retract(curr_monsta(_)),
	asserta(curr_monsta('')),
	end_battle,
	asserta(endRun),!.
%% run in battle, unsuccessful.
run :-
	in_battle(1),
	write('Escape unsuccessful!'),nl,
	retract(run_counter(_)),
	asserta(run_counter(1)),
	fight,!.

end_battle :-
	retract(monsta_out(_)),
	asserta(monsta_out(0)),
	retract(in_battle(_)),
	asserta(in_battle(0)).