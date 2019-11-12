%% Setup for enemies
enemy_setup(X):-
	monsta_health(X,Health),
	retract(enemy_monsta(_)),
	retract(enemy_monsta_health(_,_)),
	asserta(enemy_monsta(X)),
	asserta(enemy_monsta_health(X,Health)).
%% attack for enemy 
%% for out of battle condition (error prevention)
enemy_attack:-
	in_battle(0).
%% in battle condition enemy attack
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
	Damage is round((EnemyAttack - (0.2 * OwnedDefense))* AffinityBalance),
	NewHealth is OwnedHealth - Damage,
	retract(monsta_owned_health(OwnedMonsta,OwnedHealth)),
	asserta(monsta_owned_health(OwnedMonsta,NewHealth)),
	write('Opponent has attacked your monsta!'),nl,
	battle_checker,
	next_turn.
/* 'A challenger has appeared!. Defend yourself!.' */

%% for applying next turn condition
next_turn:-
	retract(capture_counter(_)),
	retract(run_counter(_)),
	asserta(capture_counter(0)),
	asserta(run_counter(0)).