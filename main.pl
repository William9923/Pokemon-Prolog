%% ini dynamic siapa yang rubah, gw bunuh lu pada ngehe!!
:- dynamic( 
		letak_player/2,
		list_monsta/1,
		monsta_owned/1,
		monsta_owned_health/2,
		player_bag/1, 
		checkStart/1,
		checkGym/1,
		numMonsta/1,
		numItems/1,
		enemy_monsta/1,
		curr_monsta/1,
		enemy_monsta_health/2,
		in_battle/1,
		monsta_out/1,
		special_out/1,
		legendary_to_beat/1,
		cave/2,
		vs_legend/0,
		whiteLilyPerfumeC/1,wlEffect/1
		).


/*Importing other files*/
:- include(monsta).
:- include(map).
:- include(inventory).
:- include(status).
:- include(random).
:- include(gym).
:- include(start).
:- include(enemy).
:- include(pick).
:- include(run).
:- include(capture).
:- include(status).
:- include(attack).
:- include(battle).
:- include(move).
:- include(use).
:- include(affinity).
:- include(legendary).
:- include(saveload).


:- initialization(nl).
:- initialization(write('Type "start." to start the game!')).
:- initialization(nl).
:- initialization(write('Use load_game(filename.pl) to load previous saved game data!')).
:- initialization(nl).
/* 'Type "start" to begin' */


%% Initialize the start game state
checkStart(0).
checkGym(0).
legendary_to_beat(3).
cave(18,17).
%% Initial value
in_battle(0).
monsta_out(0).
special_out(0).
enemy_monsta('').
enemy_monsta_health('',0).
curr_monsta('').
numMonsta(1).
numItems(1).


/* Player starting position */
%% player current position, initial : (11,3)
letak_player(18,16).


/* Player First Monsta*/
list_monsta(['Dragonflymon']).
monsta_owned('Dragonflymon').
monsta_owned_health('Dragonflymon',150).
%% gym location : (8,5)
gym(8,5).

/* Dummy Items */
items(whiteLilyPerfume).

/* initializing items and count item */

whiteLilyPerfumeC(10).

/* Bag Items */
%% player_bag([]).
%% Dummy Bag Items
player_bag([whiteLilyPerfume]).

/* Drop monsta */
%% if only 1 monsta owned
drop(_) :-
	numMonsta(1),
	write('You cannot release your last monsta.'),nl,!.
%% do not have that monsta
drop(M):-
	\+monsta_owned(M),
	write('You do not have that monsta.'),nl,!.
%% bisa delete monsta
drop(M):-
	format('You have release ~a',[M]),nl,
	list_monsta(L),
	numMonsta(X),
	X1 is X - 1,
	delete(L,M,NewL),
	retract(list_monsta(L)),
	asserta(list_monsta(NewL)),
	retract(monsta_owned(M)),
	retract(monsta_owned_health(M,_)),
	retract(numMonsta(X)),
	asserta(numMonsta(X1)).

/***** PLAYER'S Tokeomon ALIVE/DEATH STATE *****/
/* Game over */
die :- 
	write('The monsta eats your leg'), nl,
	write('You suddenly lost your feel in your chest'), nl,
	write('You take your last breath'), nl,
	write('You DIED - Game Over'),nl,
	write('Then you realized that you are in a dream'),nl,
	quit, abort.
/* 'The monsta eats your legs' */
/* 'You suddenly lose all feeling in your chest and breathe your last breath.' */
/* 'YOU DIED - GAME OVER' */

/* Win Games - catch 2 legendary*/
win :- 
	nl,
	write('You have defeated 3 most powerful monsta in the whole MonstaWorld universe'), nl,
	write('But, then you realized that all monsta is actually really good'),nl,
	write('You were manipulated by the evil professor Sugiono to capture all this good creature'),nl,
	write('Using the power given by those 3 legendary monsta, you destroy the professor and all his creation'), nl,
	write('From now on, you will protect the safety of all monsta'), nl,
	write('THE END'),
	retract(checkStart(1)),
	asserta(checkStart(0)),
	abort.
/* 'You have collected two of the most powerful monstas in the world' */
/* 'But then, you realized that monstas aren't actually as bad as you were led to believe' */
/* 'You were manipulated by the professor to capture these creatures' */
/* 'Using the power of the Legendaries, you manage to defeat the professor' */
/* 'From now on, you will protect the monstas' */
/* 'THE END' */

/* Quitting games*/
quit:-
	checkStart(1),
	retract(checkStart(1)),
	asserta(checkStart(0)),
	write('You have quitted from the monsta great world.'),nl,
	write('Welcome to the normal world again'), nl,
	load_internal('default.pl'),!.
quit:- 
	write('The game has not even started yet, type "start" to begin'),nl.
/* 'You have left the great MonstaWorld' */
/* 'Welcome back to regular reality' */

/* 'The game hasn't even started yet, type "start" to begin' */