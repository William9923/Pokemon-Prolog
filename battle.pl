:-dynamic(
	run_counter/1,
	capture_counter/1
	).

%% initial value
run_counter(0).
capture_counter(0).

/* Battle Consists of:
	1. fight / run
	2. pick
	3. attack, special_attack, capture, use(), status, bag, run, .
*/
%% First phase instruction
battle_inst_first(fight).
battle_inst_first(run).
%% Second phase instruction
battle_inst_second(pick(_)).
%% Third phase instruction
battle_inst_third(attack).
battle_inst_third(special_attack).
battle_inst_third(capture).
battle_inst_third(use(_)).
battle_inst_third(use(_,_)).
battle_inst_third(bag).
battle_inst_third(run).
battle_inst_third(status).
battle_inst_third(pick(_)).

%% Battle Commands 
battle_command:-
	in_battle(1),
	write('Available battle commands: (in Prolog Syntax)'),nl,
	write('> attack.'),nl,
	write('> special_attack.'),nl,
	write('> pick(X).'),nl,
	write('> capture.'),nl,
	write('> status.'),nl,
	write('> bag.'),nl,
	write('> use(items).'),nl,
	write('> run.'),nl.

battle(_):-
	checkStart(0),
	write('Game has not started. Type "start." to start the game.'),nl,
	!.
	
battle(X) :-
	write('Entering battle phase'),nl,
	format('A wild ~a has appeared !!',[X]), nl,
	enemy_setup(X),
	battle_menu.

%% Misahin Battle 
battle_menu:-
	write('What are you gonna do? (Type with Prolog syntax)'),nl,
	write('->'),tab(2), write('fight.'),nl,
	write('->'),tab(2), write('run.'),nl,
	repeat,
	write('->'),tab(2), read(Ins),
	battle_user_in_first(Ins),
	return_from_battle,
	end_battle_menu_condition(Ins).

%% end battle returning condition
return_from_battle:-
	retract(curr_monsta(_)),
	asserta(curr_monsta('')),
	retract(enemy_monsta(_)),
	retract(enemy_monsta_health(_,_)),
	asserta(enemy_monsta('')),
	asserta(enemy_monsta_health('',0)),
	retract(special_out(_)),
	asserta(special_out(0)).

%% battle menu condition ends.
end_battle_menu_condition(fight).
end_battle_menu_condition(run).

/* Validate battle commands */
battle_user_in_first(X):-
	\+battle_inst_first(X),
	write('Invalid battle commands. Please try again!'),nl.

battle_user_in_first(X):-
	battle_inst_first(X),
	X.

%% User input validation for second phase battle
battle_user_in_second(X):-
	\+battle_inst_second(X),
	write('Invalid battle commands. Please try again!'),nl.
battle_user_in_second(X):-
	battle_inst_second(X),
	X.

%% User input validation for third phase battle
battle_user_in_third(X):-
	\+battle_inst_third(X),
	write('Invalid battle commands. Please try again!'),nl.
battle_user_in_third(X):-
	battle_inst_third(X),
	X.

%% pick_command
pick_command:-
	write('Please pick your monsta!'),nl,
	write('Use "pick(<monsta>)" to bring your monsta into battle!'),nl.

/* Main Battle Instruction */
%% before pick monsta
fight :-
	in_battle(0),
	retract(in_battle(0)),
	asserta(in_battle(1)),
	monsta_out(0),
	status,nl,
	repeat,
	pick_command,
	write(' -> '),
	read(Ins),nl,
	battle_user_in_second(Ins),nl,
	monsta_out(1), fight,!.

%% kalo monsta lu td kalah
fight :- 
	in_battle(1),
	monsta_out(0),
	repeat,
	pick_command,
	status,
	write(' -> '),
	read(Ins),nl,
	battle_user_in_second(Ins),nl,
	monsta_out(1), fight,!.

%% after picked monsta 
fight:- 
	in_battle(1),
	monsta_out(1),
	repeat,
	battle_command,
	write(' -> '),
	read(Ins), nl,
	battle_user_in_third(Ins),
	in_battle(0),!.
















