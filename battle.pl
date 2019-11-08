:- dynamic(
	enemy_monsta/1,
	enemy_monsta_health/2,
	curr_monsta/1,
	curr_monsta_health/2,
	in_battle/1
	).

in_battle(0).
%% Initial value
enemy_monsta('').
enemy_monsta_health('',0).
curr_monsta('').

/* Available instruction */
battle_inst(bag).
battle_inst(attack).
battle_inst(special_attack).
battle_inst(pick(_)).  %% masi bingung implementasi
battle_inst(run).
battle_inst(fight).
battle_inst(use(_)).
battle_inst(use(_,_)).

battle_command :- 
	in_battle(0),
	write('Lu goblok will'),nl,!.
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
affinity(X,X, draw).

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
	list_monsta(L),
	%% pick pokemon
	tab(3),format('Go ~a!!',['Monsta']),nl,
	battle_menu.

%% Misahin Battle 
battle_menu:-
	tab(3), write('What are you gonna do? (Type with Prolog syntax)'),nl,
	tab(3),write('->'),tab(2), write('fight.'),nl,
	tab(3),write('->'),tab(2), write('run.'),nl,
	repeat,
	tab(3),write('->'),tab(2), read(Ins),
	member(Ins, [fight, run]),
	Ins,
	end_battle_menu_condition(Ins).

%% battle menu condition ends.
end_battle_menu_condition(fight).
end_battle_menu_condition(run).

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
run(X,Bool) :-
	in_battle(0),
	X < 7,
	Bool = true,
	tab(3),write('Escape successful !'),nl,!.
run(X,Bool) :-
	Bool = false,
	tab(3),write('Escape unsuccessful !'),nl.

/* Validate battle commands */
battle_user_in(X):-
	\+battle_inst(X),
	write('Invalid battle commands. Please try again!'),nl.

battle_user_in(X):-
	battle_inst(X),
	X.

/* Main Battle Instruction */
fight :-
	in_battle(1),
	write('error Will'),nl,!.

fight :-
	in_battle(0),
	retract(in_battle(0)),
	asserta(in_battle(1)),
	%% add battle commands : attack, special attack, bag, run 
	repeat,
	battle_command,
	tab(3),
	write(' -> '),
	read(Ins),nl,
	battle_user_in(Ins),nl,
	in_battle(0).

%% Setup : pick up monsta
%% means you can withdraw instantly to
pick(X):- 
	list_monsta(L),
	member(Monsta,L),
	retract(curr_monsta(_)),
	asserta(curr_monsta(Monsta)),
	tab(3),write('Switched Monsta'),nl.

%% Setup for enemies
enemy_setup(X):-
	retract(enemy_monsta(_)),
	retract(enemy_monsta_health(_)),
	monsta_health(X,Health),
	asserta(enemy_monsta(X)),
	asserta(enemy_monsta_health(Health)).

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
	Damage is round((OwnedAttack - round(0.5 * EnemiesDefense))* Affinity),
	NewHealth is EnemyHealth - Damage,
	retract(enemy_monsta_health(EnemyMonsta, EnemyHealth)),
	asserta(enemy_monsta_health(EnemyMonsta, NewHealth)),
	enemy_monsta_checker.

%% attack for enemy 
enemy_attack :- 
    in_battle(1),
	%% get monsta attack + affinity
	curr_monsta(OwnedMonsta),
	monsta_owned_health(OwnedMonsta, OwnedHealth),
	monsta_defense(OwnedMonsta, OwnedDefense),
	monsta_affinity_type(OwnedMonsta, OwnedAffinity),
	%% get enemies defense + affinity 
	enemy_monsta(EnemyMonsta),
	monsta_attack(EnemyMonsta,EnemyAttack),
	monsta_affinity_type(EnemyMonsta, EnemyAffinity),
	%% use the affinity_checker
	affinity_checker(EnemyAffinity, OwnedAffinity, AffinityBalance),
	%% decrease the amount of health by the attack
	Damage is round((EnemyAttack - round(0.5 * OwnedDefense))* Affinity),
	NewHealth is OwnedHealth - Damage,
	retract(monsta_owned_health(OwnedMonsta,OwnedHealth)),
	asserta(monsta_owned_health(OwnedMonsta,NewHealth)),
	curr_monsta_checker.

%% special_attack : exclusive only when monsta become your slave
special_attack :-
    in_battle(1),
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
	Damage is round((OwnedAttack - round(0.5 * EnemiesDefense))* Affinity),
	NewHealth is EnemyHealth - Damage,
	retract(enemy_monsta_health(EnemyMonsta, EnemyHealth)),
	asserta(enemy_monsta_health(EnemyMonsta, NewHealth)),
	format('Take this!! ~a',[OwnedAttackName]),nl,
	%% cek uda mati atau belum
	enemy_monsta_checker.

%% checker if the current monsta die
curr_monsta_checker:- 
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
	asserta(curr_monsta('')).

%% checker for eney monsta 
enemy_monsta_checker:-
	in_battle(1),
	enemy_monsta(M),
	enemy_monsta_health(M,Health),
	Health =< 0,
	retract(enemy_monsta(M)),
	retract(enemy_monsta_health(M,_)),
	asserta(enemy_monsta('')),
	asserta(enemy_monsta_health('',0)).

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
	in_battle(1),
	list_monsta(L),
	countMonsta(L,X),
	X < 6,
	enemy_monsta(M),
	enemy_monsta_health(M,Health),
	format('You have captured ~a!!',[M]),
	append(L,[M],LNew),
	retract(list_monsta(L)),
	asserta(list_monsta(LNew)),
	asserta(monsta_owned(M)),
	asserta(monsta_owned_health(M,Health)),
	format('Congratulation, you have successfully make ~a your slave!!', [M]),nl,
	retract(in_battle(1)),
	asserta(in_battle(0)),
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







