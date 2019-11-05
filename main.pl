:- dynamic(letak_item/3, 
		letak_player/2,
		list_monsta/1,
		monsta_owned/3, 
		player_bag/1, 
		checkStart/1,
		letak_item/3).


/*Importing other files*/
:- include(command).
:- include(tokemon).
:- include(map).
:- include(list).
:- include(inventory).
:- include(status).
:- include(start).
:- include(use).
:- include(random).
:- include(text).
:- include(skill).
:- include(modifier).
:- include(fail).
:- include(gym).
:- include(goal).

:- initialization(nl).
:- initialization(write('Write "start." to start the game!')).
:- initialization(nl).

%% Initialize the start game state
checkStart(0).

/* Player starting position */
%% player current position, initial : (11,3)
letak_player(11,3).

/* Player Bags*/
player_bag([]).

%% gym location : (8,5)
gym(8,5).

/* Dummy Items */
letak_item(panadol,10,10).
letak_item(tikus_mati,11,11).
letak_item(potion, 12,12).
letak_item(antidote, 13,13).

medicine(potion).
medicine(antidote).

keyitems(tikus_mati).
keyitems(panadol).

/* Bag Items */
%% player_bag([]).
%% Dummy Bag Items
player_bag([panadol, manisan, asinan]).

/* Map size */

/***** PLAYER'S Tokeomon ALIVE/DEATH STATE *****/


/* Game over */
die :- 
	write('The monsta eats your leg'), nl,
	write('You suddenly lost your feel in your chest'), nl,
	write('You take your last breath'), nl,
	write('You DIED - Game Over'),nl,
	write('Then you realized that you are in a dream'),nl,
	quit, abort.

/* Win Games - catch 2 legendary*/
win :- 
	nl,
	write('You have collected 2 most powerful tokemon in the whole universe'), nl,
	write('But, then you realized that all tokemon is actually really good'),nl,
	write('You were manipulated by the evil professor to capture all this good creature'),nl,
	write('Using those 2 legendary tokemon, you destroy the professor and all his creation'), nl,
	write('From now on, you will protect the safety of all tokemon'), nl,
	write('THE END'),
	retract(checkStart(1)),
	asserta(checkStart(0)),
	abort.

/* Quitting games*/
quit:-
	checkStart(1),
	retract(checkStart(1)),
	asserta(checkStart(0)),
	write('You have quitted from the monsta great world.'),nl,
	write('Welcome to the normal world again'), nl.
quit:- 
	write('Game belum dimulai. Ketik "start." untuk memulai game.'),nl.



































