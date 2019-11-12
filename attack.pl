%% attack for player
attack :-
    in_battle(1),
    faster,
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
	write('Monsta has attacked opponent monsta!'),nl,
	battle_checker,
	enemy_attack,
	status,!.

attack :-
    in_battle(1),
    \+faster,
    enemy_attack,
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
	write('Monsta has attacked opponent monsta!'),nl,
	battle_checker,
	status.



%% special_attack : exclusive only when monsta become your slave
special_attack :-
	in_battle(1),
	special_out(1),
	write('Your monsta tried to use the special attack'),nl,
	write('But it failed'),nl,!.

special_attack :-
    in_battle(1),
    special_out(0),
    faster,
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
	status,!.

special_attack :-
    in_battle(1),
    special_out(0),
    \+faster,
    enemy_attack,
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
	status,!.


%% checker if the current monsta die
battle_checker:- 
	in_battle(1),
	list_monsta(L),
	curr_monsta(M),
	monsta_owned_health(M,Health),
	Health =< 0,
	write('Oh no, your monsta unable to continue living!'),nl,
	write('Your monsta died!!'),nl,
	delete(L,M,NewL),
	retract(monsta_owned(M)),
	retract(monsta_owned_health(M,Health)),
	retract(curr_monsta(M)),
	retract(list_monsta(L)),
	asserta(list_monsta(NewL)),
	asserta(curr_monsta('')),
	retract(monsta_out(1)),
	asserta(monsta_out(0)),
	numMonsta(X),
	X1 is X - 1,
	retract(numMonsta(X)),
	asserta(numMonsta(X1)),
	die_checker,!.

%% battle_checker (for legendary only)
battle_checker:-
	in_battle(1),
	enemy_monsta(M),
	member(M,['Legendary GreatForestmon','Legendary CrimsonDragonmon','Legendary AzureSharkmon']),
	enemy_monsta_health(M,Health),
	Health =< 0,
	write('You have defeated one of the almighty Legendary Monsta'),nl,
	write('You win!!'),nl,
	retract(enemy_monsta(M)),
	retract(enemy_monsta_health(M,_)),
	asserta(enemy_monsta('')),
	asserta(enemy_monsta_health('',0)),
	retract(in_battle(1)),
	asserta(in_battle(0)),
	retract(monsta_out(1)),
	asserta(monsta_out(0)),
	legendary_to_beat(Z),
	Z1 is Z - 1,
	retract(legendary_to_beat(Z)),
	asserta(legendary_to_beat(Z1)),
	!.

%% checker for enemy monsta 
battle_checker:-
	in_battle(1),
	enemy_monsta(M),
	\+member(M,['Legendary GreatForestmon','Legendary CrimsonDragonmon','Legendary AzureSharkmon']),
	enemy_monsta_health(M,Health),
	Health =< 0,
	write('Enemy Monsta unable to continue living'),nl,
	write('You win!!'),nl,
	retract(enemy_monsta(M)),
	retract(enemy_monsta_health(M,_)),
	asserta(enemy_monsta('')),
	asserta(enemy_monsta_health('',0)),
	retract(in_battle(1)),
	asserta(in_battle(0)),
	retract(monsta_out(1)),
	asserta(monsta_out(0)),
	!.

battle_checker :- in_battle(1).

die_checker:-
	in_battle(1),
	numMonsta(X),
	X == 0,
	write('Oh no, that was your last monsta'),nl,
	retract(enemy_monsta(M)),
	retract(enemy_monsta_health(M,_)),
	asserta(enemy_monsta('')),
	asserta(enemy_monsta_health('',0)),
	retract(in_battle(1)),
	asserta(in_battle(0)),
	die,!.

%% checking who is faster
faster:-
	curr_monsta(OwnM),
	enemy_monsta(EnemyM),
	monsta_speed(OwnM,OwnSpeed),
	monsta_speed(EnemyM,EnemySpeed),
	OwnSpeed >= EnemySpeed.
