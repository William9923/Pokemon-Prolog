/* Battle Consists of:
	1. fight / run
	2. pick
	3. attack, special_attack, capture, use(), status, bag, run, .
*/

battle_inst_first(fight).
battle_inst_first(run).

battle_inst_second(pick(_)).

battle_inst_third(attack).
battle_inst_third(special_attack).
battle_inst_third(capture).
battle_inst_third(use(_)).
battle_inst_third(use(_,_)).
battle_inst_third(bag).
battle_inst_third(run).
battle_inst_third(status).


%% Battle Commands 
battle_command:-
	in_battle(1),
	tab(3), write('Available battle commands: (in Prolog Syntax)'),nl,
	tab(3), write('> attack.'),nl,
	tab(3), write('> special_attack.'),nl,
	tab(3), write('> pick(X).'),nl,
	tab(3), write('> capture.'),nl,
	tab(3), write('> status.'),nl,
	tab(3), write('> bag.'),nl,
	tab(3), write('> use(items).'),nl.

battle(_):-
	checkStart(0),
	write('Game has not started. Type "start." to start the game.'),nl,
	!.

%% nanti implementasiin nama musuh jg.
battle(X) :-
	tab(3),write('Entering battle phase'),nl,
	tab(3),format('A wild ~a has appeared !!',[X]), nl,
	enemy_setup(X),
	battle_menu.

%% Misahin Battle 
battle_menu:-
	tab(3), write('What are you gonna do? (Type with Prolog syntax)'),nl,
	tab(3),write('->'),tab(2), write('fight.'),nl,
	tab(3),write('->'),tab(2), write('run.'),nl,
	repeat,
	tab(3),write('->'),tab(2), read(Ins),
	battle_user_in_first(Ins),
	%% balikin ke kondisi semula
	retract(curr_monsta(_)),
	asserta(curr_monsta('')),
	retract(enemy_monsta(_)),
	retract(enemy_monsta_health(_,_)),
	asserta(enemy_monsta('')),
	asserta(enemy_monsta_health('',0)),
	retract(special_out(_)),
	asserta(special_out(0)),
	end_battle_menu_condition(Ins).

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
	repeat,
	pick_command,
	tab(3),
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
	tab(3),
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
	tab(3), write(' -> '),
	read(Ins), nl,
	battle_user_in_third(Ins),
	in_battle(0),!.
















