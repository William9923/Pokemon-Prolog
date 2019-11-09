/* Available instruction */
battle_inst(bag).
battle_inst(attack).
battle_inst(status).
battle_inst(special_attack).
battle_inst(pick(_)).  %% masi bingung implementasi
battle_inst(run).
battle_inst(fight).
battle_inst(use(_)).
battle_inst(use(_,_)).
battle_inst(capture).

%% Battle Commands 
battle_command:-
	in_battle(1),
	tab(3), write('Available battle commands: (in Prolog Syntax)'),nl,
	tab(3), write('> attack.'),nl,
	tab(3), write('> special_attack.'),nl,
	tab(3), write('> pick(X).'),nl,
	tab(3), write('> capture.'),nl.




%% Affinity rules
%% Condition :
affinity(leaves, water, win).
affinity(leaves, fire, lose).
affinity(water, fire, win).
affinity(water, leaves, lose).
affinity(fire, leaves, win).
affinity(fire, water, lose).
affinity(wing, earth, win).
affinity(earth,wing, lose).
affinity(ghost,wing,win).
affinity(wing,ghost,lose).
affinity(earth,ghost,win).
affinity(ghost, earth, lose).
affinity(X,Y,draw).

affinity_checker(X,X,1):-!.
affinity_checker(X,Y,Z):-
	affinity(X,Y,win),
	Z is 2,!.
affinity_checker(X,Y,Z):-
	affinity(X,Y,lose),
	(Z is 0.5),!.

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
	member(Ins, [fight,run]),
	Ins,
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

%% show status (temporary, for debugging purpose)
status :-
	enemy_monsta(X),
	enemy_monsta_health(X,EHealth),
	curr_monsta(Y),
	monsta_owned_health(Y,Health),
	tab(3),format('Your monsta health ~d',[Health]),nl,
	tab(3),format('Your opponent health ~d', [EHealth]),nl.

%% attack for player
attack :-
    in_battle(1),
	%% get monsta attack + affinity
	curr_monsta(OwnedMonsta),
	monsta_attack(OwnedMonsta, OwnedAttack),
	monsta_affinity_type(OwnedMonsta, OwnedAffinity),
	%% get enemies defense + affinity 
	enemy_monsta(EnemyMonsta),
	enemy_monsta_health(EnemyMonsta, EnemyHealth),
	monsta_defense(EnemyMonsta,EnemiesDefense),
	monsta_affinity_type(EnemyMonsta, EnemyAffinity),
	%% use the affinity_checker
	affinity_checker(OwnedAffinity, EnemyAffinity, AffinityBalance),
	%% decrease the amount of health by the attack
	Damage is round((OwnedAttack - (0.1 * EnemiesDefense))* AffinityBalance),
	NewHealth is EnemyHealth - Damage,
	retract(enemy_monsta_health(EnemyMonsta, EnemyHealth)),
	asserta(enemy_monsta_health(EnemyMonsta, NewHealth)),
	tab(3),write('Monsta has attacked opponent monsta!'),nl,
	battle_checker,
	enemy_attack,
	status.

%% special_attack : exclusive only when monsta become your slave
special_attack :-
	in_battle(1),
	special_out(1),
	tab(3), write('Your monsta tried to use the special attack'),nl,
	tab(3), write('But it failed'),nl,!.

special_attack :-
    in_battle(1),
    special_out(0),
	%% get monsta attack + affinity
	curr_monsta(OwnedMonsta),
	monsta_special_attack(OwnedMonsta, OwnedAttack),
	monsta_special_attack_name(OwnedMonsta, OwnedAttackName),
	monsta_affinity_type(OwnedMonsta, OwnedAffinity),
	%% get enemies defense + affinity 
	enemy_monsta(EnemyMonsta),
	enemy_monsta_health(EnemyMonsta, EnemyHealth),
	monsta_defense(EnemyMonsta,EnemiesDefense),
	monsta_affinity_type(EnemyMonsta, EnemyAffinity),
	%% use the affinity_checker
	affinity_checker(OwnedAffinity, EnemyAffinity, AffinityBalance),
	%% decrease the amount of health by the attack
	Damage is round((OwnedAttack - (0.1 * EnemiesDefense))* AffinityBalance),
	NewHealth is EnemyHealth - Damage,
	retract(enemy_monsta_health(EnemyMonsta, EnemyHealth)),
	asserta(enemy_monsta_health(EnemyMonsta, NewHealth)),
	format('Take this!! ~a',[OwnedAttackName]),nl,
	retract(special_out(0)),
	asserta(special_out(1)),
	battle_checker,
	enemy_attack,
	status.

%% checker if the current monsta die
battle_checker:- 
	in_battle(1),
	list_monsta(L),
	curr_monsta(M),
	monsta_owned_health(M,Health),
	Health =< 0,
	delete(L,M,NewL),
	retract(monsta_owned(M)),
	retract(monsta_owned_health(M,Health)),
	retract(curr_monsta(M)),
	retract(list_monsta(L)),
	asserta(list_monsta(NewL)),
	asserta(curr_monsta('')),
	retract(monsta_out(1)),
	asserta(monsta_out(0)),!.

%% checker for enemy monsta 
battle_checker:-
	in_battle(1),
	enemy_monsta(M),
	enemy_monsta_health(M,Health),
	Health =< 0,
	retract(enemy_monsta(M)),
	retract(enemy_monsta_health(M,_)),
	asserta(enemy_monsta('')),
	asserta(enemy_monsta_health('',0)),
	retract(in_battle(1)),
	asserta(in_battle(0)),
	retract(monsta_out(1)),
	asserta(monsta_out(0)),
	!.

battle_checker:-
	in_battle(1),
	list_monsta(L),
	countMonsta(L,X),
	X == 0,
	retract(enemy_monsta(M)),
	retract(enemy_monsta_health(M,_)),
	asserta(enemy_monsta('')),
	asserta(enemy_monsta_health('',0)),
	retract(in_battle(1)),
	asserta(in_battle(0)),
	retract(monsta_out(1)),
	asserta(monsta_out(0)),
	die,!.
battle_checker :- in_battle(1).


/* Validate battle commands */
battle_user_in(X):-
	\+battle_inst(X),
	write('Invalid battle commands. Please try again!'),nl.

battle_user_in(X):-
	battle_inst(X),
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
	battle_user_in(Ins),nl,
	monsta_out(1), fight,!.

%% after picked monsta 
fight:- 
	in_battle(1),
	monsta_out(1),
	repeat,
	battle_command,
	tab(3), write(' -> '),
	read(Ins), nl,
	battle_user_in(Ins),
	in_battle(0),!.

%% fight:-
%% 	retract(curr_monsta(_)),
%% 	asserta(curr_monsta('')),
%% 	retract(enemy_monsta(_)),
%% 	retract(enemy_monsta_health(_,_)),
%% 	asserta(enemy_monsta('')),
%% 	asserta(enemy_monsta_health('',0)), 
%% 	start_menu.
















